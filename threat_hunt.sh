#!/bin/bash

# =================================================================
# Script de Threat Hunting : Recherche d'Indicateurs de Compromission
# Auteur : KAI-ARLA (Analyste SOC)
# =================================================================

# Ce script simule une recherche d'IOC (Indicators of Compromise)
# dans un fichier de logs (ex: acces.log ou auth.log).

LOG_FILE="acces.log"
IOC_IP="192.168.1.100"     # IP suspecte à rechercher
IOC_DOMAIN="malicious.com" # Domaine suspect
IOC_HASH="d41d8cd98f00b204e9800998ecf8427e" # Hash MD5 suspect

echo "==================================================="
echo "[*] Démarrage de la chasse aux menaces (Threat Hunting)..."
echo "[*] Fichier ciblé : $LOG_FILE"
echo "==================================================="

# Vérification de l'existence du fichier
if [ ! -f "$LOG_FILE" ]; then
    echo "[-] Erreur : Le fichier $LOG_FILE est introuvable."
    echo "[-] Veuillez créer un fichier de test ou modifier la variable LOG_FILE."
    exit 1
fi

echo -e "\n[+] Recherche de l'adresse IP suspecte ($IOC_IP)..."
grep -n "$IOC_IP" "$LOG_FILE" && echo "[!] ALERTE : IP suspecte trouvée !" || echo "[-] Aucune trace de l'IP."

echo -e "\n[+] Recherche du domaine suspect ($IOC_DOMAIN)..."
grep -ni "$IOC_DOMAIN" "$LOG_FILE" && echo "[!] ALERTE : Domaine suspect trouvé !" || echo "[-] Aucune trace du domaine."

echo -e "\n[+] Recherche du hash malveillant ($IOC_HASH)..."
grep -n "$IOC_HASH" "$LOG_FILE" && echo "[!] ALERTE : Hash malveillant trouvé !" || echo "[-] Aucune trace du hash."

echo -e "\n[+] Recherche de commandes d'injection (Command Injection)..."
grep -niE "(whoami|cat /etc/passwd|nc -e|bash -i)" "$LOG_FILE" && echo "[!] ALERTE : Tentative d'injection détectée !" || echo "[-] Aucune commande suspecte."

echo -e "\n==================================================="
echo "[*] Fin de la chasse. Analyse terminée."
echo "==================================================="
