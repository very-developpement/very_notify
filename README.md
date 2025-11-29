# very_notify
very_notify is a modern, free notification script with sounds. For FiveM servers

🚀 Système de Notification Personnalisé (FiveM/NUI)Ce script fournit un système de notification personnalisé et stylisé, principalement conçu pour une utilisation dans un environnement FiveM via l'interface NUI (New User Interface). Il permet d'afficher des messages dynamiques avec différents types (info, succès, erreur, avertissement) et des effets sonores associés.✨ FonctionnalitésNotifications Stylisées : Design moderne et réactif avec des dégradés et des ombres.Types de Notifications : Supporte les types info, success, error, et warning, chacun avec un style visuel et un son distincts.Animation Fluide : Utilisation de transitions CSS pour une apparition et disparition en douceur.Intégration NUI : Facile à appeler depuis le code Lua côté client de FiveM.Fonction d'Export : Une fonction d'exportation Lua (exports("Notify", ...)) est fournie pour une utilisation facile par d'autres ressources.🛠️ Structure du Projetmy-notification-resource/
├── client.lua
├── index.html
├── style.css
├── script.js
└── sounds/
    ├── success.ogg
    ├── error.ogg
    ├── info.ogg
    └── warning.ogg
Note : Le dossier sounds/ doit contenir les fichiers audio (success.ogg, error.ogg, info.ogg, warning.ogg) pour que les effets sonores fonctionnent correctement.⚙️ Installation et Utilisation1. Côté Client (Lua)Le script Lua côté client (client.lua) gère la communication avec l'interface NUI.Événement NetVous pouvez déclencher une notification en utilisant l'événement réseau enregistré :Lua-- Syntaxe : TriggerEvent("custom_notify:send", "Votre message ici", "type")

-- Exemple d'info
TriggerEvent("custom_notify:send", "Bienvenue sur le serveur!", "info") 

-- Exemple d'erreur
TriggerEvent("custom_notify:send", "Action impossible.", "error")

-- Exemple de succès
TriggerEvent("custom_notify:send", "Achat effectué avec succès!", "success")
Fonction d'ExportUne fonction d'export est disponible pour que d'autres ressources puissent appeler la notification directement :Lua-- Syntaxe : exports('resource_name', 'Notify', message, type)

-- Exemple d'avertissement
exports("my-notification-resource", "Notify", "Attention: Faible niveau de carburant.", "warning")
Types de Notifications acceptés :TypeDescriptionIcône Affichéeinfo (par défaut)Message informatif standard.ℹ️errorMessage d'échec ou d'erreur.❌warningMessage d'avertissement.⚠️successMessage de réussite.✅2. Côté HTML/CSS/JS (NUI)Le fichier script.js écoute les messages envoyés depuis Lua (via SendNUIMessage) en utilisant l'événement window.addEventListener('message', ...) et affiche/anime la notification en conséquence.Le style.css définit l'apparence, l'animation et les styles spécifiques à chaque type de notification.📝 LicenceCe projet est sous licence MIT. (Vous pouvez la changer si besoin.)
