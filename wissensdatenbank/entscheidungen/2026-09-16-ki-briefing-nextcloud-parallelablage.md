# KI-Briefing: parallele Ablage in Nextcloud

- **Entscheidung:** Jedes regelmäßige KI-Kurzbriefing wird zusätzlich zum Telegram-Versand als ODT im Nextcloud-Arbeitsbereich abgelegt.
- **Ziel:** `GandalfWorkspace/20_Automagia-KI-News/<Jahr>/Automagia-KI-News-<Datum>.odt`
- **Technik:** `gandalf-ai-briefing.service` erzeugt weiterhin mittwochs um 08:00 UTC das quellengestützte Briefing. Ein eigener OpenClaw-Zeitplan rendert um 08:10 UTC mit `werkzeuge/render_ki_lage_odt.py` die archivierte Markdown-Fassung im einheitlichen Collabora-Schriftbild und kopiert sie in den Nextcloud-Ordner. Der getrennte Zeitplan ist nötig, weil der systemweite Dienst root-geschützt ist.
- **Gültig ab:** 16. September 2026; die Ausgabe dieses Tages wurde nachträglich erzeugt.
- **Zeitplan-ID:** `23a55a1d-f188-4486-ad0e-02e763d57f71`
