;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* Short Description: Global Activity: Visibility Controls
*      ======[[elisp:(org-cycle)][Fold]]======  Revision, Origin And  Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee 
####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: setup-global-bbdb.el,v 1.6 2018-06-08 23:49:29 lsipusr Exp $"
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
**      ====[[elisp:(org-cycle)][Fold]]==== http://www.emacswiki.org/emacs/Bbdb
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
*      ======[[elisp:(org-cycle)][Fold]]====== bx:setup:bbdb:defaults-set -- Define 
")

(setq bcg:visibility:usage:enabled-p t)

(defun bcg:visibility:full/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when bcg:visibility:usage:enabled-p
    (bcg:visibility:install/update)
    (bcg:visibility:config/main)
    )
  )

(defun bcg:visibility:install/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))

  
  )

(defun bcg:visibility:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  ;;; (setq fci-rule-column 115)
  ;;; (setq fci-rule-color "darkblue")

  (setq display-fill-column-indicator t)
  (setq display-fill-column-indicator-character ?\N{U+2506})
  (set-fill-column 119)
  
  ;;;(customize-face 'fill-column-indicator)
  ;; or put something like this in your theme
  ;;; '(fill-column-indicator ((t (:foreground "#4e4e4e"))))

  
  )

(defun bcg:visibility:charset/config ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (when (fboundp 'set-charset-priority)
    (set-charset-priority 'unicode))
  (prefer-coding-system        'utf-8)
  (set-terminal-coding-system  'utf-8)
  (set-keyboard-coding-system  'utf-8)
  (set-selection-coding-system 'utf-8)
  (setq locale-coding-system   'utf-8)
  (setq-default buffer-file-coding-system 'utf-8)
  )

(defun bcg:visibility:displayEngine/config ()
  "NOTYET ::Revisit UI Section of https://github.com/gilbertw1/bmacs/blob/master/bmacs.org#ui"
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (setq frame-title-format (list (format "%%b – Blee 3.1-E-%s @ %s" emacs-version system-name)))

  (setq-default bidi-display-reordering t)         ; Blee wants to be bidi-aware

  (fset #'yes-or-no-p #'y-or-n-p)     ; y/n instead of yes/no
  )

(defun my-toggle-fill-column-indicator ()
  "Toggle displaying of fill column indicator."
  (interactive)
  (if display-fill-column-indicator
      (setq display-fill-column-indicator nil)
    (setq display-fill-column-indicator t)
    (setq display-fill-column-indicator-character ?\N{U+2506})))


(defun bcg:visibility:help/config ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (setq help-window-select t)  ;;; Force focus to the help menu
  )


(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== Provide
")

(provide 'bcg-core)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:

