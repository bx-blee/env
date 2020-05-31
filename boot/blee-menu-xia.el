;;;
;;;

(require 'easymenu)

(require 'blee-doc-howto)   ;;; NOTYET -- un-needed -- remove after cleanup after 

(lambda () "
* TODO Blee Frames Design -- Place Holder
  SCHEDULED: <2020-05-28 Thu>
** 
** This Information should be moved to blee manual etc.
** 
** A Model For Emacs Frames And Linked Application Windows 
*** Native Emacs Frames
*** eXternally Integrated Emacs Frames (XIF)
*** Linked Application Windows 
*** Named Blee Emacs Frames (Listed) <<namedBleeFrames>>
**** Primary Native Emacs Frame
**** Secondary Native Emacs Frame
**** Web-Browser-At-Point Frame
**** Web-Browser-Html-File Frame
**** Web-Browser-Interactive Frame
**** PDF-Viewer-At-Point Frame
**** 
** 
** Blee Named Frames
Availability of a number of emacs frames is assumed. These are called [[namedBleeFrames]]
Creation of windows within these buffers and display of buffers in the named frames is 
part of blee.
*** List of Named Blee Emacs Frames as defvars
*** Initial implementation of Web-Browser-At-Point Frame
*** Raising of named-frames
*** Adoption of frame-fnc.el from both noah friedman and xxx
** 
")


(lambda () "
* Global Blee Menu

")


;;;
;;; Global Blee Menu
;;;


;; (get-frame-name)
;; (get-a-frame "blee:xia:browser:atpoint")
;; (read-frame "specify frame name:")
;; (flash-ding)

;; (blee:xia:frame:at-point)

;; (progn 
;;   (make-frame-visible
;;    (get-a-frame "blee:xia:browser:atpoint")
;;    )

;;   (raise-frame
;;    (get-a-frame "blee:xia:browser:atpoint")
;;    )
;;   )

;; (select-frame-set-input-focus (get-a-frame "blee:xia:browser:atpoint"))

;; (iconify-or-deiconify-frame (get-a-frame "blee:xia:browser:atpoint"))
;; (iconify-frame (get-a-frame "blee:xia:browser:atpoint"))

;; (frame-visible-p (get-a-frame "blee:xia:browser:atpoint"))


  
(defun blee:xia:frame:at-point ()
  (let (
	($name "blee:xia:browser:atpoint")
	)
    (make-frame `((name                 . ,$name)
                  (icon-name            . ,$name)
                  (title                . "some Title")
                  (menu-bar-lines       . 1)
                  (tool-bar-lines       . 3)
                  (vertical-scroll-bars . t)
		  )
		)
    ))



(defvar blee:search-engine:primary "https://duckduckgo.com"
  "The primary blee search-engine.")

;; (blee:menu:top:xia|define) 
(defun blee:menu:top:xia|define ()
  "Top Level Menu For eXternal Integrated emacs-Apps and Frames"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      blee:menu:top|xia
      global-map
      "Global XIA Menu"
      `("XIA" :help "eXternally Integrated Apps"
	["XIA Blee Panel" bx:bnsm:top:panel-blee t]
	"---"
	[
	 ,(format "Browse with %s" browse-url-browser-function)
	 (find-file-at-point  blee:search-engine:primary)
	 :help "Current setting for browse-url-browser-function"
	 :active t
	 :visible t
	 ]
	"----"
	[
	 ,(format "Search with %s" blee:search-engine:primary)
	 (find-file-at-point blee:search-engine:primary)
	 :help "Search with selected browser setting and selected engine"
	 :active t
	 :visible t
	 ]
	"-----"
	[
	 ,(format "XIA Browser At-Point Destination %s" blee:search-engine:primary)
	 (find-file-at-point blee:search-engine:primary)
	 :help "Uses this function"
	 :active t
	 :visible t
	 ]
	"------"
	))

    (blee:menu:browse-url|define)
    (easy-menu-add-item nil '("XIA") 'blee:menu|browse-url "----")
    
    (blee:menu:search-engines|define)
    ;;(easy-menu-add-item nil '("XIA") 'blee:menu|search-engines "XIA Help")
    (easy-menu-add-item nil '("XIA") 'blee:menu|search-engines "-----")    

    (blee:menu:destinations|define)
    (easy-menu-add-item nil '("XIA") 'blee:menu|destinations  "------")

    (blee:menu:xia:help|define)
    (easy-menu-add-item nil '("XIA") 'blee:menu:xia|help)
    )
  )


(defun blee:menu:xia:help|define ()
  "Top Level Menu For eXternal Integrated emacs-Apps and Frames"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      blee:menu:xia|help
      nil
      "Menu For XIA"
      `("XIA Help" :help "Help For This Menu"
	["Help: Blee Overview" blee:blee:menu:overview-help t]	
	"---"
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]	
	))
    ))



;; 
(defun blee:menu:browse-url|define ()
  "Top Level Menu For eXternal Integrated emacs-Apps and Frames"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      blee:menu|browse-url
      nil
      "Menu For Configuration Of browse-url"
      `("Browse-URL Selections" :help "Show And Set Relevant Parameters"
	[,(format "Browse with %s" browse-url-browser-function) (find-file-at-point  blee:search-engine:primary)  t]	
	"---"	
	("Show Current Settings"	
	 ["browse-url-browser-function" (describe-variable 'browse-url-browser-function) t]
	 ["browse-url-secondary-browser-function" (describe-variable 'browse-url-secondary-browser-function) t]	 
	 )
	"---"
	("Select At Point Url Browser"
	 ["XIA Browser Frame" (setq browse-url-browser-function 'blee:xif:browse-url/at-point) t]
	 ["Firefox" (setq browse-url-browser-function 'browse-url-firefox) t]
	 ["Chrome" (setq browse-url-browser-function 'browse-url-chromium) t]
	 ["Default Browser" (setq browse-url-browser-function 'browse-url-default-browser) t]	 
	 )
	"---"
	("Select Mail Html Browser"
	 ["XIA Browser Frame" (setq browse-url-browser-function 'blee:browse-url/dispatch) t]
	 ["Firefox" (setq browse-url-browser-function 'browse-url-firefox) t]
	 ["Chrome" (setq browse-url-browser-function 'browse-url-chromium) t]
	 ["Default Browser" (setq browse-url-browser-function 'browse-url-default-browser) t]	 
	 )
	"---"
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]	
	))
    ))




(defun blee:menu:destinations|define ()
  "Top Level Menu For eXternal Integrated emacs-Apps and Frames"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      blee:menu|destinations
      nil
      "Menu For Common Destinations"
      `("Common Destinations" :help "Show And Set Relevant Parameters"
	["duckduckgo" (find-file-at-point "https://www.duckduckgo.com") t]
	["google" (find-file-at-point "https://google.com") t]	 
	["bing" (find-file-at-point "https://bing.com") t]	 
	"---"
	("ByStar"
	["by-star.net" (find-file-at-point "http://www.by-star.net") t]
	["neda.com" (find-file-at-point "http://www.neda.com") t]	 
	["ByStar Overview Presentation" (find-file-at-point "http://www.by-star.net/PLPC/180054") t]	 
	 )
	"---"
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]	
	))
    ))

(defun blee:menu:search-engines|define ()
  "Top Level Menu For eXternal Integrated emacs-Apps and Frames"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      blee:menu|search-engines
      nil
      "Menu For Common Destinations"
      `("Search Engine Selections" :help "Show And Set Relevant Parameters"
	"---"
	[,(format "Search with %s" blee:search-engine:primary) (find-file-at-point blee:search-engine:primary)  t]	
	"---"	
	("Show Search Engine Current Settings"	
	 ["blee:search-engine:default" (describe-variable 'blee:search-engine:primary) t]
	 )
	"---"
	("Select Search Engine"
	 ["duckduckgo" (progn (setq blee:search-engine:primary "https://duckduckgo.com") (blee:menu:top:xia|define)) t]
	 ;;["google"  (custom-set-default blee:search-engine:primary "https://google.com")  t]
	 ["google"  (progn (setq blee:search-engine:primary "https://google.com") (blee:menu:top:xia|define))  t]
	 ["bing" (progn (setq blee:search-engine:primary "https://bing.com") (blee:menu:top:xia|define)) t]	 
	 )
	"---"
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]	
	))
    ))



(provide 'blee-menu-xia)

