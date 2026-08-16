# 2026-08-16 - Wochenbericht-Timer schickte nur den Prompt und Tool-Fehler leakte an Sarah

## Datum, Uhrzeit, betroffene Systeme
- **Datum:** 2026-08-16, gemeldet 05:15 UTC und 05:21 UTC
- **Vorfall 1 (Hauptfehler):** `gandalf-weekly.timer` (systemd-Timer auf S3), Skript `/usr/local/sbin/gandalf-weekly.sh`
- **Vorfall 2 (Nebeneffekt):** OpenClaw-Gateway von Gandalf (S3, Port 19941), Auslieferung von internen Tool-Fehlermeldungen an Sarah per Telegram

## Symptom
### Vorfall 1
- Jeden Samstag 06:00 UTC bekommt Sarah eine Nachricht per Telegram, die woertlich lautet:
  "*Wochenbericht bitte: Erreichbarkeit, Last, Plattenplatz, Dienste, Updates, ...*"
- Also den **Auftrag**, nicht den fertigen Bericht.
- Sarah wies mehrfach darauf hin ("Das Problem hatten wir gestern schon"), aber es lief seit Wochen unveraendert weiter.

### Vorfall 2
- Am 2026-08-16 05:20 UTC bekam Sarah zusaetzlich eine Nachricht:
  "*Edit: in /usr/local/sbin/gandalf-weekly.sh failed*"
- Kein Kontext, kein Absender ausser "Gandalf (@AutomagiaGandalf_bot)".
- Sarah stufte das als "merkwuerdige Nachricht" ein.

## Ursachen
### Vorfall 1
- `/usr/local/sbin/gandalf-weekly.sh` in der alten Fassung hat lediglich `curl` auf `api.telegram.org/bot<token>/sendMessage` ausgefuehrt und den Text `"Wochenbericht bitte: ..."` als `text=`-Parameter mitgeschickt.
- Es gab keinen Agent-Lauf, kein LLM, keine Auslieferung eines echten Berichts. Nur der Prompt wanderte durch.
- Vermutlich ein Zwischenstand aus der fruehen Bootstrap-Phase, der nie ersetzt wurde. Die Existenz eines fertigen Wochenberichts wurde stillschweigend an mich (Gandalf) als "reagier drauf, wenn du die Nachricht bekommst" delegiert -- was in einer Direct-Chat-Session unter Kontext-Truncation nicht mehr griff.

### Vorfall 2
- Ich versuchte, das Skript per `edit`-Tool auf `/usr/local/sbin/gandalf-weekly.sh` zu aendern.
- Die Datei gehoert `root:root`, mein Prozess laeuft als `gandalf` -- schreiben nur ueber `sudo` moeglich.
- Das `edit`-Tool gab `EACCES` zurueck.
- OpenClaws Auslieferungslogik hat diese fehlgeschlagene Tool-Meldung als eigenstaendige Nachricht an den aktuellen Kanal (Telegram Sarah) geschickt, ohne dass ich es bewusst gesendet haette.

## Fix
### Vorfall 1
- Neues Skript `/usr/local/sbin/gandalf-weekly.sh` (2026-08-16 05:16 UTC via `sudo bash << heredoc` geschrieben).
- Kern:
  ```bash
  openclaw agent \
    --session-id "weekly-<TS>-<chat>" \
    --message "$PROMPT" \
    --deliver \
    --reply-channel telegram \
    --reply-to "$chat"
  ```
- `--session-id` sorgt fuer eine eigene isolierte Session pro Lauf, damit kein Session-File-Lock mit der aktiven Sarah-Session entsteht.
- `--deliver` weist OpenClaw an, das Ergebnis selbst per Telegram auszuliefern -- kein manueller `curl` mehr.
- Test in einer Kurzform lief durch, Embedded-Fallback greift bei Gateway-Fehlern automatisch.
- Naechster planmaessiger Lauf: Samstag 2026-08-22 06:00 UTC.

