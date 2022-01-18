// ==UserScript==
// @name         00.login portal
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://webmail.company.portal/remote/login?lang=en
// @icon         https://www.google.com/s2/favicons?domain=google.com
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
let loginField = document.getElementById('username')
    loginField.value = "SYS218";

    let credentialField = document.getElementById('credential')
    credentialField.value = "password";

    document.getElementById("login_button").click();
    // Your code here...
})();