####+BEGIN: bx:dblock:menuChoice :types "unknownCommand"
New New! Here is a menu choice. The label is set by :tag, and the default item is
the child item that :value match the :value of the menu choice.
_Menu choices_: item

####+END:


####+BEGIN: bx:dblock:global:run-result :command "unknownCommand"
/bin/bash: unknownCommand: command not found

####+END:

####+BEGIN: bx:dblock:global:run-result-stdout :command "unknownCommand"

####+END:


####+BEGIN: bx:dblock:global:run-result-stdout :command "tail -5 /etc/passwd"
cvsd:x:116:123:cvs pserver daemon:/var/lib/cvsd:/bin/false
ea-59019:x:59019:59000:ea-59019:/acct/smb/com/neda:/bin/false
ea-59009:x:59009:59000:ea-59009:/acct/smb/net/by-star:/bin/false
debian-tor:x:117:125::/var/lib/tor:/bin/bash
mysql:x:118:126:MySQL Server,,,:/var/lib/mysql:/bin/false

####+END:

####+BEGIN: bx:dblock:global:run-result-stdout :command "ls -ldt *"
-rw-r--r-- 1 lsipusr employee   983 Jan 23 11:54 sample-dblock-usage-bash.sh
-rw-rw-r-- 1 lsipusr employee 53072 Jan 23 11:00 dblock-lcnt-latex.el
drwxr-xr-x 2 lsipusr employee  4096 Jan 22 23:50 CVS
-rw-rw-r-- 1 lsipusr employee 52854 Jan 22 23:46 dblock-lcnt-latex.el.~1.7.~
-rw-rw-r-- 1 lsipusr employee  7018 Jan 22 21:30 dblock-emacs-lisp.el
-rw-r--r-- 1 lsipusr employee 14965 Jan 22 20:52 dblock-lcnt-latex-body.el
-rw-rw-r-- 1 lsipusr employee  8799 Jan 22 15:11 dblock-lcnt-latex-panel.el
-rw-rw-r-- 1 lsipusr employee 10234 Jan 22 12:23 dblock-lcnt-latex-panel.el~
-rw-r--r-- 1 lsipusr employee 20470 Jan 21 17:16 dblock-global.el
-rw-rw-r-- 1 lsipusr employee 23777 Jan 21 15:55 dblock-lcnt-latex-front.el
-rw-r--r-- 1 lsipusr employee  2555 Jan 20 17:57 dblock-lcnt-bash.el
-rw-r--r-- 1 lsipusr employee  8185 Dec  6 17:35 dblock-org-bnsm.el
-rw-r--r-- 1 lsipusr employee  2410 Feb 28  2016 dblock-bash.el
-rw-r--r-- 1 lsipusr employee  1912 Feb 27  2016 dblock-lsip-bash.el
-rw-r--r-- 1 lsipusr employee 20658 Feb 26  2014 dblock-lcnt-latex-front-1210.el
-rw-r--r-- 1 lsipusr employee   332 Sep 14  2013 dblock-global-run-results.el
-rw-r--r-- 1 lsipusr employee   613 Sep 14  2013 sample-dblock-usage-bash.sh.~1.1.~
-rw-r--r-- 1 lsipusr employee   745 Sep 14  2013 sample-dblock-usage.el
-rw-r--r-- 1 lsipusr employee   526 Mar  8  2013 dblock-org-general.el
-rw-r--r-- 1 lsipusr employee  2623 Jun 19  2012 dblock-ploneProc-bash.el

####+END:


####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedMailingProc.sh"
# {{{ DBLOCK-seed-spec
if [ "${loadFiles}X" == "X" ] ; then
    /opt/public/osmt/bin/seedMailingProc.sh -l $0 "$@" 
    exit $?
fi
# }}} DBLOCK-seed-spec
####+END:
