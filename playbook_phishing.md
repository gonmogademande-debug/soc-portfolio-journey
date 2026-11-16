# 🛡️ Playbook de Réponse à Incident : Phishing

## 🎯 Objectif
Ce document définit la procédure standard (SOP) qu'un Analyste SOC doit suivre lorsqu'une alerte de phishing (hameçonnage) est déclenchée.

## 🚨 Phase 1 : Détection et Triage
- **Alerte :** Signalement par un utilisateur ou détection par la passerelle de messagerie (SEG) / EDR.
- **Vérification des indicateurs (IOC) :** Analyser l'adresse email de l'expéditeur, les liens URL (via VirusTotal), et les pièces jointes (sandboxing).
- **Évaluation de la sévérité :** Est-ce un mail isolé ou une campagne massive ? L'utilisateur a-t-il cliqué ?

## 🛑 Phase 2 : Confinement (Containment)
- **Isolation :** Si l'utilisateur a cliqué, isoler immédiatement sa machine du réseau via l'EDR.
- **Blocage :** Bloquer l'adresse IP de l'expéditeur et les domaines malveillants sur le pare-feu (Firewall) et la passerelle mail.
- **Purge :** Supprimer l'email malveillant de toutes les boîtes de réception de l'entreprise (Search & Destroy).

## 🧹 Phase 3 : Éradication
- Changer les mots de passe de l'utilisateur compromis et révoquer ses sessions actives.
- Analyser la machine pour détecter d'éventuels malwares installés suite au clic (ex: infostealer).
- Mettre à jour les signatures antivirus.

## 🔄 Phase 4 : Récupération
- Restaurer les fichiers si des ransomwares ont chiffré des données (via les sauvegardes/PRA).
- Remettre la machine de l'utilisateur sur le réseau une fois qu'elle est certifiée saine.

## 📝 Phase 5 : Leçons apprises (Post-Incident)
- Rédiger un rapport d'incident.
- Mettre à jour les règles de détection du SIEM.
- Organiser une session de sensibilisation au phishing pour l'équipe concernée.
```
