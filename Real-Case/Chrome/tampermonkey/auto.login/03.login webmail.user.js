// ==UserScript==
// @name         03.login webmail
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://webmail.company.outlook:1234/proxy/*
// @icon         https://www.google.com/s2/favicons?domain=google.com
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // Your code here...
    let loginField = document.getElementById('username')
    loginField.value = "domain\\username";

    let credentialField = document.getElementById('password')
    credentialField.value = "password";

    let submit = document.querySelector('[value="Sign in"]');
    submit.click();
})();