# Wochenbericht VPS und KI-Lage – 17.10.2026, 06:01–06:07 UTC

## Fakten

### S1 – 147.93.120.51

- Per SSH als `gandalf-ro` erreichbar; Laufzeit 20 Tage 23 Stunden. Last `0,03 / 0,08 / 0,03`, RAM 2,9 von 15 GiB, Root-Platte 35 von 193 GiB (19 %).
- SSH, Docker, Tailscale und die OpenClaw-Gateways `chantall`, `cheko` und `user2` laufen. `lightdm.service` ist fehlgeschlagen.
- 25 reguläre Updates sind installierbar, 5 weitere werden zurückgehalten bzw. gestaffelt angeboten; automatische Updates sind aktiviert und ein Neustart ist angefordert.
- Das für `gandalf-ro` sichtbare Wochenjournal zeigt nur drei PipeWire/JACK-Warnungen. Vollständige System-/SSH-Logs und Firewallregeln sind mangels erhöhter Leserechte nicht geprüft.
- An allen Interfaces lauschen unter anderem SSH 22, Web 80/443, SMB 139/445, VNC 5919 sowie OpenClaw-/Proxy-Ports 19870, 19953, 29840 und 29953.

### S2 – 89.116.39.197

- ICMP antwortet; TCP 22, 80 und 443 sind erreichbar.
- Kein Read-only-Zugang: Last, RAM, Platte, Dienste, Updates, Logs, Firewall und innere Sicherheitslage sind **nicht geprüft**.

### S3 – lokal, 187.124.191.206

- Erreichbar; Laufzeit 13 Tage. Last `2,15 / 0,88 / 0,36`, RAM 3,3 von 15 GiB, Root-Platte 40 von 197 GiB (22 %).
- SSH, Docker, Tailscale sowie die Gateways `gandalf`, `konfuzius` und `turyia` laufen. Keine Updates offen; automatische Updates sind aktiviert.
- `c3pool_miner.service` ist weiterhin aktiviert und fehlgeschlagen. Die bekannten Malware-IoCs `ssshd` und `myservices.service` sind nach der Wiederherstellung nicht vorhanden.
- Öffentlich gebunden sind unter anderem SSH 22, TCP 11435 sowie OpenClaw-/Proxy-Ports 29941 und 29951. Firewallregeln und vollständige System-/SSH-Logs waren ohne Rootrechte nicht lesbar.
- OpenClaw-Audit: 0 kritisch, 5 Warnungen. Wesentlich sind gemeinsame Telegram-/Nextcloud-DM-Sitzungen, weitreichende Werkzeuge ohne vollständige Sandbox und ein fehlgeschlagener Gateway-Probe auf `127.0.0.1:18789`.
- Das Backup soll vor dem Angriff vom 05.09. stammen; die damals auf S3 vorhandenen Secrets waren laut letzter dokumentierter Bestätigung vom 11.10. noch nicht rotiert.

### S4 – 167.235.129.145

- ICMP antwortet; TCP 22 ist erreichbar, TCP 80/443 antworteten nicht.
- Kein Read-only-Zugang: Last, RAM, Platte, Dienste, Updates, Logs, Firewall und innere Sicherheitslage sind **nicht geprüft**. Der früher festgestellte geänderte SSH-Hostschlüssel ist nicht unabhängig verifiziert.

## Vermutung

- Provider-Firewalls könnten die an allen Interfaces gebundenen Listener auf S1/S3 begrenzen; heute belegt ist das nicht.
- Erreichbare Ports auf S2/S4 belegen weder Hostidentität noch Systemgesundheit.

## Rat

1. S3-Secrets von einem sauberen System rotieren; danach Passwort-SSH, Firewall, öffentliche Gateways und Miner-Altlast kontrolliert härten.
2. S1 im freigegebenen Wartungsfenster aktualisieren; anschließend `lightdm`, SMB, VNC und die öffentlichen Proxy-Ports prüfen.
3. Für S2/S4 Read-only-Zugänge einrichten und den S4-Hostschlüssel unabhängig bestätigen.

## KI-Lage der Woche, 10.–17.10.2026

