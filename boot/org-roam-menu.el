;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(lambda () "
* Authors: Mohsen Banan
* Copying And Usage: List is a perpetual Libre-Halaal polyexistential.
* Description And Design
** 
** 
")


(require 'easymenu)

(define-key global-map [menu-bar org-roam:menu:global] nil)
(define-key global-map [menu-bar "Roam"] nil)

;; (org-roam:menu-bar/install)
(defun org-roam:menu-bar/install ()
  "Primary interface."
  
  (interactive)
  (org-roam:menu:global|define)
  (add-hook 'menu-bar-update-hook 'org-roam:menu-bar-update-hook)
  )


(defun org-roam:menu-bar-update-hook ()
  "This is to be added to menu-bar-update-hook. 
It runs everytime any menu is invoked.
As such what happens below is exactly what is necessary and no more."
  
  (easy-menu-add-item
   nil '("Roam") (org-roam:menuItem:param:org-roam-directory|define) "---")
    
  (easy-menu-add-item
   nil '("Roam") (org-roam:menuItem:param:org-roam-db-location|define) "---")
  )



;; (bxt:var/localized 'org-roam-directory)
(defun bxt:var/localized (<varName)
  "Return the value of <varName. Buffer or directory local vars are accounted for."
  (let (($varValue))
    (save-excursion
      (set-buffer (current-buffer))
      (setq $varValue (eval <varName))
      )
    $varValue
    ))


;; (org-roam:menu:global|define)
(defun org-roam:menu:global|define ()
  "Top level menu for all things org-roam related."
  (let (($thisFuncName (compile-time-function-name)))
    (easy-menu-define
      org-roam:menu:global
      global-map
      "Global org-roam menu"
      `("Roam"
	:help "Org-Roam And Roam-Server Primary Actions"
	"---"
	"----"
	"-----"
	"------"	
	))
    
    (easy-menu-add-item
     nil '("Roam") (org-roam:menuItem:param:org-roam-directory|define) "---")

    (easy-menu-add-item
     nil '("Roam") (org-roam:menuItem:param:org-roam-db-location|define) "---")

    (easy-menu-add-item
     nil '("Roam") (org-roam:menuItem:db-update|define) "----")

    (easy-menu-add-item
     nil '("Roam") (org-roam:menuItem:buffer-toggle|define) "----")

    (easy-menu-add-item
     nil '("Roam") (org-roam:menuItem:buffer-display|define) "----")

    (easy-menu-add-item
     nil '("Roam") (org-roam:menuItem:buffer-hide|define) "----")

    (if (package-installed-p 'org-roam-server)
	(easy-menu-add-item
	 nil '("Roam") (org-roam-server:menu|define) "-----")
      (easy-menu-add-item
       nil '("Roam") (org-roam-server:menu:stub|define :active nil) "-----")
      )
    
    ;; NOTYET org-roam-bibtex:menu|define has not been implemented yet
    ;;(if (package-installed-p 'org-roam-bibtex)  
    (if nil
	(easy-menu-add-item
	 nil '("Roam") (org-roam-bibtex:menu|define) "-----")
      (easy-menu-add-item
       nil '("Roam") (org-roam-bibtex:menu:stub|define :active nil) "-----")
      )
    
    (easy-menu-add-item
     nil '("Roam") (org-roam:subMenu:help|define) "------")    
    )
  )

;; (org-roam:menuItem:param:org-roam-directory|define)
(defun org-roam:menuItem:param:org-roam-directory|define ()
  "Returns a menuItem vector for a param (perhap dynamically)"
  (setq $:org-roam:menuItem:params:org-roam-directory
	(format "org-roam-directory=\n  %s"
		(bxt:var/localized 'org-roam-directory)))
  [
   $:org-roam:menuItem:params:org-roam-directory
   (describe-variable 'org-roam-directory)      
   t
   ]
  )

;; (org-roam:menuItem:param:org-roam-db-location|define)
(defun org-roam:menuItem:param:org-roam-db-location|define ()
  "Returns a menuItem vector for a param (perhap dynamically)"
  (setq $:org-roam:menuItem:params:org-roam-db-location
	(format "org-roam-db-location=\n  %s"
		(bxt:var/localized 'org-roam-db-location)))
  [
   $:org-roam:menuItem:params:org-roam-db-location
   (describe-variable 'org-roam-db-location)      
   t
   ]
  )

;; (find-function 'org-roam:menuItem:db-update|define)
;; (org-roam:menuItem:db-update|define)
(defun org-roam:menuItem:db-update|define ()
  [
   "Re-Build The Data Base"
   (org-roam-db-update)
   :help "Refresh the database"
   :active t	 
   :visible t
   ]
  )

(defun org-roam:menuItem:buffer-toggle|define ()
  [
   "Toggle Display Of org-roam buffer"
   (org-roam)
   :help "Toggle"
   :active t	 
   :visible t
   ]
  )

(defun org-roam:menuItem:buffer-display|define ()
  [
   "Display org-roam buffer"
   (org-roam)
   :help "Display"
   :active t	 
   :visible t
   ]
  )

(defun org-roam:menuItem:buffer-hide|define ()
  [
   "Hide org-roam buffer"
   (org-roam)
   :help "Hide"
   :active t	 
   :visible t
   ]
  )


;; (org-roam:subMenu:help|define)
(defun org-roam:subMenu:help|define ()  
  "Generic Blee Help Menu"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      org-roam:subMenu:help
      nil
      "Help Menu For org-roam"
      `("org-roam Help"
	:help "Help For This Menu"
	["Visit org-roam Help Panel"
	 blee:blee:menu:overview-help
	 t
	 ]	 ;;; Notyet, should point to panel instead
	"---"
	[,(format "Visit %s" $thisFuncName)
	 (find-function (intern ,$thisFuncName))
	 t
	 ]	
	)
      )
    'org-roam:subMenu:help
    ))

;;
;; (org-roam-server:menu:stub|define)
;; (org-roam-server:menu:stub|define :active nil)
;; 
(defun org-roam-server:menu:stub|define (&rest <namedArgs)
  "org-roam-server menu."
  (let (
	(<active (or (plist-get <namedArgs :active) nil))
	(<visible (or (plist-get <namedArgs :visible) nil))	
	($thisFuncName (compile-time-function-name))
	)

    (unless (plist-member <namedArgs :active)
      (setq <active t))
    (unless (plist-member <namedArgs :visible)
      (setq <visible t))

    (setq $:org-roam-server:menu:active <active)
    (setq $:org-roam-server:menu:visible <visible)    
    
    (easy-menu-define
      org-roam-server:menu
      nil
      "org-roam-server menu"
      `("org-roam Server"
	:help "Show And Set Relevant Parameters"
	:active $:org-roam-server:menu:active
	:visible $:org-roam-server:menu:visible
	"---"
	))
    'org-roam-server:menu
    ))

;;
;; (org-roam-server:menu:stub|define)
;; (org-roam-server:menu:stub|define :active nil)
;; 
(defun org-roam-server:menu:stub|define (&rest <namedArgs)
  "org-roam-server menu."
  (let (
	(<active (or (plist-get <namedArgs :active) nil))
	(<visible (or (plist-get <namedArgs :visible) nil))	
	($thisFuncName (compile-time-function-name))
	)

    (unless (plist-member <namedArgs :active)
      (setq <active t))
    (unless (plist-member <namedArgs :visible)
      (setq <visible t))

    (setq $:org-roam-server:menu:active <active)
    (setq $:org-roam-server:menu:visible <visible)    
    
    (easy-menu-define
      org-roam-server:menu
      nil
      "org-roam-server menu"
      `("org-roam Server"
	:help "Show And Set Relevant Parameters"
	:active $:org-roam-server:menu:active
	:visible $:org-roam-server:menu:visible
	"---"
	))
    'org-roam-server:menu
    ))



;;
;; (org-roam-bibtex:menu:stub|define)
;; (org-roam-bibtex:menu:stub|define :active nil)
;; 
(defun org-roam-bibtex:menu:stub|define (&rest <namedArgs)
  "org-roam-bibtex menu."
  (let (
	(<active (or (plist-get <namedArgs :active) nil))
	(<visible (or (plist-get <namedArgs :visible) nil))	
	($thisFuncName (compile-time-function-name))
	)

    (unless (plist-member <namedArgs :active)
      (setq <active t))
    (unless (plist-member <namedArgs :visible)
      (setq <visible t))

    (setq $:org-roam-bibtex:menu:active <active)
    (setq $:org-roam-bibtex:menu:visible <visible)    
    
    (easy-menu-define
      org-roam-bibtex:menu
      nil
      "org-roam-bibtex menu"
      `("org-roam Bibtex"
	:help "Show And Set Relevant Parameters"
	:active $:org-roam-bibtex:menu:active
	:visible $:org-roam-bibtex:menu:visible
	"---"
	))
    'org-roam-bibtex:menu
    ))


;;
;; (org-roam-server:menu|define)
;; (org-roam-server:menu|define :active nil)
;; 
(defun org-roam-server:menu|define (&rest <namedArgs)
  "org-roam-server menu."
  (let (
	(<active (or (plist-get <namedArgs :active) nil))
	(<visible (or (plist-get <namedArgs :visible) nil))	
	($thisFuncName (compile-time-function-name))
	)

    (unless (plist-member <namedArgs :active)
      (setq <active t))
    (unless (plist-member <namedArgs :visible)
      (setq <visible t))

    (setq $:org-roam-server:menu:active <active)
    (setq $:org-roam-server:menu:visible <visible)    

    (easy-menu-define
      org-roam-server:menu
      nil
      "org-roam-server menu"
      `("org-roam Server"
	:help "Show And Set Relevant Parameters"
	:active $:org-roam-server:menu:active
	:visible $:org-roam-server:menu:visible
	"---"	
	 [
	  "Server Start"
	  (describe-variable 'browse-url-browser-function)
	  :help "Describe current value of browse-url-browser-function"
	  :active t
	  :visible t
	  ]
	 ["Server Stop"
	  (describe-variable 'browse-url-secondary-browser-function)
	  :help "Describe current value of browse-url-secondary-browser-function"
	  :active t
	  :visible t
	  ]	 
	"----"
	 [
	  "Visit Server"
	  ($set-selected 'blee:xinf:selected:browse-url/at-point)
	  :help "blee:xinf:selected:browse-url/at-point is based on NOTYET"
	  :active t
	  :visible t
	  ]
	"---"
	[,(format "Visit %s" $thisFuncName)
	 (describe-function (intern ,$thisFuncName))
	 t
	 ]	
	))
    'org-roam-server:menu
    ))


(provide 'org-roam-menu)

