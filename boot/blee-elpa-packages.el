;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string "moduleName" "blee-elpa-packages")  (replace-string "moduleTag:" "blee:elpa:")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (blee:elpa:), for handelling File_Var [[elisp:(org-cycle)][| ]]
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

;;;#+BEGIN: bx:dblock:global:org-contents-list :disabledP "false" :mode "auto"
(lambda () "
*      ################ CONTENTS-LIST   ###############
*  [[elisp:(org-cycle)][| ]]  *Document Status, TODOs and Notes*          ::  [[elisp:(org-cycle)][| ]]
*  /OBSOLETED by  org-dblock-write:bx:global:org-contents-list/

")
;;;#+END:

(lambda () "
**  [[elisp:(org-cycle)][| ]]  Idea      ::  Description   [[elisp:(org-cycle)][| ]]
")


(lambda () "
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* UNDEVELOPED just a starting point <<Xref-Here->> [[elisp:(org-cycle)][| ]]
")


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "blee-elpa-packages"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."                :: Loading Announcement Message blee-elpa-packages [[elisp:(org-cycle)][| ]]
")

;;;(blee:msg "Loading: blee-elpa-packages")
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires                    :: Requires [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry                   :: blee:elpa:main-init [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:elpa:main-init) [[elisp:(org-cycle)][| ]]
")

;;; (blee:elpa:main-init)
(defun blee:elpa:main-init ()
  "Desc:"
  (setq package-user-dir (blee:elpa:base-obtain))

  (message (format "package-user-dir=%s" package-user-dir))

  ;; Below require will auto-create `package-user-dir' it doesn't exist.
  (require 'package)

  (blee:elpa:repositories:setup)

  (blee:elpa:install-if-needed 'use-package)  
  ;;;(bx:package:install-if-needed 'org-bullets)

  (bx:package:install:all)
  
  )



;;; (blee:elpa:repositories:setup)
(defun blee:elpa:repositories:setup ()
  ""
  (interactive)

  (setq package-archives nil)

  ;;(package-initialize)
  (unless package--initialized (package-initialize t))

  (add-to-list 'package-archives
  	       '("gnu" . "https://elpa.gnu.org/packages/"))
  
  (add-to-list 'package-archives
  	       '("melpa" . "https://melpa.milkbox.net/packages/") t)
  ;;;)

  (when (equal emacs-major-version 24)
    (add-to-list 'package-archives
		 '("marmalade" . "http://marmalade-repo.org/packages/") t)
    )

  (package-refresh-contents)

  ;;(package-list-packages)
  ;;(quit-window)
  
  )


;;
;; (package-installed-p 'use-package)
;; (package-install 'use-package)
;; 
;; (blee:elpa:install-if-needed 'use-package)
;; 
(defun blee:elpa:install-if-needed (package)
  (unless (package-installed-p package)
    (package-install package)))

;;
;; (bx:package:install-if-needed 'yasnippet-snippets)
;; 
(defun bx:package:install-if-needed (package)
  (unless (package-installed-p package)
    (package-install package)))


;;; (bx:package:install:all)
(defun bx:package:install:all ()
  "\
Does not run at start up. Run as new packages are to be installed.
"
  (interactive)

  (package-refresh-contents)

  ;; make more packages available with the package installer
  (let (
	(to-install)
	)
    (setq to-install
	  '(
	    auto-complete
	    auctex
	    yasnippet 
	    jedi 
	    autopair 
	    python-mode 
            flymake-python-pyflakes
	    magit
	    google-maps
	    highlight-indentation
	    tabbar
	    ;;ipython 25f
	    realgud
	    ;;
	    offlineimap
	    notmuch
	    ;;
	    w3m
	    bbdb
	    emms
	    f
	    load-dir
	    markdown-mode
	    ;;
	    seq
	    ;;rw-hunspell 25f
	    ;;
	    ;;helm
	    ;;
	    ;;fill-column-indicator
	    ;;dic-lookup-w3m
	    ;;find-file-in-repository
	    )
	  )
    (when (equal emacs-major-version 24)
      (add-to-list 'to-install 'ipython)
      (add-to-list 'to-install 'rw-hunspell)
      )
    (mapc 'bx:package:install-if-needed to-install)
    )
  )


;;; (bx:package:install:update)
(defun bx:package:install:update ()
  "\
Does not run at start up. Run as new packages are to be installed.
"
  (interactive)

  (package-refresh-contents)

  ;; make more packages available with the package installer
  (let (to-install)
    (setq to-install
	  '(
	    f
	    helm
	    ;;
	    ;;fill-column-indicator
	    ;;dic-lookup-w3m
	    ;;find-file-in-repository
	    )
	  )
    (mapc 'bx:package:install-if-needed to-install)
    )
  )





;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "blee-elpa-packages"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-elpa-packages)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
