;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)

;;;#+BEGIN: bx:dblock:global:org-controls :disabledP "false" :mode "auto"
(lambda () "
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 
*      ================
")
;;;#+END:

;;;#+BEGIN: bx:dblock:global:org-contents-list :disabledP "false" :mode "auto"
(lambda () "
*      ################ CONTENTS-LIST ###############
*  [[elisp:(org-cycle)][| ]]  *Document Status, TODOs and Notes*          ::  [[elisp:(org-cycle)][| ]]
")
;;;#+END:

(lambda () "
**  [[elisp:(org-cycle)][| ]]  Idea      ::  Description   [[elisp:(org-cycle)][| ]]
")

(lambda () "
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* -- IIM Bash Dblock Processors --  <<Xref-Here->> [[elisp:(org-cycle)][| ]]
")

;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "Module Name"
(lambda () "*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message Module Name [[elisp:(org-cycle)][| ]]
")

(message "ByStar YASNIPPET LOADING")
;;;#+END:

;;;#+BEGIN: bx:dblock:lisp:requires :disabledP "false"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires       :: Requires [[elisp:(org-cycle)][| ]]
")
;;;#+END:


(require 'bx-lcnt-lib)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:bash:top-of-file params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:bash:top-of-file (params)
  (let ((bx:vc (or (plist-get params :vc) ""))
	(bx:partof (or (plist-get params :partof) ""))
	(bx:copyleft (or (plist-get params :copyleft) ""))
	)
  (insert "\
typeset RcsId=\"$Id: dblock-iim-bash.el,v 1.4 2017-02-08 06:42:32 lsipusr Exp $\"
# *CopyLeft*
")

  (when (equal bx:partof "bystar")
    (insert "#  This is part of ByStar Libre Services. http://www.by-star.net
")
    )

  (when (equal bx:copyleft "halaal+minimal")
    (insert "#  This is a Halaal Poly-Existential. See http://www.freeprotocols.org\n")
    )
  (when (equal bx:copyleft "halaal+brief")
    (insert "# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.\
")
    )

  ;;(insert "# }}} DBLOCK-top-of-file")
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:bash:end-of-file params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:bash:end-of-file (params)
  (let ((bx:types (or (plist-get params :types) ""))
	)
  (insert "_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:")
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:bash:end-of-fileObsoleted params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:bash:end-of-fileObsoleted (params)
  (let ((bx:types (or (plist-get params :types) ""))
	)
  (insert "# {{{ DBLOCK-end-of-file
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
# }}} DBLOCK-end-of-file")
    ))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:bash:top-of-fileObsoleted params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:bash:top-of-fileObsoleted (params)
  (let ((bx:vc (or (plist-get params :vc) ""))
	(bx:partof (or (plist-get params :partof) ""))
	(bx:copyleft (or (plist-get params :copyleft) ""))
	)
  (insert "# {{{ DBLOCK-top-of-file
typeset RcsId=\"$Id: dblock-iim-bash.el,v 1.4 2017-02-08 06:42:32 lsipusr Exp $\"
")

  (when (equal bx:partof "bystar")
    (insert "#  This is part of ByStar Libre Services. http://www.by-star.net
")
    )

  (when (equal bx:copyleft "halaal+minimal")
    (insert "#  This is a Halaal Poly-Existential. See http://www.freeprotocols.org\n")
    )
  (when (equal bx:copyleft "halaal+brief")
    (insert "# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal. 
")
    )

  (insert "# }}} DBLOCK-top-of-file")
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lsip:bash:seed-spec params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lsip:bash:seed-spec (params)
  (let ((bx:types (or (plist-get params :types) ""))
	(files-list)
	)
    ;;(insert "# {{{ DBLOCK-seed-spec\n")
    (insert 
     (format "SEED=\"\n*  /[dblock]/ /Seed/ :: [[file:/opt/public/osmt/bin/%s]] | \n\"\n" bx:types))
    (insert 
     (format "FILE=\"\n*  /This File/ :: %s \n\"\n" buffer-file-name))
    (insert "if [ \"${loadFiles}\" == \"\" ] ; then\n")
    (insert
     (format "    /opt/public/osmt/bin/%s -l $0 \"$@\" \n" bx:types))
    (insert "    exit $?
fi")
    ;;(insert "# }}} DBLOCK-seed-spec")
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lsip:bash:function params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lsip:bash:function (params)
  (let ((bx:func (or (plist-get params :func) ""))
	(bx:type (or (plist-get params :type) ""))
	)
    (insert (format "# {{{ %s\n" bx:func))
    (when (equal bx:type "idempotent")
      (insert (format "typeset %s_hasRun=\"\"\n" bx:func))
      )

    (insert (format "function %s {\n" bx:func))
    (insert "    TM_funcEntered\n")
    (insert "    thisFuncName=$( thisFuncNameBashOrKsh \"$0\" \"$FUNCNAME\" )")
    (when (equal bx:type "idempotent")
      (insert "\n    beIdempotent")
      )
    ))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (org-dblock-write:bx:dblock:lsip:binsprep:apt params) [[elisp:(org-cycle)][| ]]
  ")

(defun org-dblock-write:bx:dblock:lsip:binsprep:apt (params)
  (let ((bx:module (or (plist-get params :module) ""))
	(bx:bash-module)
	)
    (setq bx:bash-module (replace-regexp-in-string "-" "_" bx:module))    
    ;;;(insert (format "# {{{ %s\n" bx:module))
    (insert (format "_CommentBegin_\n"))
    (insert (format "*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: %s [[elisp:(org-cycle)][| ]]\n" bx:module))
    (insert (format "_CommentEnd_\n"))
    (insert (format "item_%s () { distFamilyGenerationHookRun binsPrep_%s; }\n" bx:bash-module bx:bash-module))
    (insert "\n")
    (insert (format "binsPrep_%s_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet \"%s\"; }\n" bx:bash-module bx:module))
    ;;;(insert "# }}}")
    ))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  Conversion                 ::      /Conversion Facilities/   [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim-bash-one-func-to-orgSec) [[elisp:(org-cycle)][| ]]
")

(defun iim-bash-one-func-to-orgSec ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^function " nil t))
      (when (re-search-forward "^function " nil t)
	(let* (
	       (defunName (thing-at-point 'symbol))
	       )
	  ;;;(message (format "Section ==  %s" defunName))
	  (save-excursion
	    (message (format "Section ==  %s" defunName))
	    (beginning-of-line 1)
	    (open-line 1)
	      ;;;(delete-region (point) (progn (forward-line 1) (point)))
	    (message "Inserting dblock ...") ;;(sit-for 1)
	    (iim-bash-func-orgSec-insert defunName)
	    )))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (iim-bash-one-func-to-orgSec) [[elisp:(org-cycle)][| ]]
")

(defun iim-bash-all-func-to-orgSec ()
  "Convert All sections to their dblocks" 
  (interactive)
  (if (save-excursion (re-search-forward "^function " nil t))
      (while (re-search-forward "^function " nil t)
	(let* (
	       (defunName (thing-at-point 'symbol))
	       )
	  ;;;(message (format "Section ==  %s" defunName))
	  (save-excursion
	    (message (format "Section ==  %s" defunName))
	    (beginning-of-line 1)
	    (open-line 1)
	      ;;;(delete-region (point) (progn (forward-line 1) (point)))
	    (message "Inserting dblock ...") ;;(sit-for 1)
	    (iim-bash-func-orgSec-insert defunName)
	    )))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (elisp-defun-orgSec-insert defunName defunArgs) [[elisp:(org-cycle)][| ]]
  ")

(defun iim-bash-func-orgSec-insert (funcName)
  ""
  (insert
   (format "\
_CommentBegin_\n*\
  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  %s    [[elisp:(org-cycle)][| ]]
_CommentEnd_
"
	   funcName)))


(lambda () "
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]            *Support Functions*
")


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-iim-bash"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-iim-bash)
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:


