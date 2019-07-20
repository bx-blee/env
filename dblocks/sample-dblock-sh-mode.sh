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
-rw-rw-r-- 1 lsipusr employee    743 Jul 12 11:49 sample-dblock-emacs-lisp.el
-rw-rw-r-- 1 lsipusr employee 137818 Jul 11 14:06 dblock-lcnt-latex.el
-rw-rw-r-- 1 lsipusr employee  25408 Jul  2 14:28 dblock-global.el
-rw-rw-r-- 1 lsipusr employee  11127 Jun 12 11:19 dblock-iim-bash.el
-rw-rw-r-- 1 lsipusr employee  20334 Jun 12 11:08 dblock-iim-python.el
-rw-rw-r-- 1 lsipusr employee  68029 Jun 12 10:58 dblock-lcnt-latex-new.el
-rw-rw-r-- 1 lsipusr employee  10563 Jun 12 10:37 dblock-emacs-lisp.el
-rw-rw-r-- 1 lsipusr employee  24066 Jun 12 09:30 dblock-lcnt-latex-front.el
-rw-rw-r-- 1 lsipusr employee  10217 Apr 20 13:29 dblock-org-bnsm.el
-rw-rw-r-- 1 lsipusr employee    764 Apr 20 13:29 dblock-org-general.el
-rw-rw-r-- 1 lsipusr employee  20242 Apr 20 13:29 dblock-org-iims.el
-rw-rw-r-- 1 lsipusr employee   2867 Apr 20 13:29 dblock-ploneProc-bash.el
-rw-rw-r-- 1 lsipusr employee   3156 Apr 20 13:29 dblock-widget-example.el
-rw-rw-r-- 1 lsipusr employee      0 Apr 20 13:29 sample-dblock-latex-mode.tex
-rw-rw-r-- 1 lsipusr employee      0 Apr 20 13:29 sample-dblock-org-mode.org
-rw-rw-r-- 1 lsipusr employee   2587 Apr 20 13:29 sample-dblock-sh-mode.sh
-rw-rw-r-- 1 lsipusr employee  19333 Apr 20 13:29 dblock-iims-panel.el
-rw-rw-r-- 1 lsipusr employee   3100 Apr 20 13:29 dblock-lcnt-bash.el
-rw-rw-r-- 1 lsipusr employee  26120 Apr 20 13:29 dblock-lcnt-latex-body.el
-rw-rw-r-- 1 lsipusr employee  20658 Apr 20 13:29 dblock-lcnt-latex-front-1210.el
-rw-rw-r-- 1 lsipusr employee  12062 Apr 20 13:29 dblock-lcnt-latex-panel.el
-rw-rw-r-- 1 lsipusr employee  26787 Apr 20 13:29 dblock-lcnt-latex-pres.el
-rw-rw-r-- 1 lsipusr employee   9702 Apr 20 13:29 dblock-lcnt-pres-panel.el
-rw-rw-r-- 1 lsipusr employee    798 Apr 20 13:29 dblock-global-run-results.el

####+END:


####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedMailingProc.sh"
# {{{ DBLOCK-seed-spec
if [ "${loadFiles}X" == "X" ] ; then
    /opt/public/osmt/bin/seedMailingProc.sh -l $0 "$@" 
    exit $?
fi
# }}} DBLOCK-seed-spec
####+END:
