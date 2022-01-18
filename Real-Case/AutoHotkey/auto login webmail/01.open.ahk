^2::
Run, chrome.exe https://webmail.company.com:2443/remote/login?lang=en
WinActivate, Please Login - Google Chrome
WinWaitActive, Please Login - Google Chrome
Send, {Tab}
SendInput, adaccount
Send, {Tab}
SendInput, {!}Password
Send, {Tab}
Send, {Enter}

Sleep 2000

Send, {Tab}{Tab}{Tab}
Send, {Enter}

WinActivate, Outlook Web App - Google Chrome
WinWaitActive, Outlook Web App - Google Chrome

SendInput, addomain\adaccount
Send, {Tab}
SendInput, {!}Password
Send, {Enter}

return