- **Google, 13.10.:** Gemini 4 Argon wurde als neues Frontier-Modell für Entwickler und Unternehmen vorgestellt; Google veröffentlichte zugleich eine Sicherheitsdarstellung. [Google](https://news.google.com/rss/articles/CBMioAFBVV95cUxQSnlfSFAtZ3F0bFlnbTVkTUJHb2ZMa2ZLR2Q0Zm4wUi1yd0dPNjk0Z1dxalhMZ0x3WFpmNGF0bnA5SGpnalRXSFZEcjc0M2VsNjlHOFZtU1dVVUlrUGpNN24zLW02V0U0NFk5Z3dwbDZFcE1kS0ZSaFNxOHVHUWdTWURZSWIyUENmbXdjeTRwOGQ3SkhOSHMxaHlBMVpEbWw2?oc=5), [Reuters](https://news.google.com/rss/articles/CBMitgFBVV95cUxQclhsaXp4NUtqeVJDQTNIUjVXQVdJcnNXYnpYZUFTZm4wY3UxcTM1SzJvdzRBNE9HaURlNG1obzFGQ0o3R0pWNVJfNGFDOUdFZnhfdEJxSkszQ2hZQlowMjdCbVliRE9uX3A5ak1CYkJHOEV1elBYRWgtUHBwdF9lcWEyUGdjbmhQb2JONkpNeWhLTHgzQzRhRFRnZTEwcDRCa3k3RkpxY0c5Z1RsSlFCSmQwNmRmQQ?oc=5)
- **Meta, 12./15.10.:** Meta veröffentlichte Muse Wonder für Agenten und danach Muse Spark Open als großes Open-Weight-Modell; letzteres ist die wichtigste offene Modellveröffentlichung der Woche. [Meta – Muse Wonder](https://news.google.com/rss/articles/CBMic0FVX3lxTE91ZEsySi16NFVPeGtFbHE2SWRCalRUMjNWYnhKNVI2eFg3aC1ocEJwYWRvdC1zaHhYYXRWNjNna3FfOFQxZXZMMXhRcnpHSGpnR204cGpzMzcxQmxXUkZCcmNXNDFfUXNCTzlMQ2Nmb0ZHaWPSAXhBVV95cUxQd0VSRVJsQ2M3eEtsZXpISkd5VWlMRTlCd29BZ3E2MUNWWUNhczVIOEhMSFFaSjNuemNlZ3l4aW5QdjVBWG15d21rVlRGbV93eUgyVzZOa19tYjVuNktQVDZ4RGYzMjJQU3R4cUUzZFdkM0o3U2pLRUQ?oc=5), [Meta – Muse Spark Open](https://news.google.com/rss/articles/CBMiWEFVX3lxTFBxQTR0N0dqcHl2SFlORVRDWlZ2MFg3c1l3czJ5ZF9pQVJMd1FFcTBzTjdfQ00ydURKSVpESEloR2hhVzNJTkIyNU9XalpybnFmdWlJYjhHV0k?oc=5), [Reuters](https://news.google.com/rss/articles/CBMirAFBVV95cUxQRDgySGFsc1IyeDdOaXR4di1nZWVqa3BrR3hhN3g2S2dHMkoyUUxGS3ZRdG12SlRwY08tWE1EUjRSVjlLTGVuTE5icXhYYjM4Qnd3VGFwc0pnb1FVUFQ2UWlVTk5XTERoYkNYNXZZYldISnJiR0FCVmNJTF94bUp4Y0R3Q2Q1UWg4dHdJdVpWQWRXMEJjcTR3WThFYzFaTmFHcm5tMVVyZVdndFRp?oc=5)
- **Sicherheit, 14.10.:** Google DeepMind bezeichnete aktuelle KI-gestützte Angriffe als frühe Warnsignale; dies ist eine Risikoeinschätzung, kein neu bestätigter Zero-Day. [Reuters](https://news.google.com/rss/articles/CBMiswFBVV95cUxNRUpQLTQySlpPSFREYzVycnZUeHhKeWh5TFZTSmw0elFKaVB0THNKYU44eHdhQnJBOS1aNFk2MzlRblBlbzZEa0J4ZFk0VFkxaTdubmpWNVUwaFNwV3pkbHpHYU1XWFlaTGp1MU1vRlNMdkU0Tm9ZU3BweUktbDgxbktvWXl2UzZsVW93LVFPbkZyVDFudHQ2Z3FzQjM1bnZRa3RfbWQ1ME44RFBhVXJiM19aWQ?oc=5)
- **Regulierung:** In den geprüften Quellen fand sich diese Woche keine sicher bestätigte regulatorische Zäsur; die britische Debatte nahm jedoch sichtbar zu. [Financial Times](https://news.google.com/rss/articles/CBMihAFBVV95cUxQei05VnBhWmlfcWxGMlNjbU1hWHlKcTFRSmZuNHl5TU55ZFZXSFF6NXkwQmtvMDJjUHhEdXFJM3Z6bXVHcUdhek94NGkzclkwMUVsVzA0Rjl5U0tyNlJpSm04MTRqQTRZWG5Wb0ZJWmJCbHdKLXNfTzJWMlhRd2F6TkxHMTM?oc=5)

Quellen frisch abgerufen am 17.10.2026. Die bevorzugte Perplexity-Suche scheiterte am bereits protokollierten fehlenden API-Schlüssel; Google-News-RSS und verlinkte Primär-/Agenturquellen dienten als Ausweichweg.
