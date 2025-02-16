document.addEventListener('DOMContentLoaded', function () {
    console.log("🚀 DOM chargé, initialisation des scripts...");

    const registerForm = document.getElementById('registerForm');

    if (registerForm) {
        console.log("📝 Formulaire d'inscription détecté.");

        registerForm.addEventListener('submit', async (e) => {
            e.preventDefault();

            const password = document.getElementById('password')?.value;
            const confirmPassword = document.getElementById('confirm-password')?.value;

            if (password !== confirmPassword) {
                alert('❌ Les mots de passe ne correspondent pas');
                return;
            }

            const formData = new FormData(registerForm);

            console.log('📩 Données envoyées pour l\'inscription:', Object.fromEntries(formData));

            try {
                console.log('📡 Envoi de la requête...');
                const response = await fetch('process_register.php', {
                    method: 'POST',
                    body: formData
                });

                console.log('✅ Réponse reçue');
                const result = await response.json();
                console.log('📩 Résultat:', result);

                if (result.success) {
                    console.log('🎉 Inscription réussie, redirection...');
                    window.location.href = 'index.php?route=login';
                } else {
                    console.log('⚠️ Erreur:', result.message);
                    alert(result.message);
                }
            } catch (error) {
                console.error('❗ Erreur technique:', error);
                alert('⚠️ Une erreur est survenue lors de l\'inscription');
            }
        });
    } else {
        console.log("⚠️ Aucun formulaire d'inscription détecté.");
    }


    const loginForm = document.getElementById('loginForm');

    if (loginForm) {
        console.log("🔐 Formulaire de connexion détecté.");

        loginForm.addEventListener('submit', async (e) => {
            e.preventDefault();

            const formData = new FormData(loginForm);
            console.log('Tentative de connexion avec email:', formData.get('email'));

            try {
                console.log('📡 Envoi de la requête de connexion...');
                const response = await fetch('process_login.php', {
                    method: 'POST',
                    body: formData
                });

                console.log('✅ Réponse reçue du serveur');
                const result = await response.json();
                console.log('📩 Résultat:', result);

                if (result.success) {
                    console.log('🎉 Connexion réussie, rechargement de la page...');
                    window.location.reload();
                } else {
                    console.log('⚠️ Erreur:', result.message);
                    alert(result.message);
                }
            } catch (error) {
                console.error('❗ Erreur technique:', error);
                alert('⚠️ Une erreur est survenue lors de la connexion');
            }
        });
    } else {
        console.log("⚠️ Aucun formulaire de connexion détecté.");
    }


    const logoutButton = document.querySelector('.cta-button[href="index.php?route=logout"]');

    if (logoutButton) {
        console.log("🔴 Bouton de déconnexion détecté.");

        logoutButton.addEventListener('click', async (e) => {
            e.preventDefault();

            try {
                console.log('📡 Envoi de la requête de déconnexion...');
                const response = await fetch('logout.php');

                if (response.ok) {
                    console.log('✅ Déconnexion réussie, redirection...');
                    window.location.href = 'index.php?route=login';
                } else {
                    console.error('❌ Erreur lors de la déconnexion');
                }
            } catch (error) {
                console.error('❗ Erreur technique:', error);
            }
        });
    } else {
        console.log("⚠️ Aucun bouton de déconnexion détecté.");
    }
});
