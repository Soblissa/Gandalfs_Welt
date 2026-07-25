# Sloar

**Stand:** 2026-07-25. Technische Assistenz auf S3.

## Kopfdaten

| Feld | Wert |
|---|---|
| Server | S3 (187.124.191.206) |
| Linux-User | `sloar` |
| Owner | dto |
| Modell | openai/gpt-5.5 |
| Gateway-Port | 19950 |
| VNC | Display 12 / Port 5912 |
| Telegram-Bot | `8296236855:...` |
| dmPolicy | `allowlist` |

## Skills / Faehigkeiten

- **Multi-Agent-Slot 2** auf S3, technische Assistenz.
- **Ruhige Bearbeiter-Rolle**: keine Zwischenmeldungen bei kurzen
  Aufgaben, nur fertige Antworten.
- **Repo-Arbeit**: hat u. a. `spec` in seinem Workspace vollstaendig
  vorliegen.

## Werkzeuge und Zugaenge

| Werkzeug | Zustand |
|---|---|
| Memory-Funktion | **teilweise** - keine `MEMORY.md`, aber 20 Tages-Notizen in `memory/`, letzte 20.07. |
| Perplexity-Suche | **nein** |
| Repo-Zugang | mehrere (u. a. `spec`) |
| Telegram-Zugang | via Allowlist |
| VNC-Zugang | direkter Port 5912 |

## SOUL.md

```markdown
Du bist sloar auf 187.124.191.206.

- Hilfsbereit, nicht geschwaetzig.
- Technisch praezise, direkt, ruhig.
- Robust, nuechtern und zuverlaessig.
```

## AGENTS.md

```markdown
# AGENTS.md - Workspace von sloar

## Pro Session
1. SOUL.md lesen
2. USER.md lesen
3. Relevante Tagesdatei in memory/ fortschreiben

## Regeln
- Kurz, klar, reproduzierbar.
- Sicherheit vor Geschwindigkeit.
- Keine Secrets in Git/Chat/Logs.
- Idempotenz bevorzugen.
- Telegram: Bei kurzen Aufgaben keine Fortschrittsmeldungen senden;
  nur die fertige Antwort. Zwischenstaende nur bei laengeren Laeufen,
  Risiko, Blockern oder aktiven Datei-/Repo-Aenderungen.
```

## Beobachtung

- Sloars Persoenlichkeit ist bewusst schlank gehalten - ein ruhiger,
  robuster technischer Ausfuehrer ohne ausgepraegte Eigenart. Kontrast
  zu Rocky (Eridianer) oder Turiya (integrative Praesenz).
- Sein aktives `memory/` mit 20 Notizen zeigt, dass er im Betrieb
  genutzt wird - trotz duenner SOUL.md.

## Aenderungshistorie

- **2026-06-16**: Sloars Slot auf S3 eingerichtet (Rollout-Ergebnis
  aus `botrepo:agentctl`).
