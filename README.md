# very_notify
very_notify is a modern, free notification script with sounds. For FiveM servers

# 🚀 Système de Notification Personnalisé (FiveM/NUI)

Ce script fournit un système de notification personnalisé et stylisé, principalement conçu pour une utilisation dans un environnement FiveM via l'interface NUI (New User Interface). Il permet d'afficher des messages dynamiques avec différents types (info, succès, erreur, avertissement) et des effets sonores associés.

# ✨ Fonctionnalités 
- Notifications Stylisées : Design moderne et réactif avec des dégradés et des ombres.
- Types de Notifications : Supporte les types info, success, error, et warning, chacun avec un style visuel et un son distincts.
- Animation Fluide : Utilisation de transitions CSS pour une apparition et disparition en douceur.
- Intégration NUI : Facile à appeler depuis le code Lua côté client de FiveM.
- Fonction d'Export : Une fonction d'exportation Lua (exports("Notify", ...)) est fournie pour une utilisation facile par d'autres ressources.

# 🛠️ Structure du Projet

very_notify/
├── client.lua
└── html/
    ├── index.html
    ├── style.css
    ├── script.js
    └── sounds/
        ├── success.ogg
        ├── error.ogg
        ├── info.ogg
        └── warning.ogg

Note : Le dossier sounds/ doit contenir les fichiers audio (success.ogg, error.ogg, info.ogg, warning.ogg) pour que les effets sonores fonctionnent correctement.

# ⚙️ Installation et Utilisation

## 1. Côté Client (Lua)

Le script Lua côté client (client.lua) gère la communication avec l'interface NUI.

## Événement Net

Vous pouvez déclencher une notification en utilisant l'événement réseau enregistré :

-- Syntaxe : TriggerEvent("custom_notify:send", "Votre message ici", "type")

-- Exemple d'info
TriggerEvent("custom_notify:send", "Bienvenue sur le serveur!", "info") 

-- Exemple d'erreur
TriggerEvent("custom_notify:send", "Action impossible.", "error")

-- Exemple de succès
TriggerEvent("custom_notify:send", "Achat effectué avec succès!", "success")


## Fonction d'Export 

Une fonction d'export est disponible pour que d'autres ressources puissent appeler la notification directement :

-- Syntaxe : exports('very_notify', 'Notify', message, type)

-- Exemple d'avertissement

exports("very_notify", "Notify", "Attention: Faible niveau de carburant.", "warning")

## Types de Notifications acceptés :

Type                Description                  Icône Affichée
info (par défaut)   Message informatif standard.      ℹ️
error               Message d'échec ou d'erreur.      ❌
warning             Message d'avertissement.          ⚠️
success             Message de réussite.              ✅

# 2. ✏️ Personnalisation du Texte de la Marque

Par défaut, toutes les notifications affichent la balise VERY:DEV info : avant le message.

Pour changer ce texte (par exemple, pour mettre le nom de votre serveur), vous devez modifier le fichier script.js.

1. Ouvrir script.js

Localisez les lignes suivantes dans votre fichier script.js :

        if (event.data.type === "error") {
            box.classList.add("error");
            text.innerHTML = `❌ <strong>VERY:DEV info :</strong> ${event.data.message}`; // LIGNE À MODIFIER
            sound = "notif-error";
        } else if (event.data.type === "warning") {
            box.classList.add("warning");
            text.innerHTML = `⚠️ <strong>VERY:DEV info :</strong> ${event.data.message}`; // LIGNE À MODIFIER
            sound = "notif-warning";
        } else if (event.data.type === "success") {
            box.classList.add("success");
            text.innerHTML = `✅ <strong>VERY:DEV info :</strong> ${event.data.message}`; // LIGNE À MODIFIER
            sound = "notif-success";
        } else {
            text.innerHTML = `ℹ️ <strong>VERY:DEV info :</strong> ${event.data.message}`; // LIGNE À MODIFIER
        }

# 2. Effectuer les Changements
Modifiez le texte VERY:DEV info : sur chacune des quatre lignes où il apparaît.

Exemple de Modification
Si vous voulez changer le texte en Mon Serveur RP, remplacez :

// Avant
text.innerHTML = `❌ <strong>VERY:DEV info :</strong> ${event.data.message}`;

// Après (pour les quatre occurrences)
text.innerHTML = `❌ <strong>Mon Serveur RP :</strong> ${event.data.message}`;

Résultat
Après cette modification, votre notification d'erreur affichera :

❌ Mon Serveur RP : Action impossible.

N'oubliez pas de redémarrer la ressource sur votre serveur FiveM pour appliquer les changements après la modification de script.js.

# 3. Côté HTML/CSS/JS (NUI)

Le fichier script.js écoute les messages envoyés depuis Lua (via SendNUIMessage) en utilisant l'événement window.addEventListener('message', ...) et affiche/anime la notification en conséquence.

Le style.css définit l'apparence, l'animation et les styles spécifiques à chaque type de notification.

#📝 Licence 
Ce projet est sous licence MIT.
