# RAPPORT D'INVESTIGATION SOC : SSRF (Server-Side Request Forgery)

## 1. RÉSUMÉ DE L'INCIDENT

Lors de l'audit de sécurité du serveur web local, une vulnérabilité de type SSRF a été découverte. Cette faille permet à un attaquant de forcer le serveur à effectuer des requêtes HTTP vers des ressources internes normalement inaccessibles depuis l'extérieur.

## 2. DÉTAILS DE LA VULNÉRABILITÉ

- **Fichier affecté :** `/ssrf.php`
- **Paramètre vulnérable :** `url` (méthode GET)
- **Problème :** Le script prend l'URL fournie par l'utilisateur et l'utilise directement dans une fonction comme `cURL` ou `file_get_contents()` sans aucune validation.

## 3. EXPLOITATION (Preuve de Concept)

- **Test 1 : Accès à l'interface d'administration locale.**
  - *Requête :* `curl "http://127.0.0.1:8080/ssrf.php?url=http://127.0.0.1:8080/admin"`
  - *Résultat :* Le contenu de la page admin a été retourné, contournant les restrictions d'accès réseau.
- **Test 2 : Accès aux métadonnées du cloud (simulation).**
  - *Requête :* `curl "http://127.0.0.1:8080/ssrf.php?url=http://169.254.169.254/latest/meta-data/"`
  - *Résultat :* Accès potentiel à des identifiants IAM si le serveur était hébergé sur AWS.

## 4. REMÉDIATION

- Mettre en place une liste blanche (whitelist) stricte des domaines et adresses IP que le serveur est autorisé à contacter.
- Bloquer les requêtes vers les adresses IP internes (`127.0.0.1`, `10.0.0.0/8`, `169.254.169.254`, etc.).
- Désactiver les redirections automatiques dans les requêtes cURL.

## 5. CONCLUSION

La faille SSRF est souvent utilisée comme point d'entrée pour cartographier un réseau interne et atteindre des services critiques. Sa remédiation est indispensable pour la sécurité de l'infrastructure.
