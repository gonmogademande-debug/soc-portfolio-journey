# 🛡️ Cheat Sheet : Requêtes Splunk pour Analyste SOC

Ce document regroupe des requêtes SPL (Search Processing Language) prêtes à l'emploi pour la détection d'incidents courants.

## 1. Détection de Brute Force (Force brute)
**Scénario :** Détecter plusieurs échecs de connexion consécutifs sur un même compte.
```spl
index=windows_security EventCode=4625
| stats count by Account_Name, Source_Network_Address
| where count > 10
