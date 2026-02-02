// Tab Switching Logic
function showPage(pageId) {
    // Hide all pages
    const pages = document.querySelectorAll('.page-section');
    pages.forEach(page => page.classList.remove('active'));

    // Show selected page
    document.getElementById(pageId).classList.add('active');

    // Update nav buttons
    const buttons = document.querySelectorAll('.nav-links button:not(.lang-switch)');
    buttons.forEach(btn => btn.classList.remove('active'));
    document.getElementById('btn-' + pageId).classList.add('active');
}

// Language Switching Logic
function toggleLanguage() {
    const body = document.body;
    if (body.classList.contains('lang-zh')) {
        body.classList.remove('lang-zh');
        body.classList.add('lang-en');
        document.documentElement.lang = 'en';
    } else {
        body.classList.remove('lang-en');
        body.classList.add('lang-zh');
        document.documentElement.lang = 'zh-TW';
    }
}