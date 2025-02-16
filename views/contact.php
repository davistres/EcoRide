<?php include __DIR__ . '/layouts/header.php'; ?>

<main>
    <section class="login-section">
        <h2>Contactez-nous</h2>
        <form class="login-form" id="contact-form">
            <div class="form-group">
                <label for="name">Nom (optionnel)</label>
                <input type="text" id="name" name="name">
            </div>
            <div class="form-group">
                <label for="email">Email *</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="subject">Sujet *</label>
                <select id="subject" name="subject" required>
                    <option value="">Sélectionnez un sujet</option>
                    <option value="support">Support technique</option>
                    <option value="reservation">Problème de réservation</option>
                    <option value="feedback">Feedback</option>
                    <option value="other">Autre</option>
                </select>
            </div>
            <div class="form-group">
                <label for="message">Message *</label>
                <textarea id="message" name="message" required rows="5" placeholder="Votre message..."></textarea>
            </div>
            <button type="submit" class="search-button">Envoyer le message</button>
        </form>
    </section>
</main>

<?php include __DIR__ . '/layouts/footer.php'; ?>