;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (boot-common:),  [[elisp:(org-cycle)][| ]]
*
** Known problems:
*** F12 fails
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

(require 'blee-elpa-packages)          ;;; elpa packages have already been loaded and prepared

(require 'cl-lib)                      ;;; Needed for blee:ann
(require 'compile-time-function-name)  ;;; Provides blee:ann -- used here


(lambda () "
####+BEGIN: bx:dblock:bnsm:top-of-menu "basic"
*  #Controls:   [[elisp:(toggle-read-only)][read/wr]] | [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
####+END:
")



;;;
;;; (boot:common|main-init)
;;;
(defun boot:common|main-init ()
  "Desc:"

  (blee:ann|this-func (compile-time-function-name))
  
  ;;;
  ;;; These include make-directory as needed
  ;;;
  (blee:vered:run|base-obtain)       ;;; eg, /bisos/blee/27f/run
  (blee:vered:tmp|base-obtain)       ;;; eg, /bisos/blee/27f/tmp
  (blee:vered:elpa|base-obtain)      ;;; eg, /bisos/blee/27f/elpa
  
  (blee:elpa:main-init)              ;;; Sets up load-path


 ;; Convert all inclusions to fit in this model
;;;#+BEGINNOT: blee:pkg:adopt :eanble :org-level 2 pkgName
  (funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Adopted Component   ::      *Dired* [[elisp:(org-cycle)][| ]]
	
"
	     ))
;;;#+END:

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

  (require 'bcg-org)
  (bcg:org:full/update)

  (require 'bap-shell)
  (bap:shell:full/update)
  
  (require 'bap-emms)
  (bap:emms:full/update)
  

  
  (setq eoe-uses-wide-screen t)
  (setq eoe-font "10x20")
  ;;(setq eoe-keybinding-style "neda")
  (setq eoe-use-toolbars nil)
  (setq eoe-use-sound t)

  ;; (tool-bar-mode -1)  
  ;;(tool-bar-mode 1)
  (menu-bar-showhide-tool-bar-menu-customize-enable-top)

  (menu-bar-right-scroll-bar)
  

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

  ;; CVS
  ;;
  ;; (eoe-require 'pcl-cvs)
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
  
  ;; -----------------------------------------------------------------
  ;; Email Citations -- SuperCite
  ;; -----------------------------------------------------------------
  ;; NOTYET, Perhaps requires GNUS conversion
  ;;(eoe-require 'supercite)
  (require 'supercite)
  (load "supercite-user")

  ;; -----------------------------------------------------------------
  ;; EMMS
  ;; -----------------------------------------------------------------
  ;;; (load "bystar-emms")  NOTYET, package is needed

  ;; -----------------------------------------------------------------
  ;; Mozilla Browser integration
  ;; -----------------------------------------------------------------
  ;;
  ;; configure browse-url.el
  ;;
  (require 'browse-url)

  ;;(setq browse-url-browser-function 'browse-url-mozilla)
  ;;(setq browse-url-browser-function 'browse-url-firefox)
  ;;(setq browse-url-firefox-program "/opt/public/osmt/bin/firefox-bx")
  (setq browse-url-browser-function 'browse-url-generic)
  (setq browse-url-generic-program "/opt/public/osmt/bin/firefox-bx")

  ;; -----------------------------------------------------------------
  ;; C and C++ Programming Language -- Software Development 
  ;; -----------------------------------------------------------------
  (require 'cc-mode)			; covers C, C++

  ;;;(require 'compile-ext)

  ;; -----------------------------------------------------------------
  ;; Python Programming Language -- Software Development 
  ;; -----------------------------------------------------------------
  ;;(require 'blee-python)  ;; Notyet flymake

  ;; -----------------------------------------------------------------
  ;; markdown-mode
  ;; -----------------------------------------------------------------
  ;;(require 'blee-markdown)
  (load-file "/bisos/git/auth/bxRepos/blee/env/main/blee-markdown.el")


  (funcall  '(lambda () "
**     *YASnippet*
*** TODO yasnippit should obsolete template
"
	       (require 'blee-yasnippet)  ;;; NOTYET (error "Package ‘yasnippet-snippets-’ is unavailable")
	       ))

  (funcall  '(lambda () "
**     *Auto-Complete*
"
	       ;; (require 'blee-af-auto-complete) ;;; NOTYET
	     ))

  (funcall  '(lambda () "
**     *Google Maps*
"
	       ;; (if (file-directory-p (expand-file-name "/bisos/git/auth/bxRepos/blee/env/main/google-maps.el-master"))
	       ;;     (setq load-path (cons (expand-file-name "/bisos/git/auth/bxRepos/blee/env/main/google-maps.el-master")
	       ;; 		      load-path)))
	     
	     ;;; (require 'google-maps)  NOTYET
	     ;;; (require 'org-location-google-maps) NOTYET
	       ))


  (funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Minor-Mode            ::      *LanguageTool -- +diction/style* [[elisp:(org-cycle)][| ]]
"
	       (require 'bystar-langtool)
	       ))



  (funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Menu                  ::      *ProgTools* [[elisp:(org-cycle)][| ]]
"
	       (require 'bystar-progtools-menu)
	       ))


  (funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Global-Minor-Mode     ::      *Bx Tool-Bar* [[elisp:(org-cycle)][| ]]
"
	       (require 'bx-tool-bar)
	       ))

  (funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Minor-Mode            ::      *BAC highlight-indentation* [[elisp:(org-cycle)][| ]]
"
	     ;;; (require 'bac-highlight-indentation) NOTYET
	       ))


;;;#+BEGINNOT: blee:pkg:adopt :eanble :org-level 2 pkgName
  (funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Adopted Component   ::      *Dired* [[elisp:(org-cycle)][| ]]
	
"
	       (require 'bac-dired)
	       ))
;;;#+END:


  ;; -----------------------------------------------------------------
  ;; DOS mode
  ;; -----------------------------------------------------------------
  ;;(require 'dos-mode)			; hide ^M characters


  ;; -----------------------------------------------------------------
  ;; Calc -- Arbitrary precision calculator
  ;; -----------------------------------------------------------------
  (load "bystar-calc")


  ;; -----------------------------------------------------------------
  ;; Info -- more info directories
  ;; -----------------------------------------------------------------
  (load "bystar-info")


  ;; -----------------------------------------------------------------
  ;; CALENDAR MODE -- And Appointment (APPT) -- And Diary
  ;; -----------------------------------------------------------------
  (load "bystar-calendar")


  ;; Writing / Publishing

  ;; -----------------------------------------------------------------
  ;; Dictem -- Dictionary/Thesaurus lookup
  ;; -----------------------------------------------------------------
  (load "bystar-dictem")


  ;; -----------------------------------------------------------------
  ;; LaTeX, TeX, Bib, ttytex, 
  ;; -----------------------------------------------------------------
  ;;(load "bystar-tex")  ;;;For 24.4 and 24.5 NOTYET
  (require 'bcg-tex)
  (bcg:tex:full/update)

  ;;
  ;; visible or audible bell...
  ;;
  (cond (eoe-use-sound
	 (setq visible-bell nil))
	(t
	 (setq visible-bell t)))

  ;; -----------------------------------------------------------------
  ;; Screen Dressups -- Should be Done After All Packages Have Been Loaded
  ;; -----------------------------------------------------------------

  ;;(load "dressups.el")
  ;;(eoe-dressup-auto)
  ;;(eoe-set-font "10x20")

					; Wheel mouse
  (autoload 'mwheel-install "mwheel" "Enabal mouse wheel support.")
  (mwheel-install)

  ;; -----------------------------------------------------------------
  ;; Global Key Bindings are maintained centrally in /bisos/git/auth/bxRepos/blee/env/main/blee-kbd-global.el
  ;; -----------------------------------------------------------------

  (require 'eoeKbdMenuSupport)
  (require 'blee-kbd-global)    ;;; NOTYET -- Messes up magit and other stuff


  (eoe-kbd)


  (autoload 'babel "babel"
    "Use a web translation service to translate the message MSG." t)
  (autoload 'babel-region "babel"
    "Use a web translation service to translate the current region." t)
  (autoload 'babel-as-string "babel"
    "Use a web translation service to translate MSG, returning a string." t)
  (autoload 'babel-buffer "babel"
    "Use a web translation service to translate the current buffer." t)

  (setq babel-preferred-to-language "French")

  (setq google-license-key "Q1n7eV5QFHLUgKEGMzcVQr9bX34Rv7SP")

  (require 'recentf)
  (setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
  (setq recentf-save-file (recentf-expand-file-name "~/BUE/emacs/recentf.el"))
  (recentf-mode 1)

  ;; iswitchb + recentf
  (require 'bx-iswitch)
  (bx:iswitch:all-defaults-set)

  (require 'bx-dblock)

  ;; ./bystar-m17n.el
  ;;(load "bystar-m17n.el")   ;;; NOTYET, emacs version problem -- likely simple to fix

  ;;
  ;; TOP LEVEL MENUS
  ;;

  ;; ./handset-menu-top.el
  (if (string-equal opRunDistFamily "MAEMO")
      (load "handset-menu-top")
    )   

  (require 'blee-menu-activities)
  (blee:activities:menu)

  (require 'blee-menu-blee)
  (blee:blee:menu)

  (require 'blee-menu-my)
  (blee:my:menu)

  (if (file-directory-p (expand-file-name "~/BUE/elisp"))
      (progn
	(require 'bue-acct-main)
	(if (fboundp 'bue:acct:main)
	    (bue:acct:main))
	))

  ;;
  (setq-default lpr-switches '("-2P -t"))
  (setq-default lpr-command "mpage")

  ;; /bisos/git/auth/bxRepos/blee/env/main/murl-base.el /bisos/git/auth/bxRepos/blee/env/main/murl-craigslist.el /bisos/git/auth/bxRepos/blee/env/main/murl-slink.el /bisos/git/auth/bxRepos/blee/env/main/murl-bbdb.el

  (load "murl-base.el")
  ;;(load "murl-bbdb.el")            ;;; Captures mailto: into bbdb  -- Moved into bap-bbdb.el

  ;; -----------------------------------------------------------------
  ;; GNU Server -- Should Run Last  after all else that is needed 
  ;; -----------------------------------------------------------------
  (require 'mozmail)

  ;; (when (string-equal (getenv "DISPLAY") ":0.0")
  ;;   (setq server-
  ;;   (server-force-delete)
  ;;   (server-start)
  ;;   )

  ;;(setq server-use-tcp t)


  (blee:server:ensure)

  (require 'bystar-init-screen)
  (bystar:init:startup-message)

  ;;(bystar:mail:faces:background-dark)

  (require 'color-theme)
  ;; emacsPlus/22Plus/themes/color-theme-library.el 
  (load-library "themes/color-theme-library")

  (require 'bystar-color-themes)
  (color-theme:bystar:black-green)

  (require 'bystar-printing-lib)
  (bystar:printing:all-defaults-set)


  (funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Global-Minor-Mode     ::      *festival -- TTS -- Say* [[elisp:(org-cycle)][| ]]
	Just Load. Not Setup yet. See Blee Minor Mode Panel For Details.
"
	       (load-file "/bisos/git/auth/bxRepos/blee/env/main/festival.el")
	       ))

  (funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Global-Minor-Mode     ::      *ISPELL* [[elisp:(org-cycle)][| ]]
	Just Load. 
"
	       ;;(load "bystar-ispell")
	       ))

  (funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Minor-Mode            ::      *Tabbar* [[elisp:(org-cycle)][| ]]
	Tabbar setup needs to come late in the setup, perhaps after color-theme
"
	       (require 'setup-tabbar)
	       ))


  (funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Minor-Mode            ::      *Dunamic Menu* [[elisp:(org-cycle)][| ]]
	Dynamic Menus -- Use Through Out -- For Now Centralized. Will be split across later.
"
	     ;;;(require 'blee-lib-widget)
	     ;;;(blee-lib-widget:all-defaults-set)

	     ;;;(require 'blee-comeega)
	       ))
  


  (funcall  '(lambda () "
**  [[elisp:(org-cycle)][| ]]  Temporary             ::      *old2new* [[elisp:(org-cycle)][| ]]
"
	       (load-file "/bisos/git/auth/bxRepos/blee/env/lib/old2new/elispBleePanelUpdate.el")
	       ))

  ;; 
  ;; To Be Sorted Later
  ;;

  (defun mb-policy-9 (string-arg)
    ""
    string-arg
    )

  (require 'tramp)
  (setq tramp-default-method "scp")

  (load-file "/bisos/git/auth/bxRepos/blee/env/lib/Incoming/top-mode.el")

  (load-file "/bisos/git/auth/bxRepos/blee/env/main/choose-comletion.el")

  (cd "~")

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



