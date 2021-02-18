;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(lambda () "
* Authors: 
** Mohsen Banan --  http://mohsen.1.banan.byname.net/contact
** Email: emacs at mohsen.1.banan.byname.net
* Copying And Usage: This is a perpetual Libre-Halaal polyexistential.
* Functional Specification:
** 
** 
")

(require 'browse-url)

(require 'easymenu)


;; (web:search:gmmp:menu:plugin/install gmmp:menu:global (s-- 6))
(defun web:search:gmmp:menu:plugin/install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."
  (interactive)

  (easy-menu-add-item
   <menuLabel
   nil
   (web:search:menu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'web:search:menu|update-hook)
  )

(defun web:search:menu|update-hook ()
  "This is to be added to menu-bar-update-hook. 
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  (web:search:menu|define)
  )

;;
;; (web:search:menu|define)
;; (web:search:menu|define :active nil)
;; (popup-menu (symbol-value (web:search:menu|define)))
;; 
(defun web:search:menu|define (&rest <namedArgs)
  "Returns web:search:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)
    
    ;; (setq $:web:search:menu:visible <visible)    ;; because ,visible does not work

    (easy-menu-define
      web:search:menu
      nil
      "web:search menu"
      `("Web Search Global Minor Mode (engine-mode) 22"
	:help "Show And Set Relevant Parameters"
	:active ,<active
	:visible t
	,(s-- 3)
	,(s-- 4)
	,(s-- 5)
	,(s-- 6)
	,(s-- 7)
	,(s-- 8)	
	))

    (easy-menu-add-item web:search:menu nil
			(web:search:menu:help|define) "-----")
    (easy-menu-add-item
     web:search:menu nil
     (web:search:menuItem:selected-browser-function|define)
     (s-- 3))

    (easy-menu-add-item
     web:search:menu nil     
     (web:search:menuItem:selected-engine|define)
     (s-- 4))

    (easy-menu-add-item
     web:search:menu nil
     (web:search:with-engine/menuSelectDef)     
     (s-- 5))

    (easy-menu-add-item
     web:search:menu nil          
     (web:search:menu:help|define)
     (s-- 8))
    
    'web:search:menu
    ))



;;
;; (web:search:menuItem:selected-browser-function|define)
(defun web:search:menuItem:selected-browser-function|define ()
  "Returns a menuItem vector. Requires dynamic update."
  (car
   `(
     [,(format "Selected Web Search Browser:\n  %s"
	       engine/browser-function)
      (describe-variable 'engine/browser-function)
      :help "Selected Web Search Browser -- (describe-variable 'engine/browser-function)"
      :active t
      :visible t
      ]
     )))

;;
(defun web:search:menuItem:selected-engine|define ()
  "Returns a menuItem vector. Requires dynamic update."
  (car
   `(
     [,(format "Selected Engine:\n %s"
	       engine/selected)
      (describe-variable 'engine/selected)
      :help "Selected engine -- (describe-variable 'engine/selected)"
      :active t	 
      :visible t
      ]
     )))


;;
;; (web:search:with-engine/menuSelectDef)
;; 
(defun web:search:with-engine/menuSelectDef ()
  ""
  (interactive)
  (let (
	($menuHeading "Search With Engine")
	)  
    (easy-menu-define
      web:search:with-engine
      nil
      "" 
      (append
       (list $menuHeading)
       (list "---")
       (mapcar (lambda (<each)
		 (vector (format "Search With: %s" <each)
			 `(call-interactively ',<each)
			 )
		 )
	       (engine/list-commands)
	       )))
    'web:search:with-engine
    ))



;; (web:search:menu:help|define)
(defun web:search:menu:help|define ()  
  "Generic Blee Help Menu"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      web:search:menu:help
      nil
      "Help Menu For web:search"
      `("web:search Help"
	:help "Help For This Menu"
	["Visit web:search Help Panel"
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
    'web:search:menu:help
    ))

(provide 'engine-mode-menu)

