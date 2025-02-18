document.addEventListener("DOMContentLoaded", async function () {
    console.log("Script JS chargé avec succès !");

    // Menu Burger
    const burger = document.getElementById("burger");
    const mobileMenu = document.getElementById("mobile-menu");
    const closeMenu = document.getElementById("close-menu");
    let isMenuOpen = false;

    function toggleMenu() {
        isMenuOpen = !isMenuOpen;
        mobileMenu?.classList.toggle("active", isMenuOpen);
    }

    burger?.addEventListener("click", (e) => {
        e.stopPropagation();
        toggleMenu();
    });

    closeMenu?.addEventListener("click", (e) => {
        e.preventDefault();
        toggleMenu();
    });

    document.addEventListener("click", (e) => {
        if (isMenuOpen && !mobileMenu?.contains(e.target) && !burger?.contains(e.target)) {
            toggleMenu();
        }
    });

    window.addEventListener("resize", () => {
        if (window.innerWidth >= 768) {
            mobileMenu?.classList.remove("active");
            isMenuOpen = false;
        }
    });

    // Validation form
    const passwordInput = document.getElementById("password");
    const confirmPasswordInput = document.getElementById("confirm-password");
    const registerForm = document.querySelector(".login-form");

    function validatePasswords() {
        if (passwordInput?.value !== confirmPasswordInput?.value) {
            confirmPasswordInput.setCustomValidity("Les mots de passe ne correspondent pas");
            confirmPasswordInput.classList.add("password-mismatch");
        } else {
            confirmPasswordInput.setCustomValidity("");
            confirmPasswordInput.classList.remove("password-mismatch");
        }
    }

    passwordInput?.addEventListener("input", validatePasswords);
    confirmPasswordInput?.addEventListener("input", validatePasswords);

    registerForm?.addEventListener("submit", function (event) {
        validatePasswords();
        if (!registerForm.checkValidity()) {
            event.preventDefault();
        }
    });

    // Formulaire
    document.getElementById("contact-form")?.addEventListener("submit", function (event) {
        const email = document.getElementById("email");
        const subject = document.getElementById("subject");
        const message = document.getElementById("message");

        if (!email.value.trim()) {
            email.setCustomValidity("Veuillez saisir votre email");
            event.preventDefault();
        } else {
            email.setCustomValidity("");
        }

        if (!subject.value.trim()) {
            subject.setCustomValidity("Veuillez sélectionner un sujet");
            event.preventDefault();
        } else {
            subject.setCustomValidity("");
        }

        if (!message.value.trim()) {
            message.setCustomValidity("Veuillez saisir un message");
            event.preventDefault();
        } else {
            message.setCustomValidity("");
        }
    });

    // carte
    const mapElement = document.getElementById("map");
    if (!mapElement) {
        console.error("L'élément #map n'existe pas !");
        return;
    }

    console.log("Carte détectée, initialisation...");
    const map = L.map("map").setView([46.603354, 1.888334], 6);
    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution: "© OpenStreetMap contributors",
    }).addTo(map);

    // récupérer les coordonnées
    async function getCoordinates(city) {
        try {
            console.log(`Recherche des coordonnées pour : ${city}`);
            const response = await fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(city)}`);
            const data = await response.json();

            if (!data.length) {
                throw new Error(`Aucune donnée trouvée pour : ${city}`);
            }

            const { lat, lon } = data[0];
            console.log(`Coordonnées trouvées pour ${city}: ${lat}, ${lon}`);
            return [parseFloat(lat), parseFloat(lon)];
        } catch (error) {
            console.error(`Erreur pour ${city}:`, error);
            return null;
        }
    }

    // récupérer itinéraire
    async function getRoute(start, end) {
        try {
            console.log("Calcul de l'itinéraire...");
            if (!start || !end) {
                alert("Veuillez sélectionner des villes valides.");
                return;
            }

            const response = await fetch(`https://router.project-osrm.org/route/v1/driving/${start[1]},${start[0]};${end[1]},${end[0]}?overview=full&geometries=geojson`);
            const data = await response.json();

            if (!data.routes.length) {
                console.error("Aucun itinéraire trouvé !");
                alert("Aucun itinéraire disponible.");
                return;
            }

            map.eachLayer((layer) => {
                if (layer instanceof L.Polyline) {
                    map.removeLayer(layer);
                }
            });

            console.log("Tracé de l'itinéraire");
            const route = L.polyline(data.routes[0].geometry.coordinates.map(([lon, lat]) => [lat, lon]), {
                color: "blue",
                weight: 5,
            }).addTo(map);

            map.fitBounds(route.getBounds());
        } catch (error) {
            console.error("Erreur lors du calcul de l'itinéraire :", error);
        }
    }

    // formulaire de recherche
    document.getElementById("search")?.addEventListener("click", async (e) => {
        e.preventDefault();
        const departure = document.getElementById("departure").value.trim();
        const arrival = document.getElementById("arrival").value.trim();

        if (!departure || !arrival) {
            alert("Veuillez saisir les villes de départ et d'arrivée");
            return;
        }

        const startCoords = await getCoordinates(departure);
        const endCoords = await getCoordinates(arrival);

        if (startCoords && endCoords) {
            console.log("Coordonnées prêtes pour affichage sur la carte !");
            getRoute(startCoords, endCoords);
        } else {
            console.error("Impossible de tracer l'itinéraire : coordonnées manquantes.");
        }
    });
});
