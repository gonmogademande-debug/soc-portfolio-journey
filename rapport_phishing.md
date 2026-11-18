# 🚨 Rapport d'Incident : Tentative de Phishing (Typosquatting)

## 📝 1. Résumé de l'incident
Une utilisatrice du service Finance a signalé un email suspect via le bouton de signalement de la messagerie. L'email usurpait l'identité du support Microsoft et incitait à cliquer sur un lien pour "éviter la suspension de compte". L'utilisatrice a cliqué mais n'a pas saisi ses identifiants.

## 🔍 2. Indicateurs de Compromission (IOC)
- **Expéditeur :** `support@micros0ft-security.com`
- **Objet :** URGENT : Facture Impayée - Votre compte sera suspendu
- **URL malveillante :** `http://micros0ft-security.com/login`
- **Type d'attaque :** Phishing / Typosquatting (utilisation d'un zéro à la place du "o" dans Microsoft).

## 🔬 3. Analyse technique (Red Flags)
1. **Typosquatting :** L'adresse email utilise un domaine frauduleux (`micros0ft` avec un zéro) imitant le vrai domaine (`microsoft.com`).
2. **Ingénierie sociale :** Le message utilise un ton urgent et menaçant (suspension de compte) pour pousser la victime à agir sans réfléchir.
3. **Lien non sécurisé :** L'URL utilise le protocole `http://` (non chiffré) au lieu de `https://`. 

## 🛑 4. Actions de Réponse (Incident Response)
1. **Vérification :** Soumission de l'URL sur **VirusTotal** pour confirmer qu'il s'agit d'un site de phishing référencé.
2. **Confinement (Messagerie) :** Recherche et suppression (Search & Destroy) de l'email malveillant dans toutes les boîtes de réception de l'entreprise.
3. **Confinement (Réseau) :** Blocage du domaine `micros0ft-security.com` sur le pare-feu et le proxy web.
4. **Éradication :** Lancement d'un scan EDR sur la machine de l'utilisatrice pour vérifier l'absence de malware (drive-by download).
5. **Sensibilisation :** Envoi d'un message de sensibilisation à l'utilisatrice (félicitations pour le signalement, mais rappel de ne pas cliquer sur les liens).

## 💡 5. Recommandations
- Déployer une passerelle de messagerie sécurisée (SEG) avec filtrage anti-phishing.
- Mettre en place des campagnes de sensibilisation régulières (ex: simulations de phishing).
- Activer le protocole DMARC sur le domaine de l'entreprise pour éviter l'usurpation d'identité.

---
*Rapport rédigé par KAI-ARLA - Analyste SOC Junior*
