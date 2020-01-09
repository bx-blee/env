;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: Global Activity: magit -- GIT mode
*      ======[[elisp:(org-cycle)][Fold]]======  Revision, Origin And  Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee 
####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: setup-global-magit.el,v 1.6 2018-06-08 23:49:29 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:
")

(lambda () "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
")


(lambda () "
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
")

(lambda () "
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info]* Status/Maintenance -- General TODO List
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/git/fullUsagePanel-en.org::Xref-VersionControlGit][VC Panel Roadmap Documentation]]
**      ====[[elisp:(org-cycle)][Fold]]==== http://www.emacswiki.org/emacs/Magit
")


(lambda () "

*      ======[[elisp:(org-cycle)][Fold]]====== *[Description:]*
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Loading Announcement 
")


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Requires 
")

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== bx:setup:magit:defaults-set -- Define 
")

(setq bap:shell:usage:enabled-p t)

(defun bap:shell:full/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bap:shell:usage:enabled-p
    (bap:shell:install/update)
    (bap:shell:config/main)
    )
  )

(defun bap:shell:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  ;;;
  ;;; Multishell is for now, just a placeholder for now. It will replace fshell
  ;;;
  (use-package multishell
    :ensure t
    ;;; :pin melpa-stable
    )

  (blee:load-path:add  
   (concat (file-name-as-directory
	    (concat  (file-name-as-directory (blee:env:aPkgs:base-obtain))
		     "common")
	    )
	   "fshell")
   )

  (require 'fshell)   ;;; fshell is an old equivalent to multishell that allows you to name shell buffers by number
  
  )

(defun bap:shell:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  ;; -----------------------------------------------------------------
  ;; Shell stuff
  ;; -----------------------------------------------------------------

  (setq explicit-shell-file-name		"/bin/bash")
  (setq      shell-command-switch			"-c")

  (setq     shell-cd-regexp			"cd")
  (setq     shell-popd-regexp			"popd\\|\-")
  (setq     shell-pushd-regexp		"pd\\|pushd\\|\=\\|\+")
  (setq     shell-prompt-pattern		"^[^#$%>\n]*[#$%>] *")

  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
  )

(defun comintPlus-editInput (arg)
    (interactive "p")
    (setq debug-on-error t)
    (comint-kill-whole-line 0)
    (end-of-buffer)
    (yank)
    ;;(comint-send-input t)
    ;;(comint-send-input)
    )


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bap-shell)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

