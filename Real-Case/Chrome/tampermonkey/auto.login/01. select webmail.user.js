// ==UserScript==
// @name         01. select webmail
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://webmail.company.portal/sslvpn/portal.html
// @icon         https://www.google.com/s2/favicons?domain=google.com
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // Your code here...

    setTimeout(function () {
        //alert('VIDEO HAS STOPPED');
        //var node = document.querySelectorAll('button');
        var node = document.querySelector('[title="HTTP/HTTPS: Web Mail"]');
        //alert(node.title);
        node.click();
    }, 2000);
})();