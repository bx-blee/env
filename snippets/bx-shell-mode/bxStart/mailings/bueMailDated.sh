# -*- mode: snippet -*-
# name: bueMailStatic.sh -i staticStart
# key: bxtStart/mailings/Dated
# group: bxtStart.mailings
# type: command
# --
(progn
  (lsip-local-run-command "bueMailStatic.sh -h -v -n showRun -i staticStart")
  )
