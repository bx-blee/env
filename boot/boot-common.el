;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (boot-common:),  [[elisp:(org-cycle)][| ]]
* 
")


;;;#+BEGIN: bx:dblock:global:org-controls :disabledP "false" :mode "auto"
(lambda () "
* [[elisp:(show-all)][(>]] [[elisp:(describe-function 'org-dblock-write:bx:dblock:global:org-controls)][dbf]]
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][|O]]  [[elisp:(progn (org-shifttab) (org-content))][|C]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][|N]] | [[elisp:(delete-other-windows)][|1]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-This]] [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-This]] | [[elisp:(bx:org:agenda:these-files-otherWin)][Agenda-These]] [[elisp:(bx:org:todo:these-files-otherWin)][ToDo-These]]

* [[elisp:(org-shifttab)][<)]] [[elisp:(describe-function 'org-dblock-write:bx:dblock:global:org-controls)][dbFunc)]]  E|

")
;;;#+END:

;;;#+BEGIN: bx:global:org-contents-list :disabledP "false" :mode "auto"
(lambda () "
*      ################ CONTENTS-LIST   ###############
")
;;;#+END:



(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires                    :: Requires [[elisp:(org-cycle)][| ]]
")

(require 'blee-elpa-packages)

(require 'cl-lib)
(require 'compile-time-function-name)


(lambda () "
####+BEGIN: bx:dblock:bnsm:top-of-menu "basic"
*  #Controls:   [[elisp:(toggle-read-only)][read/wr]] | [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
####+END:
")



;;;
(defun boot:common|main-init ()
  "Desc:"

  (blee:ann|this-func (compile-time-function-name))
  ;;;
  ;;; These include make-directory as needed
  ;;;
  (blee:vered:run|base-obtain)
  (blee:vered:tmp|base-obtain)
  (blee:vered:elpa|base-obtain)
  
  (blee:elpa:main-init)

  (require 'bcg-libs)
  (bcg:libs:full/update)

  (require 'bcg-core)
  (bcg:core:full/update)

  (require 'bap-magit)
  (bap:magit:full/update)

  (require 'bf-font)
  (bf:font:full/update)

  (require 'bap-bbdb)
  (bap:bbdb:full/update)

  (require 'eoeLsip)

  (require 'blee-lib-common)
  (require 'blee-lib-general)

  (require 'blee-dict)
  (require 'bx-lib)
  (require 'fv-lib)
  (require 'fto-lib)
  (require 'fileParam-lib)
  (require 'blee-iims-panel)
  (require 'blee-iim-bash-cmnd)
  (require 'blee-iicm-py-cmnd)

  (require 'blee-global)
  ;;;;(require 'blee-packages-install)


  ;; (require 'bystar-ue-lib)  -- Wants misc-lim
  ;; (bystar:ue:params-auto-set)

;;; -----------------------------------------------------------------
;;; Shell stuff
;;; -----------------------------------------------------------------
;;(require 'ksh-mode)

  (setq explicit-shell-file-name		"/bin/bash")
  (setq      shell-command-switch			"-c")

  (setq     shell-cd-regexp			"cd")
  (setq     shell-popd-regexp			"popd\\|\-")
  (setq     shell-pushd-regexp		"pd\\|pushd\\|\=\\|\+")
  (setq     shell-prompt-pattern		"^[^#$%>\n]*[#$%>] *")

  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

  (defun comintPlus-editInput (arg)
    (interactive "p")
    (setq debug-on-error t)
    (comint-kill-whole-line 0)
    (end-of-buffer)
    (yank)
    ;;(comint-send-input t)
    ;;(comint-send-input)
    )

  
  ;;;(require 'fshell)  ;; What is this?? NOTYET

					; ;; CVS
					; ;;
					; (eoe-require 'pcl-cvs)
  (setq vc-follow-symlinks nil)   ;;; Following symlinks messes up /lcnt assumptions for example

  ;; Choose bystar account or none

  ;; bystar-star does either (require 'bystar-all) or (require 'bystar-all-nobody)
  (require 'bystar-start)

  (load "bystar-acct")
  
  (require 'eoe-user-params)

  ;;; (require 'lsip-basic) -- Needs misc-lim


  ;; -----------------------------------------------------------------
  ;; Email AND News  (gnus, bbdb, supercite, msend, ...)
  ;; -----------------------------------------------------------------
  (add-to-list 'auto-mode-alist '("\\.mail\\'" . message-mode))


  (setq bystar:ue:form-factor 'desktop)  ;;; Notyet where should this go?

  (funcall  '(lambda () "
**     *Mail -- Gnus And Addons*
"
	       (load "bystar-mail")
	       ))

  (funcall  '(lambda () "
**     *Mail -- offlineimap*
"
	     (require 'bystar-offlineimap)
	     ))



  (funcall  '(lambda () "
**     *Mail -- Search -- notmuch, nnir*
"
	       ;;(require 'bystar-mail-search)
	       ))
  
;;; -----------------------------------------------------------------
;;; Email Citations -- SuperCite
;;; -----------------------------------------------------------------
;;; NOTYET, Perhaps requires GNUS conversion
;(eoe-require 'supercite)
  (require 'supercite)
  (load "supercite-user")

;;; -----------------------------------------------------------------
;;; EMMS
;;; -----------------------------------------------------------------
  ;;; (load "bystar-emms")  NOTYET, package is needed

; ;;; -----------------------------------------------------------------
; ;;; Mozilla Browser integration
; ;;; -----------------------------------------------------------------
;;;
;;; configure browse-url.el
;;;
  (require 'browse-url)

  ;;(setq browse-url-browser-function 'browse-url-mozilla)
  ;;(setq browse-url-browser-function 'browse-url-firefox)
  ;;(setq browse-url-firefox-program "/opt/public/osmt/bin/firefox-bx")
  (setq browse-url-browser-function 'browse-url-generic)
  (setq browse-url-generic-program "/opt/public/osmt/bin/firefox-bx")

;;; -----------------------------------------------------------------
;;; C and C++ Programming Language -- Software Development 
;;; -----------------------------------------------------------------
  (require 'cc-mode)			; covers C, C++

  ;;;(require 'compile-ext)
  
  
  )




;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "boot-common"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'boot-common)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; major-mode: emacs-lisp-mode
;;; end:



