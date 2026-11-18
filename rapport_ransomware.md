# 🚨 Rapport d'Incident : Attaque Ransomware (Chiffrement de données)

## 📝 1. Résumé de l'incident
Une alerte critique a été déclenchée par l'EDR sur le poste `PC-COMPTA-02`. Une activité de chiffrement massive a été détectée, avec plus de 500 fichiers renommés avec l'extension `.locked`. La propagation a atteint le serveur de fichiers partagé `SRV-FILE-01` avant l'isolation réseau.

## 🔍 2. Indicateurs de Compromission (IOC)
- **Machines affectées :** `PC-COMPTA-02` et `SRV-FILE-01`
- **Extension des fichiers chiffrés :** `.locked`
- **Fichier de rançon :** `HOW_TO_DECRYPT.txt` (demande de paiement en Bitcoin)
- **Vecteur probable :** Phishing (pièce jointe malveillante) ou faille RDP.

## 🔬 3. Analyse technique
Le ransomware s'est propagé latéralement via le réseau partagé. Le fichier de rançon exige un paiement en cryptomonnaie pour fournir la clé de déchiffrement. 
**Politique de l'entreprise :** Refus catégorique de négocier et de payer la rançon (financement du crime et aucune garantie de récupération).

## 🛑 4. Actions de Réponse (Incident Response)
1. **Confinement :** Isolement réseau immédiat des machines infectées (déconnexion du câble Ethernet / désactivation Wi-Fi). Laisser les machines allumées pour préserver la mémoire vive (RAM).
2. **Éradication :** Scan complet via l'EDR pour identifier et supprimer la charge utile du ransomware.
3. **Récupération (Le point critique) :** 
   - Vérification de l'intégrité des sauvegardes (Backups). S'assurer qu'elles sont saines et **hors ligne** (non chiffrées).
   - Restauration des données du serveur `SRV-FILE-01` via le Plan de Reprise d'Activité (PRA).

## 💡 5. Recommandations
- Appliquer la règle de sauvegarde **3-2-1** (3 copies, 2 supports, 1 hors site/air-gapped).
- Segmenter le réseau pour empêcher la propagation latérale des ransomwares.
- Sensibiliser les utilisateurs aux risques des pièces jointes (Phishing).
- Désactiver le protocole RDP s'il n'est pas nécessaire ou le sécuriser avec un VPN + MFA.

---
*Rapport rédigé par KAI-ARLA - Analyste SOC Junior*