### Vorfall 2
- Nach dem `edit`-Fehler direkt weiter mit `sudo bash` gearbeitet, Skript korrekt geschrieben.
- Fuer die Zukunft: bei Systemdateien in `/etc/`, `/usr/local/sbin/` etc. **direkt** ueber `sudo bash <<'EOF' ... EOF` schreiben, nicht ueber das `edit`-Tool. Das `edit`-Tool bleibt fuer Dateien im Workspace.
- Die Ursache der Weiterleitung an Sarah (OpenClaw-Verhalten) ist noch nicht abgestellt -- offener Punkt siehe unten.

## Backups
- Altes Skript: `/usr/local/sbin/gandalf-weekly.sh.bak.20260816T051612Z` (root:root, ausfuehrbar).

## Lernpunkte
- **Prompt-Skripte sind gefaehrlich, wenn niemand sie aufloest.** Ein Skript, das nur die Frage per Nachricht sendet, verlaesst sich darauf, dass am anderen Ende jemand mit vollem Kontext antwortet. In einer Session-basierten Umgebung mit Kontext-Truncation ist das keine verlaessliche Kette.
- **Systemdateien nie per `edit`-Tool anfassen.** `edit` versucht direkt zu schreiben und scheitert an Rechten. Fuer Root-Dateien immer den Zwei-Schritt: `sudo cp` (Backup), dann `sudo bash <<EOF` (neu schreiben).
- **Tool-Fehler koennen auf den Kanal durchschlagen.** OpenClaws Standardverhalten leitet Tool-Errors offenbar an den aktiven Kanal weiter, wenn er Sarah direkt betrifft. Wenn ich weiss, dass ich mit Root-Dateien arbeiten muss, gleich `sudo` nehmen, um solche Leaks zu vermeiden.
- **Alte Tokens in historischen Session-Logs bleiben liegen.** Beim Scan nach `AutomagiaGandalf_bot` sind mir in `user1`s Session-Logs auf S1 (Chefkoch) zwei alte API-Tokens (Figma, Brave) im Klartext aufgefallen. Sie sind nirgends mehr in aktiven Env-Dateien. Kein akuter Fehler, aber Hygienepunkt.

## Offene Punkte
1. **Skript-Verifikation naechster Samstag:** Bericht am 22.08.2026 06:00 UTC muss inhaltlich echt kommen, nicht der Prompt. Falls nicht: Log unter `/var/log/gandalf-weekly/run-<TS>.log` pruefen.
2. **Tool-Error-Leak an Kanal unterbinden:** OpenClaws Verhalten, fehlgeschlagene Tool-Aufrufe als eigenstaendige Nachrichten an den aktiven Chat zu senden, ist irritierend. Zu pruefen, ob es dafuer eine Config-Option gibt (`session.toolErrors.deliver` o. ae.). Aktuell reicht die Selbstdisziplin, `sudo` sofort einzusetzen.
3. **Alte Tokens auf S1 rotieren:** Figma-Token `figd_ZuLBYiT...` und Brave-Suggest-Token `BSAYe71jhrMfUlKNIHTC3PHr9reRBwh` in `user1`s Historie ersetzen; alte Session-Logs auf S1 archivieren oder loeschen.
4. **`openai-codex` OAuth-Refresh-Token abgelaufen** (Nebenbefund vom Testlauf am 16.08.). Muss reauthentifiziert werden -- kein akuter Fehler, weil Opus 4.7 als Primary greift.
5. **Gateway-URL-Cache im lokalen `openclaw`-CLI stimmt nicht** -- versucht Port 18789 statt 19941. Kein Ausfall dank Embedded-Fallback, aber unsauber. Zu pruefen, ob es eine gecachte Verbindungsdatei gibt.

## Referenz
- Wartungsnotiz: [`wissensdatenbank/wartung/2026-08-16-wochenbericht-timer-repariert.md`](../wissensdatenbank/wartung/2026-08-16-wochenbericht-timer-repariert.md)
- Konfuzius-Einrichtung (Kontext): [`wissensdatenbank/entscheidungen/2026-08-14-konfuzius-angelegt.md`](../wissensdatenbank/entscheidungen/2026-08-14-konfuzius-angelegt.md)
