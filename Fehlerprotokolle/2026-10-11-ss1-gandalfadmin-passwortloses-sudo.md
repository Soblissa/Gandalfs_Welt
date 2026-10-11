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

Slarti entfernte als Root `/etc/sudoers.d/90-gandalfadmin`. Gandalf verifizierte
um 06:43 UTC anschliessend live:

- Die Drop-in-Datei ist nicht mehr vorhanden.
- `sudo -k; sudo -n true` wird erwartungsgemaess abgewiesen.
- Das lokal hinterlegte Passwort ermoeglicht weiterhin sudo bis UID `0`.
- `visudo -cf /etc/sudoers` bestaetigt eine gueltige sudoers-Konfiguration.

## Backups

Gandalf legte kein Backup an, da Slarti die Datei selbst als Root entfernte.
Ob Slarti zuvor ein separates Backup erstellte, ist nicht bekannt. Die
weiterhin vorhandene Passwortregel steht in `/etc/sudoers`.

## Lernpunkte

- `sudo -l` muss auf doppelte Regeln geprueft werden; eine Passwortregel neben
  `NOPASSWD: ALL` stellt die Passwortpflicht nicht wieder her.
- Vor dem Entfernen eines administrativen sudo-Wegs muessen Passwort und
  Rueckrollpfad verifiziert sein.

## Offene Punkte

- Keine technischen Punkte offen.
