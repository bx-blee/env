;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-


(lambda () "
* Description And Design
** 
** This Information should be moved to a BleePanel and blee manual etc.
** 
** Global Minor Modes Plus gmmp:
** 
** 
")

(defvar orgCmntEnd nil "Org Comment End")

(defun orgCmntBegin (<comment <commentEnd)
  "Org Comment Begin. Permits us to include * at the beginning of line as a comment.
Example usage is: 
(orgCmntBegin \"multi-line comment comes here.\" orgCmntEnd)

I wish elisp had a here-document facility. Like common-lisp.
Anybody listening?"
)

(orgCmntBegin "
** TODO NOTYET, absorb orgCmntBegin in the right place.
   SCHEDULED: <2021-02-17 Wed>
" orgCmntEnd)

(lambda () "

Next Steps
Capture this in a function.

Also, consider 

(featurep 'org-roam)

(if org-roam-mode
    (message \"Enabled\")
  (message \"Disabled\"))

Add engine/primary engine/secondary
Add C-c s 1 for primary 2 and 3.
C-c s 0 is list subject to words for globish.
C-c s 9 is list subject to words for secondary language.

")

(require 'easymenu)

(require 'org-roam-server-menu)

;; (gmmp:menu-bar/install)
(defun gmmp:menu-bar/install ()
  "Primary interface."
  
  (interactive)
  (gmmp:menu:global|define)
  
  (add-hook 'menu-bar-update-hook 'gmmp:menu-bar-update-hook)
  )

;;(setq browse-url-default-browser 'browse-url-chrom)



(defun gmmp:menu-bar-update-hook ()
  "This is to be added to menu-bar-update-hook. 
It runs everytime any menu is invoked.
As such what happens below is exactly what is necessary and no more."

  (gmmp:menu:global|define)
  )

;;
;; http://www.neda.com
;;

(defun s-- (<repeat)
  "Example: (s-- 3). Visually shorter than (s-repeat 3 \"-\"
For use in delimiters in easy-menu-define"
  (s-repeat <repeat "-"))

;;
;; http://www.neda.com
;; http://mohsen.1.banan.byname.net
;; 

;; (gmmp:menu:global|define)
(defun gmmp:menu:global|define ()
  "Top level menu for all things global minor mode related."
  (let (($thisFuncName (compile-time-function-name)))
    (easy-menu-define
      gmmp:menu:global
      global-map
      "Global Minor Mode Plus Menu"
      `("GMMP"
	:help "Global Minor Mode Plus Menu (GMMP)"
	,(s-- 3)
	,(s-- 4)
	,(s-- 5)
	,(s-- 6)
	,(s-- 7)
	,(s-- 8)	
	))

    (easy-menu-add-item
     nil '("GMMP")
     (gmmp:menuItem:selected-if:browse-at-point|define)
     (s-- 3))

    (easy-menu-add-item
     nil '("GMMP")  
     ;; (gmmp:menu:browse-url:at-point|define :active nil :visible nil)
     (gmmp:menu:browse-url:at-point|define :active t)
     (s-- 3))

    (easy-menu-add-item
     nil '("GMMP")
     (gmmp:menuItem:selected-if:search-with|define)
     (s-- 4))

    (web:search:gmmp:menu:plugin/install gmmp:menu:global (s-- 4))    

    ;; 6 dashed
    ;;
    (if (package-installed-p 'org-roam-server)
	(easy-menu-add-item
	 nil '("GMMP") (org-roam-server:menu|define) "------")
      (easy-menu-add-item
       nil '("GMMP") (org-roam-server:menu:stub|define :active nil) "------")
      )

    ;; (easy-menu-add-item
    ;;  gmmp:menu:global nil
    ;;  (web:search:menu|define :active t)
    ;;  (s-- 7)
    ;;  )

    
    (easy-menu-add-item
     nil '("GMMP")
     (gmmp:menu:help|define))
    )
  )

;;
;; (org-roam-server:menu:stub|define)
;; (org-roam-server:menu:stub|define :active nil)
;; 
(defun org-roam-server:menu:stub|define (&rest <namedArgs)
  "org-roam-server menu."
  (let (
	(<active (get-arg <namedArgs :active t))
	(<visible (get-arg <namedArgs :visible t))
	($thisFuncName (compile-time-function-name))
	)

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
;; (gmmp:menuItem:selected-if:browse-at-point|define)
(defun gmmp:menuItem:selected-if:browse-at-point|define ()
  "Returns a menuItem vector. Requires dynamic update."
  (car
   `(
     [,(format "Browse At-Point With Selected-IF:\n  %s"
	       browse-url-browser-function)
      (find-file-at-point (ffap-url-at-point))
      :help "Selected-IF -- Browse at-point with current value of browse-url-browser-function"
      :active t
      :visible t
      ]
     )))

;; 
(defun gmmp:menuItem:selected-if:search-with|define ()
  "Returns a menuItem vector. Requires dynamic update."
  (car
   `(
     [,(format "Selected-IF -- Search with:\n %s"
	       gmmp:search-engine:selected)
      (find-file-at-point gmmp:search-engine:selected)
      :help "Selected-IF -- Search with selected browser setting and selected engine"
      :active t	 
      :visible t
      ]
     )))


(defun blee:browse|withUrls (<urls)
  (mapcar (lambda (<each)
	    (funcall browse-url-browser-function
		     <each)
	    )
	  <urls)
  (format "Last Executed: %S" (current-time-string)))


;;
;; [[elisp:(popup-menu (symbol-value (gmmp:menu:help|define)))][Help Me]]
;; (popup-menu (symbol-value (gmmp:menu:help|define)))
;;
(defun gmmp:menu:help|define ()  
  "Generic Gmmp Help Menu"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      gmmp:menu:help
      nil
      "Help Menu For xia"
      `("xia Help"
	:help "Help For This Menu"
	["Visit xia Help Panel"
	 gmmp:gmmp:menu:overview-help
	 t
	 ]	 ;;; Notyet, should point to panel instead
	"---"
	[,(format "Visit %s" $thisFuncName)
	 (find-function (intern ,$thisFuncName))
	 t
	 ]	
	)
      )
    'gmmp:menu:help
    ))


(when (equal blee:emacs:id '26f)
  (defvar browse-url-secondary-browser-function nil
    "Fake temporary 26f variable for same as introduced in 27f"))

;;
;; [[elisp:(popup-menu (symbol-value (gmmp:menu:help|define)))][This Menu]]
;; (popup-menu (symbol-value (gmmp:menu:browse-url:at-point|define)))
;;
(defun gmmp:menu:browse-url:at-point|define (&rest <namedArgs)
  "Returns org-roam-server:menu.
:active and :visible can be specified as <namedArgs.
"
  (let (
	(<visible (get-arg <namedArgs :visible t))
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    ;; (setq $:gmmp:menu:browse-url:at-point:active <active)
    (setq $:gmmp:menu:browse-url:at-point:visible <visible)    

    (easy-menu-define
      gmmp:menu:browse-url:at-point
      nil
      "Menu For Configuration Of browse-url-browser-function"
      `("Select At-Point Url Browser"
	:help "Show And Set Relevant Parameters"
	:visible $:gmmp:menu:browse-url:at-point:visible
	:active ,<active
	"---"	
	[
	,(format "**browse-url-browser-function =\n %s**" browse-url-browser-function)	 
	  (describe-variable 'browse-url-browser-function)
	  :help "Describe current value of browse-url-browser-function"
	  :active t
	  :visible t
	  ]
	[
	 ,(format "**browse-url-secondary-browser-function =\n %s**" browse-url-secondary-browser-function)		 
	  (describe-variable 'browse-url-secondary-browser-function)
	  :help "Describe current value of browse-url-secondary-browser-function"
	  :active t
	  :visible t
	  ]	 
	"---"
	"---"
	 [
	  "XIA Browser Frame"
	  (setq browse-url-browser-function 'gmmp:xinf:selected:browse-url/at-point)
	  :help "gmmp:xinf:selected:browse-url/at-point is based on NOTYET"
	  :active t
	  :visible t
	  :style radio	  
	  :selected ,(eq browse-url-browser-function 'gmmp:xinf:selected:browse-url/at-point)
	  ]
	 [
	  "Firefox"
	  (setq browse-url-browser-function 'browse-url-firefox)
	  :help "Send Url to Firefox tab with: browse-url-firefox"
	  :active t
	  :visible t
	  :style radio	  
	  :selected ,(eq browse-url-browser-function 'browse-url-firefox)
	  ]
	 [
	  "Chrome"
	  (setq browse-url-browser-function 'browse-url-chrome)
	  :help "Send Url to Chrom new tab with: browse-url-chrome"
	  :active t
	  :visible t
	  :style radio	  
	  :selected ,(eq browse-url-browser-function 'browse-url-chrome)
	  ]
	 [
	  "Chromium"
	  (setq browse-url-browser-function 'browse-url-chromium)
	  :help "Send Url to Chrom new tab with: browse-url-chromium"
	  :active t
	  :visible t
	  :style radio	  
	  :selected ,(eq browse-url-browser-function 'browse-url-chromium)
	  ]
	 [
	  "EWW"
	  (setq browse-url-browser-function 'eww-browse-url)
	  :help "Send Url to eww with eww-browse-url"
	  :active t
	  :visible t
	  :style radio
	  :selected ,(eq browse-url-browser-function 'eww-browse-url)
	  ]	 
	))
    'gmmp:menu:browse-url:at-point
    ))

(setq gmmp:search-engine:selected "NOTYET")


(defun gmmp:menu:search-engines|define ()
  "Top Level Menu For eXternal Integrated emacs-Apps and Frames"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    
    (defun $selected-set (@searchEngineUrl)
      (setq gmmp:search-engine:selected @searchEngineUrl)
      (gmmp:menu:top:xia|define)
      )

    (easy-menu-define
      gmmp:menu:search-engines
      nil
      "Menu Search Engine Selections"
      `("Search Engine Selections"
	:help "Show And Set Selection Of Search Engine by gmmp:search-engine:selected"
	"---"
	,(format "**gmmp:search-engine:selected = %s**" gmmp:search-engine:selected)
	"---"	
	("Show Search Engine Current Settings"	
	 [
	  "gmmp:search-engine:selected"
	  (describe-variable 'gmmp:search-engine:selected)
	  :help "Describe current value of gmmp:search-engine:selected"
	  :active t
	  :visible t
	  ]
	 )
	"---"
	("Select Search Engine"
	 [
	  "duckduckgo"
	  ($selected-set "https://duckduckgo.com")
	  :help "Set gmmp:search-engine:selected to https://duckduckgo.com"
	  :active t
	  :visible t
	  ]
	 [
	  "google"
	  ($selected-set "https://google.com")
	  :help "Set gmmp:search-engine:selected to https://google.com"
	  :active t
	  :visible t
	  ]
	 [
	  "bing"
	  ($selected-set "https://bing.com")
	  :help "Set gmmp:search-engine:selected to https://bing.com "
	  :active t
	  :visible t
	  ]	 
	 )
	"---"
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]	
	))
    'gmmp:menu:search-engines
    ))


(provide 'gmmp-menu)

