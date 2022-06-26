####+BEGIN: bx:dblock:menuChoice :types "unknownCommand"

####+END:

####+BEGIN: blee:bxPanel:runResult :style ("openBlank" "closeFull") :stdErr nil :comment "Suppress stdErr" :command "baddCommand"
_CommentBegin_
* [[elisp:(show-all)][(>]] [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]     [[elisp:(org-cycle)][| /Results:/ |]]  [[elisp:(blee:org-update-named-dblocks-above)][D-Run]] :: [[elisp:(lsip-local-run-command "baddCommand")][baddCommand]] *|*  =Suppress stdErr= |
Last Executed at: 202206-20-18:15:01  by: bystar on: HSS-1005.bx
----------------------------
/bin/bash: line 1: baddCommand: command not found

* [[elisp:(org-shifttab)][<)]] [[elisp:(describe-function 'org-dblock-write:blee:bxPanel:runResult)][dbFunc)]]  E|
_CommentEnd_
####+END:


####+BEGIN: bx:dblock:global:run-result :command "unknownCommand"
/bin/bash: line 1: unknownCommand: command not found

####+END:


####+BEGIN: bx:dblock:global:run-result-stdout :command "tail -5 /etc/passwd"
qmails:x:64012:64010::/var/lib/qmail:/bin/sh
runit-log:x:998:998:Created by dh-sysuser for runit:/nonexistent:/usr/sbin/nologin
_runit-log:x:997:997:Created by dh-sysuser for runit:/nonexistent:/usr/sbin/nologin
debian-spamd:x:123:133::/var/lib/spamassassin:/usr/sbin/nologin
courier:x:124:134::/var/lib/courier:/usr/sbin/nologin

####+END:
####+BEGIN: blee:bxPanel:runResult :comment "Example Of ls" :command "ls -ldt *"
_CommentBegin_
* [[elisp:(show-all)][(>]] [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]     [[elisp:(org-cycle)][| /Results:/ |]]  [[elisp:(blee:org-update-named-dblocks-above)][D-Run]] :: [[elisp:(lsip-local-run-command "ls -ldt *")][ls -ldt *]] *|*  =Example Of ls= |
Last Executed at: 202206-20-18:15:01  by: bystar on: HSS-1005.bx
----------------------------
-rw-rw-r-- 1 bystar bisos  91789 Apr 10 11:49 dblock-org-general.el
-rw-rw-r-- 1 bystar bisos  20242 Apr 10 11:49 dblock-org-iims.el
-rw-rw-r-- 1 bystar bisos   1598 Apr 10 11:49 dblock-org-mailings.el
-rw-rw-r-- 1 bystar bisos  10994 Apr 10 11:49 dblock-org-realms.el
-rw-rw-r-- 1 bystar bisos   2825 Apr 10 11:49 dblock-ploneProc-bash.el
-rw-rw-r-- 1 bystar bisos   3156 Apr 10 11:49 dblock-widget-example.el
-rw-rw-r-- 1 bystar bisos    743 Apr 10 11:49 sample-dblock-emacs-lisp.el
-rw-rw-r-- 1 bystar bisos      0 Apr 10 11:49 sample-dblock-latex-mode.tex
-rw-rw-r-- 1 bystar bisos    631 Apr 10 11:49 sample-dblock-org-mode.org
-rw-rw-r-- 1 bystar bisos   5829 Apr 10 11:49 sample-dblock-sh-mode.sh
-rw-rw-r-- 1 bystar bisos 133339 Apr 10 11:49 t1-dblock-lcnt-latex.el
-rw-rw-r-- 1 bystar bisos   5704 Apr 10 11:49 dblock-begin-examples.el
-rw-rw-r-- 1 bystar bisos   3236 Apr 10 11:49 dblock-controller.el
-rw-rw-r-- 1 bystar bisos  10563 Apr 10 11:49 dblock-emacs-lisp.el
-rw-rw-r-- 1 bystar bisos  32472 Apr 10 11:49 dblock-global.el
-rw-rw-r-- 1 bystar bisos    798 Apr 10 11:49 dblock-global-run-results.el
-rw-rw-r-- 1 bystar bisos   6715 Apr 10 11:49 dblock-governor.el
-rw-rw-r-- 1 bystar bisos  17387 Apr 10 11:49 dblock-iim-bash.el
-rw-rw-r-- 1 bystar bisos  20162 Apr 10 11:49 dblock-iim-python.el
-rw-rw-r-- 1 bystar bisos  19333 Apr 10 11:49 dblock-iims-panel.el
-rw-rw-r-- 1 bystar bisos   3100 Apr 10 11:49 dblock-lcnt-bash.el
-rw-rw-r-- 1 bystar bisos  26120 Apr 10 11:49 dblock-lcnt-latex-body.el
-rw-rw-r-- 1 bystar bisos 151737 Apr 10 11:49 dblock-lcnt-latex.el
-rw-rw-r-- 1 bystar bisos  20658 Apr 10 11:49 dblock-lcnt-latex-front-1210.el
-rw-rw-r-- 1 bystar bisos  24091 Apr 10 11:49 dblock-lcnt-latex-front.el
-rw-rw-r-- 1 bystar bisos  68029 Apr 10 11:49 dblock-lcnt-latex-new.el
-rw-rw-r-- 1 bystar bisos  12062 Apr 10 11:49 dblock-lcnt-latex-panel.el
-rw-rw-r-- 1 bystar bisos  26787 Apr 10 11:49 dblock-lcnt-latex-pres.el
-rw-rw-r-- 1 bystar bisos   9702 Apr 10 11:49 dblock-lcnt-pres-panel.el
-rw-rw-r-- 1 bystar bisos  10230 Apr 10 11:49 dblock-org-bnsm.el
-rw-rw-r-- 1 bystar bisos   2849 Apr 10 11:49 dblock-org-common.el

* [[elisp:(org-shifttab)][<)]] E|_CommentEnd_
####+END:

####+BEGIN: blee:bxPanel:runResult :comment "Changing Date As Example" :command "date"
_CommentBegin_
* [[elisp:(show-all)][(>]] [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]     [[elisp:(org-cycle)][| /Results:/ |]]  [[elisp:(blee:org-update-named-dblocks-above)][D-Run]] :: [[elisp:(lsip-local-run-command "date")][date]] *|*  =Changing Date As Example= |
Last Executed at: 202206-20-18:15:01  by: bystar on: HSS-1005.bx
----------------------------
Mon 20 Jun 2022 06:15:01 PM PDT

* [[elisp:(org-shifttab)][<)]] E|_CommentEnd_
####+END:

####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedMailingProc.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/opt/public/osmt/bin/seedMailingProc.sh]] | 
"
FILE="
*  /This File/ :: /bisos/git/auth/bxRepos/blee/env/dblocks/sample-dblock-sh-mode.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedMailingProc.sh -l $0 "$@" 
    exit $?
fi
####+END:
