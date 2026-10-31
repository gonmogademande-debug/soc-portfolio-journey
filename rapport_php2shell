# 🚨 Rapport d'investigation : Injection de Commande (Command Injection)
## 📝 Résumé de l'incident
Lors d'un test d'intrusion sur le serveur web local, une vulnérabilité critique d'injection de commande a été identifiée sur le script `ping.php`. 

## 🔍 Détails de la vulnérabilité
- **Type :** Remote Code Execution (RCE) via Command Injection
- **Fichier affecté :** `/ping.php`
- **Paramètre vulnérable :** `ip` (méthode GET)
- **Payload utilisé :** `127.0.0.1;whoami`

## 🛠️ Analyse technique
Le script PHP passe directement l'entrée utilisateur à une fonction système (comme `shell_exec()`). L'utilisation du point-virgule (`;`) a permis d'exécuter une seconde commande arbitraire en plus du ping initial. La commande `whoami` a renvoyé l'utilisateur `u0_a115`, prouvant l'exécution de code.

## 🛡️ Remédiation (Correctif)
Pour corriger cette faille, il faut valider strictement l'entrée utilisateur. En PHP, utiliser `filter_var($ip, FILTER_VALIDATE_IP)` avant d'exécuter la commande, et utiliser `escapeshellarg()`.

## 💡 Leçon retenue
Ne jamais faire confiance aux entrées utilisateur. Toujours valider et assainir (sanitize) les données avant de les passer au système d'exploitation.
