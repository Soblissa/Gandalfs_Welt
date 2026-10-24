# Wochenbericht VPS und KI-Lage – 24.10.2026, 06:01–06:05 UTC

## Fakten

### S1 – 147.93.120.51

- Per SSH als `gandalf-ro` erreichbar; Laufzeit 6 Tage 6 Stunden. Last `0,00 / 0,00 / 0,00`, RAM 2,7 von 15 GiB, Root-Platte 32,3 von 192,7 GiB (17 %), Inodes 4 %.
- SSH, Docker, Tailscale sowie `openclaw-gateway@chantall`, `@cheko` und `@user2` laufen; ihre lokalen Hauptendpunkte antworten mit HTTP 200. `lightdm.service` ist weiterhin fehlgeschlagen.
- 44 Pakete sind aktualisierbar; die Simulation würde 36 installieren und 8 zurückhalten. Automatische Updates laufen, kein Neustart ist angefordert.
- Das für `gandalf-ro` sichtbare Wochenjournal enthält nur PipeWire/JACK-Warnungen. Vollständige System-/SSH-Logs und Firewallregeln sind mangels Leserechten nicht geprüft.
- An allen Interfaces lauschen unter anderem SSH 22, SMB 139/445, VNC 5919 sowie OpenClaw-/Proxy-Ports 19870, 19953, 29840 und 29953. HTTP 80/443 lauschen lokal, waren im externen Test aber nicht erreichbar.

### S2 – 89.116.39.197

- ICMP sowie TCP 22, 80 und 443 sind erreichbar.
- **Kein Read-only-Zugang:** Last, RAM, Platte, Dienste, Updates, Logs, Firewall und innere Sicherheitslage sind nicht geprüft.

### S3 – lokal, 187.124.191.206

- Erreichbar; Laufzeit 6 Tage 10 Stunden. Last `0,81 / 0,32 / 0,11`, RAM 2,4 von 15 GiB, Root-Platte 39,7 von 196,7 GiB (20 %), Inodes 4 %.
- SSH, Docker, Tailscale sowie die Gateways `gandalf`, `konfuzius` und `turyia` laufen; die lokalen Hauptendpunkte antworten mit HTTP 200.
- 6 Updates sind offen, darunter der Security-Fix `libbrotli1`; automatische Updates laufen, kein Neustart ist angefordert.
- `c3pool_miner.service` ist weiterhin aktiviert und fehlgeschlagen (`203/EXEC`). Die bekannten Malware-IoCs `ssshd`, `.locatione` und `myservices.service` fehlen.
- Öffentlich gebunden sind SSH 22, TCP 11435 sowie OpenClaw-/Proxy-Ports 29941 und 29951. Wirksame Firewall- und SSH-Gesamtkonfiguration sowie vollständige System-/SSH-Logs waren ohne Rootrechte nicht prüfbar.
- OpenClaw-Audit: 0 kritisch, 4 Warnungen. Wesentlich sind gemeinsame Telegram-/Nextcloud-DM-Sitzungen und weitreichende Werkzeuge ohne vollständige Sandbox.
- Das wiederhergestellte Backup stammt laut dokumentierter Bestätigung von vor dem Angriff am 05.09.; die damals exponierten Secrets waren zuletzt noch nicht rotiert.

### S4 – 167.235.129.145

- ICMP und TCP 22 sind erreichbar; TCP 80/443 antworteten nicht.
- **Kein Read-only-Zugang:** Last, RAM, Platte, Dienste, Updates, Logs, Firewall und innere Sicherheitslage sind nicht geprüft. Der früher festgestellte geänderte SSH-Hostschlüssel ist weiterhin nicht unabhängig bestätigt.

## Vermutung

- Provider- oder Host-Firewalls könnten die breit gebundenen Listener auf S1/S3 begrenzen; die wirksamen Regeln waren heute nicht lesbar.
- Erreichbare Ports auf S2/S4 belegen weder Hostidentität noch innere Systemgesundheit.

## Rat

1. S3-Secrets von einem sauberen System rotieren; anschließend Passwort-SSH, Firewall, öffentliche Gateways und den Miner-Altbestand kontrolliert härten.
2. S1 und S3 im freigegebenen Wartungsfenster aktualisieren; auf S1 danach `lightdm`, SMB, VNC und öffentliche Proxy-Ports prüfen.
3. Für S2/S4 Read-only-Zugänge schaffen und den S4-Hostschlüssel unabhängig bestätigen.

## KI-Lage der Woche, 17.–24.10.2026

