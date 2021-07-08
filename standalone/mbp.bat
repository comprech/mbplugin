@echo OFF
%~d0 
cd "%~dp0"

if EXIST ..\plugin\util.py (
    cd ..\..
    copy mbplugin\standalone\%~nx0 .
    if not EXIST phones.ini copy mbplugin\standalone\phones.ini .
    mbplugin\python\python mbplugin\plugin\util.py standalone-init
    mbplugin\python\python mbplugin\plugin\util.py install-chromium
    mbplugin\python\python mbplugin\plugin\util.py check-import
    mbplugin\python\python mbplugin\plugin\util.py check-ini
    mbplugin\python\python mbplugin\plugin\util.py clear-browser-cache
    mbplugin\python\python mbplugin\plugin\util.py check-playwright
    mbplugin\python\python mbplugin\plugin\util.py autostart-web-server
    timeout 30
    GOTO :EOF
)

mbplugin\python\python mbplugin\plugin\util.py %*