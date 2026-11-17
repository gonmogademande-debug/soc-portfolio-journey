# Script d'analyse de logs SOC
# Auteur : KAI-ARLA
# But : Détecter les attaques web basiques dans un fichier de log

LOG_FILE=$1

if [ -z "$LOG_FILE" ]; then
    echo "Usage: $0 <fichier_log>"
    exit 1
fi

if [ ! -f "$LOG_FILE" ]; then
    echo "Erreur : Le fichier $LOG_FILE n'existe pas."
    exit 1
fi

echo "=================================================="
echo "   RAPPORT D'ANALYSE DE LOGS - KAI-ARLA SOC       "
echo "=================================================="
echo "Fichier analysé : $LOG_FILE"
echo ""

echo "[+] Recherche d'Injection SQL (SQLi)..."
grep -iE "select|union|or 1=1|' or" "$LOG_FILE" | awk '{print "  -> IP: " $1 " | Requête: " $6 " " $7}'
echo ""

echo "[+] Recherche de Path Traversal / LFI..."
grep -iE "\.\./" "$LOG_FILE" | awk '{print "  -> IP: " $1 " | Requête: " $6 " " $7}'
echo ""

echo "[+] Recherche de Cross-Site Scripting (XSS)..."
grep -iE "<script>|alert\(" "$LOG_FILE" | awk '{print "  -> IP: " $1 " | Requête: " $6 " " $7}'
echo ""

echo "[+] Analyse terminée."
echo "=================================================="
