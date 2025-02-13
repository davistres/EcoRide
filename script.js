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
        e.stopPropagation(); // Empêche la propagation au document
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