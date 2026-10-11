# SS1: `gandalfadmin` besitzt unerwuenschtes passwortloses sudo

## Datum, Uhrzeit und System

- 2026-10-11, 06:36–06:40 UTC
- SS1 (`147.93.120.51`, Hostname `srv1492182`), Ubuntu 24.04

## Symptom

`gandalfadmin` konnte `sudo` ohne Passwortabfrage ausfuehren. Slarti stellte klar,
dass fuer dieses Administrationskonto eine Passwortabfrage verlangt sein soll.

## Ursache

- `/etc/sudoers` enthaelt bereits die gewuenschte normale Regel
  `gandalfadmin ALL=(ALL:ALL) ALL`.
- Die zusaetzliche Datei `/etc/sudoers.d/90-gandalfadmin` enthaelt jedoch
  `gandalfadmin ALL=(ALL:ALL) NOPASSWD: ALL` und uebersteuert die
  Passwortpflicht fuer alle Befehle.

## Fix

Noch nicht ausgefuehrt. Nach Sarahs Kenntnisnahme wird die Drop-in-Datei mit
Zeitstempel gesichert und entfernt. Danach werden `visudo -cf /etc/sudoers`,
ein negativ erwarteter `sudo -n`-Test sowie ein erfolgreicher sudo-Test mit
Passwort ausgefuehrt.

## Backups

Noch keines; auf SS1 wurde bislang nur gelesen.

## Lernpunkte

- `sudo -l` muss auf doppelte Regeln geprueft werden; eine Passwortregel neben
  `NOPASSWD: ALL` stellt die Passwortpflicht nicht wieder her.
- Vor dem Entfernen eines administrativen sudo-Wegs muessen Passwort und
  Rueckrollpfad verifiziert sein.

## Offene Punkte

- Sarahs Kenntnisnahme fuer die Zustandsaenderung auf SS1 einholen.
- `/etc/sudoers.d/90-gandalfadmin` sichern und entfernen; anschliessend beide
  Authentifizierungsfaelle live verifizieren.
