# n8n

**Stand:** 2026-07-26. Automatisierungsplattform. Sarahs Nachschlage-
Notiz.

## In einem Satz

n8n ist eine Open-Source-Plattform, mit der du per Klick-Editor
**Ablaeufe zwischen Programmen** baust ("wenn A passiert, dann tue B,
dann C") und diese Ablaeufe dauerhaft auf einem Server ausfuehren
laesst - vergleichbar mit Zapier, aber ohne Zwang zum Cloud-Anbieter
und mit Sprachmodell-Bausteinen als integraler Teil.

## Der technische Kern

n8n ist eine **Node.js-Anwendung** mit einer Web-Oberflaeche. Du oeffnest
die Oberflaeche im Browser und ziehst dort **Knoten** (Nodes) auf eine
Leinwand - jeder Knoten ist ein Programmschritt (E-Mail abrufen,
Kalendereintrag anlegen, Datei speichern, KI-Modell abfragen, Nachricht
senden). Die Knoten verbindest du mit Linien. Das Ergebnis ist ein
**Workflow**.

n8n kann diesen Workflow

- **auf Ereignis** ausloesen (Webhook, eingehende E-Mail, neue Zeile in
  einer Tabelle),
- **zeitgesteuert** ausloesen (jeden Montag um 8 Uhr),
- **manuell** ausloesen (Testknopf).

Zur Zeit unterstuetzt n8n **500 bis 1.400 vorgefertigte Anschluesse**
(Zahlen schwanken je nach Zaehlweise), unter anderem Gmail, Outlook,
Google Kalender, Notion, GitHub, alle grossen KI-Anbieter, Telegram,
Signal, Slack, Datenbanken (Postgres, MySQL, MongoDB), Cloud-Speicher
(S3, Google Drive, Dropbox).

Fuer Sonderfaelle gibt es einen **Code-Knoten**, in dem du JavaScript
oder Python einbetten kannst. Damit kann man alles machen, was die
vorgefertigten Bausteine nicht abdecken.

## Was n8n von Zapier unterscheidet

**Zapier** ist ein reiner Cloud-Dienst. Du hast keinen Zugriff auf die
Ausfuehrungs-Umgebung. Preisgestaltung: pro **Schritt** in jedem Ablauf
- teuer bei komplexen Workflows.

**n8n** ist Open Source und laesst sich selbst hosten. Preisgestaltung
bei Selbstbetrieb: nur die Serverkosten (typisch **5-10 USD/Monat** fuer
einen kleinen VPS). Preisgestaltung fuer Cloud-Version: pro **kompletter
Ablauf**-Ausfuehrung, nicht pro Schritt.

Konsequenz: n8n ist bei mittleren und grossen Workflows deutlich
guenstiger und flexibler als Zapier, verlangt aber mehr Einrichtungs-
arbeit.

## Preise und Lizenzen

**Community Edition** (selbst gehostet):

- Kosten: 0 USD Software-Lizenz. Nur Server-Betriebskosten
  (5-15 USD/Monat).
- Enthaelt: alle Kern-Funktionen, alle Knoten, unbegrenzte Workflows,
  unbegrenzte Ausfuehrungen.
- Fehlt: Team-Features (mehrere Nutzer mit unterschiedlichen Rechten,
  Audit-Log), einige Enterprise-Extras.

**Cloud** (n8n hostet):

- Starter: 20 USD/Monat, 2.500 Ausfuehrungen.
- Pro: 50 USD/Monat, 10.000 Ausfuehrungen.
- Business: hoehere Stufen fuer Unternehmen.
- Vorteil: keine Servertechnik-Arbeit noetig.

**Selbst gehostet mit Business-Lizenz**:

- Zusaetzlich zur Serverkosten: Business-Lizenzgebuehr fuer
  Enterprise-Features. Braucht Kontakt mit n8n.

Alle Cloud-Modelle rechnen pro **Workflow-Ausfuehrung**, nicht pro
Schritt in einem Workflow.

## Was du damit bei Automagia bauen koenntest

Konkrete Beispiele, die zu Sarahs Landschaft passen:

- **Chantal + Turiya + Chefkoch verketten**: Chantal recherchiert einmal
  woechentlich Reiseangebote, Turiya schreibt einen persoenlichen
  Kommentar dazu, Chefkoch legt das Ergebnis in einem Ordner ab und
  sendet Sarah eine Zusammenfassung.
- **Immobilien-Monitor Italien**: n8n prueft alle 24 Stunden bestimmte
  Immobilien-Websites, filtert nach Sarahs Kriterien, sendet neue
  Treffer per Telegram.
- **Rechnungen sortieren**: eingehende PDFs im E-Mail-Postfach werden
  automatisch nach Kunde/Kategorie in Ordner einsortiert, wichtige
  Betraege in eine Tabelle eingetragen.
- **KI-News-Aggregator**: n8n sammelt taeglich Beitraege aus RSS-Feeds
  und KI-News-Seiten, laesst Gandalf sie kurz kommentieren, schreibt
  eine Wochenzusammenfassung.
- **Formular-zu-Agent**: ein Kontaktformular auf einer Webseite loest
  einen Workflow aus, der die Anfrage priorisiert und an den passenden
  Agenten weiterleitet.

## Vor- und Nachteile im Ueberblick

**Fuer n8n spricht:**

- Open Source, keine Anbieterabhaengigkeit.
- Selbst hostbar, Datenhoheit bleibt bei dir.
- Preiswert bei viel Nutzung.
- Sehr grosse Bibliothek fertiger Anschluesse.
- Sprachmodelle sind erstklassig integriert.

**Gegen n8n spricht:**

- Erfordert einen Server (VPS oder Torstens Homelab).
- Erste Workflows brauchen 1-2 Tage Lernzeit, auch mit Klick-Editor.
- Nicht selbstlernend - jeder Ablauf muss einmal aufgebaut werden.
- Fehlersuche in komplexen Workflows kann muehsam werden.

## Wo es zu Automagia gehoeren wuerde

Wenn Sarah n8n produktiv nutzen wollte, boeten sich drei Wege:

1. **Cloud-Konto** bei n8n selbst (Starter fuer 20 USD/Monat) - null
   Betriebsaufwand.
2. **Selbst gehostet auf S2** (89.116.39.197) - S2 ist derzeit fast leer
   (nur der tote Egon-Slot), waere ein guter Kandidat fuer eine
   eigene n8n-Instanz.
3. **Auf einem eigenen Mini-VPS** - fuer 5 USD/Monat gibt es einen
   Server, der n8n locker traegt.

Empfehlung fuer den Anfang: **Cloud-Starter** ausprobieren (20 USD, ein
Monat), dann bei Gefallen auf Selbstbetrieb umziehen.

## Naechster Schritt, falls interessant

Wenn Sarah n8n ernsthaft nutzen will, waere der sinnvolle Einstieg:

1. Ein bis zwei einfache Alltags-Workflows definieren (z. B. Immobilien-
   Monitor, wie oben skizziert).
2. Bei n8n.io ein Cloud-Konto anlegen, Starter-Plan.
3. Zwei Stunden gemeinsame Konfiguration - Gandalf assistiert, Torsten
   uebernimmt die technischen Feinheiten.
4. Nach vier Wochen Auswertung: bleiben in der Cloud oder Umzug auf
   eigenen Server?

## Quellen

- Offiziell: `n8n.io`, `n8n.io/pricing`
- `automationbyexperts.com/blog/n8n-ai-workflow-automation-guide-2026`
- `aiunpacker.com/blog/complete-guide-to-ai-workflow-automation-with-n8n`
- `openhosst.com/blog/n8n-self-hosted-pricing`
- `sliplane.io/blog/n8n-pricing`
- `dev.to/jangwook_kim_e31e7291ad98/how-to-self-host-n8n-with-docker`
- `hatchworks.com/blog/ai-agents/n8n-guide`
