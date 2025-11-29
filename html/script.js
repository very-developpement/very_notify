window.addEventListener('message', function (event) {
    if (event.data.action === "notify") {
        const box = document.getElementById("custom-notification");
        const text = document.getElementById("notif-text");

        box.className = "show";
        let sound = "notif-info";

        if (event.data.type === "error") {
            box.classList.add("error");
            text.innerHTML = `❌ <strong>VERY:DEV info :</strong> ${event.data.message}`;
            sound = "notif-error";
        } else if (event.data.type === "warning") {
            box.classList.add("warning");
            text.innerHTML = `⚠️ <strong>VERY:DEV info :</strong> ${event.data.message}`;
            sound = "notif-warning";
        } else if (event.data.type === "success") {
            box.classList.add("success");
            text.innerHTML = `✅ <strong>VERY:DEV info :</strong> ${event.data.message}`;
            sound = "notif-success";
        } else {
            text.innerHTML = `ℹ️ <strong>VERY:DEV info :</strong> ${event.data.message}`;
        }

        const audio = document.getElementById(sound);
        if (audio) {
            audio.currentTime = 0;
            audio.play();
        }

        setTimeout(() => {
            box.classList.remove("show");
        }, 4000);
    }
});

