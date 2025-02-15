document.addEventListener('DOMContentLoaded', function () {
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
});