- **Moonshot AI, 23./24.10.:** Kimi K3.1 Pro ist ein neues großes Frontier-/Open-Weight-Modell; laut Reuters wurden Cyberfähigkeiten bewusst begrenzt, die vollständigen Gewichte sollen erst im November folgen. [Reuters](https://news.google.com/rss/articles/CBMiuwFBVV95cUxQWlpZNXVZQXBxZ1hCTzA4X0VZYUh0QkhJb281X3VmMUt0VVZRY0N2N1Fja1dyZlB4cGlsTGktdjRaRzEzSDgtR01QS1F4V0ZsN0lsbzdTRjhRbG1MMlhfMkluTkxwTXFhOG1XZVVpRlRJX29ULXBEcUdTQUpoa2NkUmRMZFhDbkF3a0N3SDlqbTg1QnR3aFkwSW9LS181X0hsbXM1bXF2a0ZTWldQdlBMSlJRSzFoOGI2aFRF?oc=5)
- **KI und Cybersicherheit, 23.10.:** Reuters berichtet, dass KI-gefundene Schwachstellen kurzfristig neue Störungswellen auslösen könnten; OpenAI nahm zugleich Frontier-Training nach einer Sicherheitsüberarbeitung wieder auf und meldete eine Schwachstelle in weit verbreiteter Software. [Reuters – Schwachstellen](https://news.google.com/rss/articles/CBMiwgFBVV95cUxQV05wYl91MmowMUlxMjZkLXZBU25XR1h4ZWE5dnptMktPMDdkUnpWMkxpUFZrUUl6ajg2NjNlcVBaOTYwWEtqUkRTVlVIUGc1a3FoZjVwendXdm1DUTZxN05fNWkzblg2TEVFRkpKNnlTdjlpaWIzYkljMFFSYkRVa29uQkFWZWJOaWpFRV9ZWUJhSXBUa1NaLS1WZjJxcDQ4NmpHaXpFT2xLb1VYZWtSWElyT2xmTEg1V1FnMjE3NE5wQQ?oc=5), [Reuters – OpenAI](https://news.google.com/rss/articles/CBMivwFBVV95cUxQOS01OUZRS1hEaFFMU0pJSkEwdEVKQThtcVJITXJ6elVKbFVHV0QwQVFyc1VUb1NVZExxQ2J4YkN0MTVxS094bUFqdmZYa3QwSUprRjlVX3YwSkZfcEF5U1JEV0h0aWVjUldENHFIaEtZR0RPU3Y0WHpjQXFmRUw2SVROYXQ2NWwzZmNGWG9lcTdwYkhFd0NvY3poSG1YVHRfclVsMmZ0OXRDV245cmx3ckRFVENhZUJydkVXYjVrOA?oc=5)
- **Agentensicherheit, 19.10.:** Microsoft behandelt autonome KI-Agenten sicherheitlich wie interne Identitäten mit potenziell weitreichenden Rechten und stellte zusätzliche Überwachungsagenten vor. Das ist eine Architekturwarnung, kein bestätigter Zero-Day. [Microsoft](https://news.google.com/rss/articles/CBMifkFVX3lxTE11VDVDQVlSbkZxZHFibTFaM3pGaDhJTzNIWi05UUtNS2RGelJpQmZJZWlrakxrSDFNUTdBSmdHLW9ieFA2VElWdlVJdVAwZnItaDlUQkZzanJfdzZ3Skg3YWNINUQ4X3NEVFZod1lDYl9rVDhmMGpxQ1lLSTU5UQ?oc=5)
- **Regulierung:** Anthropic warb in Washington für einen Entwurf, der kurzfristige gerichtliche Stopps besonders riskanter Modelle ermöglichen würde. Dies ist ein Vorschlag, keine geltende Regel. [Reuters](https://news.google.com/rss/articles/CBMixwFBVV95cUxPOGgzckNkaE5BdjZxdVMta2hsdVczMHFrZ2U4aFgzY2VsLVF5VEFpd1FMQVc1V084YTZQU0IyMkdWbXZTbEtpdlhFWHR2SUI1SDdsczFmeERfNHhfOXRpR2NLTVhjRWF4YWNYaDBPWXJDSXpqLUgtSERBY1lHejU3MTl0T2pPMzlKRDlsdmFNM3kwQk1YSFlyMnpDN1FSVG0xM2xqNTZrbnNxQTVkT3drcVJSVm0zNFlYOUstZzlDYldrc1p5OWJR?oc=5)

Quellen frisch abgerufen am 24.10.2026. Die bevorzugte Perplexity-Suche scheiterte am bereits protokollierten fehlenden API-Schlüssel; Google-News-RSS und verlinkte Primär-/Agenturquellen dienten als Ausweichweg.
