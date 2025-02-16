document.addEventListener('DOMContentLoaded', function () {
    // Code menu burger
    const burger = document.getElementById('burger');
    const mobileMenu = document.getElementById('mobile-menu');
    const closeMenu = document.getElementById('close-menu');
    let isMenuOpen = false;

    function toggleMenu() {
        isMenuOpen = !isMenuOpen;
        mobileMenu.classList.toggle('active', isMenuOpen);
    }

    burger?.addEventListener('click', (e) => {
        e.stopPropagation();
        toggleMenu();
    });

    closeMenu?.addEventListener('click', (e) => {
        e.preventDefault();
        toggleMenu();
    });

    document.addEventListener('click', (e) => {
        if (isMenuOpen && !mobileMenu.contains(e.target) && !burger.contains(e.target)) {
            toggleMenu();
        }
    });

    window.addEventListener('resize', () => {
        if (window.innerWidth >= 768) {
            mobileMenu.classList.remove('active');
            isMenuOpen = false;
        }
    });

    // Code validation des formulaires
    const passwordInput = document.getElementById('password');
    const confirmPasswordInput = document.getElementById('confirm-password');
    const registerForm = document.querySelector('.login-form');

    function validatePasswords() {
        if (passwordInput?.value !== confirmPasswordInput?.value) {
            confirmPasswordInput.setCustomValidity("Les mots de passe ne correspondent pas");
            confirmPasswordInput.classList.add('password-mismatch');
        } else {
            confirmPasswordInput.setCustomValidity("");
            confirmPasswordInput.classList.remove('password-mismatch');
        }
    }

    passwordInput?.addEventListener('input', validatePasswords);
    confirmPasswordInput?.addEventListener('input', validatePasswords);

    registerForm?.addEventListener('submit', function (event) {
        validatePasswords();
        if (!registerForm.checkValidity()) {
            event.preventDefault();
        }
    });

    const contactForm = document.getElementById('contact-form');

    contactForm?.addEventListener('submit', function (event) {
        const email = document.getElementById('email');
        const subject = document.getElementById('subject');
        const message = document.getElementById('message');

        if (!email.value.trim()) {
            email.setCustomValidity('Veuillez saisir votre email');
            event.preventDefault();
        }

        if (subject.value === '') {
            subject.setCustomValidity('Veuillez sélectionner un sujet');
            event.preventDefault();
        }

        if (!message.value.trim()) {
            message.setCustomValidity('Veuillez saisir un message');
            event.preventDefault();
        }
    });

    // Code carte
    const mapElement = document.getElementById('map');
    if (mapElement) {
        const map = L.map('map').setView([46.603354, 1.888334], 6);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);









        async function getCoordinates(city) {
            try {
                console.log(`🔍 Recherche des coordonnées pour : ${city}`);
                const response = await fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(city)}&limit=1`);
                const data = await response.json();

                if (data.length === 0) {
                    throw new Error(`Ville non trouvée : ${city}`);
                }

                const coords = [parseFloat(data[0].lat), parseFloat(data[0].lon)];
                console.log(`✅ Coordonnées trouvées pour ${city}:`, coords);
                return coords;
            } catch (error) {
                console.error(`❌ Erreur pour ${city}:`, error);
                return null;
            }
        }

        async function getRoute(start, end) {
            try {
                console.log('🚗 Calcul de l\'itinéraire...');
                console.log('Départ:', start);
                console.log('Arrivée:', end);

                const startCoords = `${start[1]},${start[0]}`;
                const endCoords = `${end[1]},${end[0]}`;

                console.log(`📡 Appel API avec: start=${startCoords}&end=${endCoords}`);
                const response = await fetch(`get_route.php?start=${startCoords}&end=${endCoords}`);
                const data = await response.json();
                console.log('📥 Réponse de l\'API:', data);


                map.eachLayer((layer) => {
                    if (layer instanceof L.Marker || layer instanceof L.GeoJSON) {
                        map.removeLayer(layer);
                    }
                });


                console.log('📍 Ajout des markers');
                const startMarker = L.marker([start[0], start[1]]).addTo(map);
                const endMarker = L.marker([end[0], end[1]]).addTo(map);

                if (data.features && data.features[0]) {
                    console.log('➡️ Tracé de l\'itinéraire');
                    const route = L.geoJSON(data).addTo(map);
                    map.fitBounds(route.getBounds());
                } else {
                    console.error('❌ Pas de route trouvée dans la réponse');
                }
            } catch (error) {
                console.error('❌ Erreur lors du calcul de l\'itinéraire:', error);
            }
        }






        // bouton de recherche
        const searchButton = document.getElementById('search');
        if (searchButton) {
            searchButton.addEventListener('click', async (e) => {
                e.preventDefault();

                const departure = document.getElementById('departure').value.trim();
                const arrival = document.getElementById('arrival').value.trim();

                if (!departure || !arrival) {
                    alert("Veuillez saisir les villes de départ et d'arrivée");
                    return;
                }

                const startCoords = await getCoordinates(departure);
                const endCoords = await getCoordinates(arrival);

                if (startCoords && endCoords) {
                    getRoute(startCoords, endCoords);
                }
            });
        }
    }
});