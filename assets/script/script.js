document.addEventListener('DOMContentLoaded', function () {
    const burger = document.getElementById('burger');
    const mobileMenu = document.getElementById('mobile-menu');
    const closeMenu = document.getElementById('close-menu');
    const main = document.querySelector('main');
    let isMenuOpen = false;

    // Fonction pour ouvrir le menu
    function openMenu() {
        mobileMenu.classList.add('active');
        isMenuOpen = true;
    }

    // Fonction pour fermer le menu
    function closeMenuFunction() {
        mobileMenu.classList.remove('active');
        isMenuOpen = false;
    }

    // Click sur le burger
    burger.addEventListener('click', (e) => {
        e.stopPropagation();
        if (isMenuOpen) {
            closeMenuFunction();
        } else {
            openMenu();
        }
    });

    // Click sur le X
    closeMenu.addEventListener('click', (e) => {
        e.preventDefault();
        closeMenuFunction();
    });

    // Click sur le menu mobile (pour éviter la fermeture quand on clique dedans)
    mobileMenu.addEventListener('click', (e) => {
        e.stopPropagation();
    });

    // Click n'importe où dans le document
    document.addEventListener('click', (e) => {
        if (isMenuOpen && !mobileMenu.contains(e.target)) {
            closeMenuFunction();
        }
    });

    // Fermeture automatique en version desktop
    window.addEventListener('resize', () => {
        if (window.innerWidth >= 768) {
            closeMenuFunction();
        }
    });
});








// Register//////////////////////////////////////////////

document.addEventListener('DOMContentLoaded', function () {
    const passwordInput = document.getElementById('password');
    const confirmPasswordInput = document.getElementById('confirm-password');
    const registerForm = document.querySelector('.login-form');

    function validatePasswords() {
        // Vérification que les mots de passe correspondent
        if (passwordInput.value !== confirmPasswordInput.value) {
            confirmPasswordInput.setCustomValidity("Les mots de passe ne correspondent pas");
            confirmPasswordInput.classList.add('password-mismatch');
        } else {
            confirmPasswordInput.setCustomValidity("");
            confirmPasswordInput.classList.remove('password-mismatch');
        }
    }

    // Écoute des changements sur les champs de mot de passe
    passwordInput.addEventListener('input', validatePasswords);
    confirmPasswordInput.addEventListener('input', validatePasswords);

    // Validation finale avant soumission du formulaire
    registerForm.addEventListener('submit', function (event) {
        validatePasswords();


        if (!registerForm.checkValidity()) {
            event.preventDefault();
        }
    });
});








// Contactr//////////////////////////////////////////////
document.addEventListener('DOMContentLoaded', function () {
    const contactForm = document.getElementById('contact-form');

    if (contactForm) {
        contactForm.addEventListener('submit', function (event) {
            const email = document.getElementById('email');
            const subject = document.getElementById('subject');
            const message = document.getElementById('message');

            if (!email.value.trim()) {
                email.setCustomValidity('Veuillez saisir votre email');
                event.preventDefault();
                return;
            }

            if (subject.value === '') {
                subject.setCustomValidity('Veuillez sélectionner un sujet');
                event.preventDefault();
                return;
            }

            if (!message.value.trim()) {
                message.setCustomValidity('Veuillez saisir un message');
                event.preventDefault();
                return;
            }

            email.setCustomValidity('');
            subject.setCustomValidity('');
            message.setCustomValidity('');
        });
    }
});