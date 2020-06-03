;;;
;;;

(lambda () "
* Description And Design
** 
** This Information should be moved to blee manual etc.
** 
** A Model For Emacs Frames And Linked Application Windows 
In Blee, Availability of a number of emacs frames is assumed. These frames are named.
*** Named-Frames (union of Native Named Frames and XINF)
*** Native Named Frames (NNF)
*** eXternally Integrated Emacs Frames (XINF)
XINFs contain eXternally Integrated Applications (XIA) such as a browser.
XIA is the layer above eaf (emacs-application-framework) that is associated 
with named frames.
*** Linked Application Windows 
Linked Application Window is an external (non-integrated) application such as firefox.
**
")




(lambda () "
* Requires
")

(require 'easymenu)
(require 'blee-doc-howto)   ;;; NOTYET -- un-needed -- remove after cleanup after 



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


(lambda () "
* Constants, Variables
For Named Frames and More
")

(lambda () "
** NF :: Named Frame Structure
")

(cl-defstruct  blee:named-frame:struct:
  "Named Frames Structure"
  (name nil :read-only t)
  title
  type
  description
  )

(lambda () "
** NF :: List Of Named Frames
")

(defvar
  blee:named-frame:list
  (list
   "blee:xinf:name:web-browser:interactive:default"
   "blee:xinf:name:web-browser:at-point:default"
   "blee:xinf:name:web-browser:at-point:news"
   "blee:xinf:name:web-browser:at-point:bxde"
   "blee:xinf:name:web-browser:file:result"
   "blee:xinf:name:web-browser:file:mail"
   "blee:xinf:name:pdf:at-point:default"
   "blee:xinf:name:pdf:result:default"
   )
  "List of Blee Named Frames"
  )



;;;(message (blee:named-frame:struct:-title blee:xinf:web-browser:interactive:default))


(lambda () "
** XINF :: search-engine
")

(defvar blee:search-engine:selected
  "https://google.com"
  "The primary blee search-engine.")

(lambda () "
** Native Named Frames (NNF)
")

(lambda () "
*** Native Named Frames (NNF) -- Primary 
")

(defvar
  blee:nnf:primary
  (make-blee:named-frame:struct:
   :name "blee:nnf:name:primary"
   :title "Emacs Primary Native Frame"
   :type "medium"
   :description "description of named-frame"
   )
  "Default XINF for web browsing"
  )

(lambda () "
*** Native Named Frames (NNF) -- Secondary
")

(defvar
  blee:nnf:secondary
  (make-blee:named-frame:struct:
   :name "blee:nnf:name:secondary"
   :title "Emacs Secondary Native Frame"
   :type "medium"
   :description "description of named-frame"
   )
  "Default XINF for web browsing"
  )



(lambda () "
** eXternally Integrated Named Frames (XINF)
")


(lambda () "
*** XINF :: web-browser
")

(lambda () "
**** XINF :: web-browser :: interactive
")

(lambda () "
***** XINF :: web-browser :: interactive :: default
")

(defvar
  blee:xinf:web-browser:interactive:default
  (make-blee:named-frame:struct:
   :name "blee:xinf:name:web-browser:interactive:default"
   :title "Default Emacs XINF For Interactive Web Browsing"
   :type "medium"
   :description "description of named-frame"
   )
  "Default XINF for web browsing"
  )

(lambda () "
***** XINF :: web-browser :: interactive :: selected
")

(defvar
  blee:xinf:web-browser:interactive:selected
  blee:xinf:web-browser:interactive:default
  "Name of Active XINF For Interactive Web Browsing.")


(lambda () "
**** XINF :: web-browser :: at-point
")


(lambda () "
***** XINF :: web-browser :: at-point :: default
")

(defvar
  blee:xinf:web-browser:at-point:default
  (make-blee:named-frame:struct:
   :name "blee:xinf:name:web-browser:at-point:default"
   :title "Emacs XINF For At-Point Default Web Browsing"
   :type "medium"
   :description "description of named-frame"
   )
  "Default XINF for at-point web browsing"
  )

(lambda () "
***** XINF :: web-browser :: at-point :: news
")

(defvar
  blee:xinf:web-browser:at-point:news
  (make-blee:named-frame:struct:
   :name "blee:xinf:name:web-browser:at-point:news"
   :title "Emacs XINF For At-Point News Web Browsing"
   :type "medium"
   :description "description of named-frame"
   )
  "Default XINF for at-point web browsing"
  )


(lambda () "
***** XINF :: web-browser :: at-point :: bxde
")

(defvar
  blee:xinf:web-browser:at-point:bxde
  (make-blee:named-frame:struct:
   :name "blee:xinf:name:web-browser:at-point:bxde"
   :title "Emacs XINF For At-Point News Web Browsing"
   :type "medium"
   :description "description of named-frame"
   )
  "Default XINF for at-point web browsing"
  )

(lambda () "
***** XINF :: web-browser :: at-point :: selected
")

(defvar
  blee:xinf:web-browser:at-point:selected
  blee:xinf:web-browser:at-point:default
  "Named-Frame-Info of Active XINF For At-Point Web Browsing.")


(lambda () "
**** XINF :: web-browser :: file (native html file)
")



(lambda () "
***** XINF :: web-browser :: file :: result
")

(defvar
  blee:xinf:web-browser:file:result
  (make-blee:named-frame:struct:
   :name "blee:xinf:name:web-browser:file:result"
   :title "Emacs XINF For Results-File Web Browsing"
   :type "medium"
   :description "description of named-frame"
   )
  "Default XINF for at-point web browsing"
  )



(lambda () "
***** XINF :: web-browser :: file :: mail
")

(defvar
  blee:xinf:web-browser:file:mail
  (make-blee:named-frame:struct:
   :name "blee:xinf:name:web-browser:file:mail"
   :title "Emacs XINF For Mail-File Web Browsing"
   :type "medium"
   :description "description of named-frame"
   )
  "Default XINF for at-point web browsing"
  )

(lambda () "
***** XINF :: web-browser :: file :: selected
")

(defvar
  blee:xinf:name:web-browser:file:selected
  blee:xinf:web-browser:file:result
  "Name of Active XINF For HTML-File Web Browsing.")


(lambda () "
*** XINF :: pdf
")


(lambda () "
**** XINF :: pdf :: at-point
")



(lambda () "
***** XINF :: pdf :: at-point :: default
")

(defvar
  blee:xinf:pdf:at-point:default
  (make-blee:named-frame:struct:
   :name "blee:xinf:name:pdf:at-point:default"
   :title "Emacs XINF For At-Point PDF Viewing"
   :type "medium"
   :description "description of named-frame"
   )
  "Default XINF for at-point web browsing"
  )

(lambda () "
***** XINF :: pdf :: at-point :: selected
")

(defvar
  blee:xinf:pdf:at-point:selected
  blee:xinf:pdf:at-point:default
  "Name of Blee primary frame.")



(lambda () "
**** XINF :: pdf :: result
")


(lambda () "
***** XINF :: pdf :: result :: default
")

(defvar
  blee:xinf:pdf:result:default
  (make-blee:named-frame:struct:
   :name "blee:xinf:name:pdf:result:default"
   :title "Emacs XINF For Results PDF Viewing"
   :type "medium"
   :description "description of named-frame"
   )
  "Default XINF for at-point web browsing"
  )

(lambda () "
***** XINF :: pdf :: result :: selected
")

(defvar
  blee:xinf:pdf:result:selected
  blee:xinf:pdf:result:default
  "Name of Blee primary frame.")


(lambda () "
* Activation Commands
")

(lambda () "
* Menus
")


(lambda () "
* Global Blee Menu
")

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
	 (find-file-at-point  blee:search-engine:selected)
	 :help "Current setting for browse-url-browser-function"
	 :active t
	 :visible t
	 ]
	"----"
	[
	 ,(format "Search with %s" blee:search-engine:selected)
	 (find-file-at-point blee:search-engine:selected)
	 :help "Search with selected browser setting and selected engine"
	 :active t	 
	 :visible t
	 ]
	"-----"
	[
	 "XIA Browser At-Point Open URL"
	 (call-interactively 'eaf-open-browser-with-history)
	 :help "Prompt for specification of a URL in minibufer"
	 :active t	 
	 :visible t
	 ]
	"------"
	[
	 ,(format "XIA Frame Browser At Point: %s" blee:search-engine:selected)
	 (call-interactively 'eaf-open-browser-with-history)
	 :help "Prompt for specification of a URL in minibufer"
	 :active t
	 :visible t
	 ]
	"------"
	[
	 ,(format "XIA Frame Browser File:  %s" blee:search-engine:selected)
	 (call-interactively 'eaf-open-browser-with-history)
	 :help "Prompt for specification of a URL in minibufer"
	 :active t
	 :visible t
	 ]
	"------"
	
	))

    (blee:menu:browse-url:at-point|define)
    (easy-menu-add-item nil '("XIA") 'blee:menu|browse-url "----")
    
    (blee:menu:search-engines|define)
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
	["Help: Blee Overview" blee:blee:menu:overview-help t]	 ;;; Notyet, should point to panel instead
	"---"
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]	
	))
    ))



;;
;; (blee:menu:browse-url:at-point|define)
;; 
(defun blee:menu:browse-url:at-point|define ()
  "Top Level Menu For eXternal Integrated emacs-Apps and Frames"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      blee:menu|browse-url
      nil
      "Menu For Configuration Of browse-url"
      `("Browse-URL Selections" :help "Show And Set Relevant Parameters"
	[,(format "Browse with %s" browse-url-browser-function) (find-file-at-point  blee:search-engine:selected)  t]	
	"---"	
	("Show Current Settings"	
	 ["browse-url-browser-function" (describe-variable 'browse-url-browser-function) t]
	 ["browse-url-secondary-browser-function" (describe-variable 'browse-url-secondary-browser-function) t]	 
	 )
	"---"
	("Select At Point Url Browser"
	 ["XIA Browser Frame" (setq browse-url-browser-function 'blee:xinf:selected:browse-url/at-point) t]
	 ["Firefox" (setq browse-url-browser-function 'browse-url-firefox) t]
	 ["Chrome" (setq browse-url-browser-function 'browse-url-chromium) t]
	 ["EWW" (setq browse-url-browser-function 'eww-browse-url) t]	 
	 ["Default Browser" (setq browse-url-browser-function 'browse-url-default-browser) t]	 
	 )
	"---"
	("Select Mail Html Browser -- Defunct"
	 ["XIA Browser Frame" (setq browse-url-browser-function 'blee:browse-url/dispatch) t]
	 ["Firefox" (setq browse-url-browser-function 'browse-url-firefox) t]
	 ["Chrome" (setq browse-url-browser-function 'browse-url-chromium) t]
	 ["EWW" (setq browse-url-browser-function 'eww-browse-url) t]	 	 
	 ["Default Browser" (setq browse-url-browser-function 'browse-url-default-browser) t]	 
	 )
	"---"
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]	
	))
    ))


;;; http://mohsen.1.banan.byname.net


(defun blee:menu:browse-url:file|define ()
  "Top Level Menu For eXternal Integrated emacs-Apps and Frames"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      blee:menu|browse-url
      nil
      "Menu For Configuration Of browse-url"
      `("Browse-URL Selections" :help "Show And Set Relevant Parameters"
	[,(format "Browse with %s" browse-url-browser-function) (find-file-at-point  blee:search-engine:selected)  t]	
	"---"	
	("Show Current Settings"	
	 ["browse-url-browser-function" (describe-variable 'browse-url-browser-function) t]
	 ["browse-url-secondary-browser-function" (describe-variable 'browse-url-secondary-browser-function) t]	 
	 )
	"---"
	("Select At Point Url Browser"
	 ["XIA Browser Frame" (setq browse-url-browser-function 'blee:xinf:browse-url/at-point) t]
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
	[,(format "Search with %s" blee:search-engine:selected) (find-file-at-point blee:search-engine:selected)  t]	
	"---"	
	("Show Search Engine Current Settings"	
	 ["blee:search-engine:default" (describe-variable 'blee:search-engine:selected) t]
	 )
	"---"
	("Select Search Engine"
	 ["duckduckgo" (progn (setq blee:search-engine:selected "https://duckduckgo.com") (blee:menu:top:xia|define)) t]
	 ;;["google"  (custom-set-default blee:search-engine:selected "https://google.com")  t]
	 ["google"  (progn (setq blee:search-engine:selected "https://google.com") (blee:menu:top:xia|define))  t]
	 ["bing" (progn (setq blee:search-engine:selected "https://bing.com") (blee:menu:top:xia|define)) t]	 
	 )
	"---"
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]	
	))
    ))


(lambda () "
* Keybindings
")

(lambda () "
* Commands
")

(lambda () "
* Global Functions
")

(lambda () "
* Local Functions
")


(lambda () "
** Named Frame Creation And Population
")


(defun blee:xinf|make-frame (@nf-info)
  "make-frame based on @NF-INFO (a named-frame-info structure)"
  (let (
	($name (blee:named-frame:struct:-name @nf-info))
	($title (blee:named-frame:struct:-title @nf-info))	       
	)
    (make-frame `((name                 . ,$name)
                  (icon-name            . ,$name)
                  (title                . ,$title)
                  (menu-bar-lines       . 1)
                  (tool-bar-lines       . 3)
                  (vertical-scroll-bars . t)
		  )
		)
    ))


;; (frame-visible-p (get-a-frame blee:frame:name:xinf:web-browser-at-point))

;;;
;;; (blee:xinf:selected:browse-url/at-point "http://www.neda.com")
;;; (blee:xinf:selected:browse-url/at-point "https://google.com")
;;;
    
(defun blee:xinf:selected:browse-url/at-point (@url &rest @args)
  "In the named-frame, blee:xinf:web-browser:at-point:selected, open @url."
  (interactive)
  (blee:xinf:browse-url/at-point
   blee:xinf:web-browser:at-point:selected
   @url
   )
  )

;;; (blee:xinf:browse-url/at-point blee:xinf:web-browser:at-point:selected "https://google.com")
;;; (blee:xinf:browse-url/at-point blee:xinf:web-browser:at-point:news "https://presstv.com")
;;; (blee:xinf:browse-url/at-point blee:xinf:web-browser:at-point:news "https://france24.com")
;;; (blee:xinf:browse-url/at-point blee:xinf:web-browser:at-point:news "https://aljazira.com")

;;; (blee:named-frame:struct:-name blee:xinf:web-browser:at-point:selected)

(defun blee:xinf:browse-url/at-point (@nf-info @url &rest @args)
  "In the named-frame @nf-info open @url."
  (interactive)
  (let* (
	 ($originalFrame (selected-frame))
	 ($browserFrameName (blee:named-frame:struct:-name @nf-info))
	 ($browserFrame (get-a-frame $browserFrameName))
	 )
    (when (not $browserFrame)
      (setq $browserFrame (blee:xinf|make-frame @nf-info))
      )

    ;;(save-window-excursion        
    
    (select-frame-set-input-focus $browserFrame)
    (eaf-open-browser @url t)
    (tab-bar-new-tab)
    )
  )


(lambda () "
* Provide
")

(provide 'blee-frames)

