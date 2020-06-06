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
*** Named Frames Management ( A Mini DT-Windows Manager For Named Frames) 
*** Named Frames Activities Management -- A set of collaborating Name Frames to be managed collectively
** Concepts, Terminology, Labels and Acronyms:
*** Named Frames (NF)
**** Native Named Frames (NNF)
**** eXternally Integrated Emacs Frames (XINF)
**** Emacs Linked Application Windows (ELAW)
**** Named Activity Frames (NAF) 
*** EAF: Emacs Applications Framework
*** eXternally Integrated Applications (XIA)
**** XIA-Web-Browser
**** XIA-PDF-Viewer
**
")


(lambda () "
* Requires
")

(require 'easymenu)
(require 'blee-doc-howto)   ;;; NOTYET -- un-needed -- remove after cleanup after 


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
  shortTitle
  type
  description
  )

(cl-defstruct  blee:nf-activity:struct:
  "Named Frames Activity Structure"
  (name nil :read-only t)   ;; activity name
  title                      
  shortTitle
  nfList                   ;; List of NFs for this activity
  description
  )



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
   :shortTitle "Primary Native Frame"   
   :type "medium"
   :description "description of named-frame"
   )
  "Primary Native Named Frame."
  )

(lambda () "
*** Native Named Frames (NNF) -- Secondary
")

(defvar
  blee:nnf:secondary
  (make-blee:named-frame:struct:
   :name "blee:nnf:name:secondary"
   :title "Emacs Secondary Native Frame"
   :shortTitle "Secondary Native Frame"   
   :type "medium"
   :description "description of named-frame"
   )
  "Secondary Native Named Frame."
  )



(lambda () "
*** Native Named Frames (NNF) -- Gnus
")

(defvar
  blee:nnf:gnus
  (make-blee:named-frame:struct:
   :name "blee:nnf:name:gnus"
   :title "Emacs Gnus Native Frame"
   :shortTitle "Gnus Native Frame"   
   :type "medium"
   :description "description of named-frame"
   )
  "Gnus Native Named Frame."
  )


(lambda () "
*** Native Named Frames (NNF) -- Secondary
")

(defvar
  blee:nnf:secondary
  (make-blee:named-frame:struct:
   :name "blee:nnf:name:secondary"
   :title "Emacs Secondary Native Frame"
   :shortTitle "Secondary Native Frame"   
   :type "medium"
   :description "description of named-frame"
   )
  "Secondary Native Named Frame."
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
   :shortTitle "Default Interactive Web Browsing XINF"   
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
   :shortTitle "Default At-Point Browsing XINF"   
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
   :shortTitle "News At-Point Browsing XINF"      
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
   :title "Emacs XINF For At-Point BXDE Web Browsing"
   :shortTitle "BXDE At-Point Browsing XINF"         
   :type "medium"
   :description "description of named-frame"
   )
  "BXDE XINF for at-point web browsing"
  )

(lambda () "
***** XINF :: web-browser :: at-point :: selected
")

(defvar
  blee:xinf:web-browser:at-point:selected
  blee:xinf:web-browser:at-point:default
  "Named-Frame-Info of Selected XINF For At-Point Web Browsing.")


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
   :shortTitle "Results-File Web Browsing XINF"   
   :type "medium"
   :description "description of named-frame"
   )
  "XINF for HTML-File result web browsing"
  )



(lambda () "
***** XINF :: web-browser :: file :: mail
")

(defvar
  blee:xinf:web-browser:file:mail
  (make-blee:named-frame:struct:
   :name "blee:xinf:name:web-browser:file:mail"
   :title "Emacs XINF For Mail-File Web Browsing"
   :shortTitle "Mail-File Web Browsing XINF"   
   :type "medium"
   :description "description of named-frame"
   )
  "XINF for HTML-file mail web browsing"
  )

(lambda () "
***** XINF :: web-browser :: file :: selected
")

(defvar
  blee:xinf:name:web-browser:file:selected
  blee:xinf:web-browser:file:result
  "Name of Selected XINF For HTML-File Web Browsing.")


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
   :shortTitle "At-Point PDF Viewing XINF"   
   :type "medium"
   :description "description of named-frame"
   )
  "XINF for at-point Pdf viewing."
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
   :shortTitle "Results PDF Viewing XINF"   
   :type "medium"
   :description "description of named-frame"
   )
  "Default XINF for result pdf viewing."
  )

(lambda () "
***** XINF :: pdf :: result :: selected
")

(defvar
  blee:xinf:pdf:result:selected
  blee:xinf:pdf:result:default
  "Selected XINF for result pdf viewing.")


(lambda () "
** NF :: List Of Named Frames
")

(defvar
  blee:named-frame:list
  (list
   blee:nnf:primary
   blee:nnf:secondary
   blee:nnf:gnus
   blee:xinf:web-browser:interactive:default
   blee:xinf:web-browser:at-point:default
   blee:xinf:web-browser:at-point:news
   blee:xinf:web-browser:at-point:bxde
   blee:xinf:web-browser:file:result
   blee:xinf:web-browser:file:mail
   blee:xinf:pdf:at-point:default
   blee:xinf:pdf:result:default
   )
  "List of Blee Named Frames"
  )


(lambda () "
*** XINF :: activity :: gnus
")

(defvar
  blee:nf:activity:gnus
  (make-blee:nf-activity:struct:
   :name "blee:nf:activity:gnus"
   :title "Named Frame GNUS Activity"
   :shortTitle "NF GNUS Activity"   
   :nfList (list
	    blee:nnf:gnus
	    blee:xinf:web-browser:file:mail
	    )
   :description "description of named-frame"
   )
  "Default XINF for result pdf viewing."
  )


(lambda () "
** NF :: List Of Named Activity Frames
")

(defvar
  blee:nfActivity:list
  (list
   blee:nf:activity:gnus
   )
  "List of Blee Named Activity Frames"
  )



(lambda () "
* Activation And Selection Commands
")


;;;   (setq browse-url-browser-function 'blee:xinf:selected:browse-url/at-point)


(lambda () "
* Menus
")

(lambda () "
** Global Blee Menu
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
	;;["XIA Blee Panel" bx:bnsm:top:panel-blee t]
	"---"
	[
	 ,(format "Browse At-Point With:\n  %s" browse-url-browser-function)
	 (find-file-at-point (ffap-url-at-point))
	 :help "Browse at-point with current value of browse-url-browser-function"
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
	 "Open URL With XIA Browser In Selected XINF"
	 (call-interactively 'eaf-open-browser-with-history)
	 :help "Prompt for specification of a URL in minibufer"
	 :active t	 
	 :visible t
	 ]
	"------"
	[
	 ,(format "Raise Selected XINF Browser At-Point Frame:\n  \"%s\""
		  (blee:named-frame:struct:-shortTitle blee:xinf:web-browser:at-point:selected))
	 (raise-frame (get-a-frame (blee:named-frame:struct:-name blee:xinf:web-browser:at-point:selected)))
	 :help "Raise XINF At Value Of blee:xinf:web-browser:at-point:selected"
	 :active t
	 :visible t
	 ]
	"-------" ;; (blee:menu:xinf:browse-url:at-point|define)
	))

    (blee:menu:browse-url:at-point|define)
    (easy-menu-add-item nil '("XIA") 'blee:menu|browse-url "----")
    
    (blee:menu:search-engines|define)
    (easy-menu-add-item nil '("XIA") 'blee:menu|search-engines "-----")    

    (blee:menu:destinations|define)
    (easy-menu-add-item nil '("XIA") 'blee:menu|destinations "------")

    (blee:menu:xinf:browse-url:at-point|define)
    (easy-menu-add-item nil '("XIA") 'blee:menu:xinf|browse-url "-------")

    (blee:nf:manage/menuSelectDef blee:named-frame:list)
    (easy-menu-add-item nil '("XIA") 'blee:nf:manage:menuSelect)

    (blee:nfActivity:manage/menuSelectDef blee:nfActivity:list)
    (easy-menu-add-item nil '("XIA") 'blee:nfActivity:manage:menuSelect)
    
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

    (defun $set-selected (@selected)
      (setq browse-url-browser-function @selected)
      (blee:menu:top:xia|define)
      )
    
    (easy-menu-define
      blee:menu|browse-url
      nil
      "Menu For Configuration Of browse-url-browser-function"
      `("Browse-URL Selections"
	:help "Show And Set Relevant Parameters"
	,(format "**browse-url-browser-function = %s**" browse-url-browser-function)
	,(format "**browse-url-secondary-browser-function = %s**" browse-url-secondary-browser-function)	
	"---"	
	("Show Current browser-function Settings"	
	 [
	  "browse-url-browser-function"
	  (describe-variable 'browse-url-browser-function)
	  :help "Describe current value of browse-url-browser-function"
	  :active t
	  :visible t
	  ]
	 ["browse-url-secondary-browser-function"
	  (describe-variable 'browse-url-secondary-browser-function)
	  :help "Describe current value of browse-url-secondary-browser-function"
	  :active t
	  :visible t
	  ]	 
	 )
	"---"
	("Select At Point Url Browser"
	 [
	  "XIA Browser Frame"
	  ($set-selected 'blee:xinf:selected:browse-url/at-point)
	  :help "blee:xinf:selected:browse-url/at-point is based on NOTYET"
	  :active t
	  :visible t
	  ]
	 [
	  "Firefox"
	  ($set-selected 'browse-url-firefox)
	  :help "Send Url to Firefox tab with: browse-url-firefox"
	  :active t
	  :visible t
	  ]
	 [
	  "Chrome"
	  ($set-selected 'browse-url-chromium)
	  :help "Send Url to Chrom new tab with: browse-url-chromium"
	  :active t
	  :visible t
	  ]
	 [
	  "EWW"
	  ($set-selected 'eww-browse-url)
	  :help "Send Url to eww with eww-browse-url"
	  :active t
	  :visible t
	  ]	 
	 [
	  "Default Browser"
	  ($set-selected 'browse-url-default-browser)
	  :help "Send Url to default browser with browse-url-default-browser"
	  :active t
	  :visible t
	  ]	 
	 )
	"---"
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]	
	))
    ))


;;
;; 
(defun blee:menu:xinf:browse-url:at-point|define ()
  "Define menu for setting and viewing of blee:xinf:web-browser:at-point:selected"
  (let (
	($thisFuncName (compile-time-function-name))
	)

    (defun $set-selected (@selected)
      (setq blee:xinf:web-browser:at-point:selected @selected)
      (blee:menu:top:xia|define)
      )
    
    (easy-menu-define
      blee:menu:xinf|browse-url
      nil
      "Menu for setting and viewing of blee:xinf:web-browser:at-point:selected"
      `("XINF Browse-URL-At-Point Selections"
	:help "Show And Set Relevant Parameters"
	,(format
	  "**blee:xinf:web-browser:at-point:selected = %s**"
	  (blee:named-frame:struct:-name blee:xinf:web-browser:at-point:selected))
	,(format
	  "**blee:xinf:name:web-browser:file:selected = %s**"
	  (blee:named-frame:struct:-name blee:xinf:name:web-browser:file:selected))
	,(format
	  "**blee:xinf:pdf:at-point:selected = %s**"
	  (blee:named-frame:struct:-name blee:xinf:pdf:at-point:selected))
	,(format
	  "**blee:xinf:pdf:result:selected = %s**"
	  (blee:named-frame:struct:-name blee:xinf:pdf:result:selected))
	"---"	
	("Show Current blee:xinf:web-browser:at-point:selected Settings"	
	 [
	  "blee:xinf:web-browser:at-point:selected"
	  (describe-variable 'blee:xinf:web-browser:at-point:selected)
	  :help "Describe current value of blee:xinf:web-browser:at-point:selected"
	  :active t
	  :visible t
	  ]
	 )
	"---"
	("Select At-Point Url Browser Frame"
	 [
	  "Default"
	  ($set-selected blee:xinf:web-browser:at-point:default)
	  :help "Common default destination for at-point urls"
	  :active t
	  :visible t
	  ]
	 [
	  "News"
	  ($set-selected blee:xinf:web-browser:at-point:news)
	  :help "News at-point url XINF destination"
	  :active t
	  :visible t
	  ]
	 [
	  "BXDE"
	  ($set-selected blee:xinf:web-browser:at-point:bxde)
	  :help "BXDE at-point url XINF destination"
	  :active t
	  :visible t
	  ]
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
    
    (defun $selected-set (@searchEngineUrl)
      (setq blee:search-engine:selected @searchEngineUrl)
      (blee:menu:top:xia|define)
      )

    (easy-menu-define
      blee:menu|search-engines
      nil
      "Menu Search Engine Selections"
      `("Search Engine Selections"
	:help "Show And Set Selection Of Search Engine by blee:search-engine:selected"
	"---"
	,(format "**blee:search-engine:selected = %s**" blee:search-engine:selected)
	"---"	
	("Show Search Engine Current Settings"	
	 [
	  "blee:search-engine:selected"
	  (describe-variable 'blee:search-engine:selected)
	  :help "Describe current value of blee:search-engine:selected"
	  :active t
	  :visible t
	  ]
	 )
	"---"
	("Select Search Engine"
	 [
	  "duckduckgo"
	  ($selected-set "https://duckduckgo.com")
	  :help "Set blee:search-engine:selected to https://duckduckgo.com"
	  :active t
	  :visible t
	  ]
	 [
	  "google"
	  ($selected-set "https://google.com")
	  :help "Set blee:search-engine:selected to https://google.com"
	  :active t
	  :visible t
	  ]
	 [
	  "bing"
	  ($selected-set "https://bing.com")
	  :help "Set blee:search-engine:selected to https://bing.com "
	  :active t
	  :visible t
	  ]	 
	 )
	"---"
	[,(format "Visit %s" $thisFuncName) (describe-function (intern ,$thisFuncName)) t]	
	))
    ))


(lambda () "
**  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:virsh:domain:menuSelectDef kvmHost) [[elisp:(org-cycle)][| ]]
  ")

;;
;; (blee:nf:manage/menuSelectDef blee:named-frame:list)
;; 

(defun blee:nf:manage/menuSelectDefObsolete (<nfList)
  ""
  (interactive)
  (let (
	($menuHeading "Named Frames Management")
	)  
    (easy-menu-define
      blee:nf:manage:menuSelect
      nil
      "" 
      (append
       (list $menuHeading)
       (list "---")
       (mapcar (lambda (<each)
		 (vector (format "Raise NF: %s" (blee:named-frame:struct:-shortTitle <each))
			 `(lambda ()
			    (interactive)  ;; Must be a command -- not just a function
			    (raise-frame
			     (get-a-frame (blee:named-frame:struct:-name ,<each)))
			    )
			 )
		 )
	       <nfList
	       )))))


(defun blee:nf:manage/menuSelectDef (<nfList)
  ""
  (interactive)
  (let (
	($menuHeading "Named Frames Management")
	)  
    (easy-menu-define
      blee:nf:manage:menuSelect
      nil
      "" 
      (append
       (list $menuHeading)
       (list "---")
       (mapcar (lambda (<each)
		 (vector (format "Raise NF: %s" (blee:named-frame:struct:-shortTitle <each))
			 `(blee:$raiseNF ,<each)
			 )
		 )
	       <nfList
	       )))))



(defun blee:$raiseNF (<nf)
  (interactive)  ;; Must be a command -- not just a function
  (raise-frame
   (get-a-frame (blee:named-frame:struct:-name <nf))))


(lambda () "
**  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:virsh:domain:menuSelectDef kvmHost) [[elisp:(org-cycle)][| ]]
  ")

;;
;; (blee:nfActivity:manage/menuSelectDef blee:nfActivity:list)
;; 

(defun blee:nfActivity:manage/menuSelectDef (<nfActivityList)
  ""
  (interactive)
  (let (
	($menuHeading "Named Activity Frames Management")
	)  
    (easy-menu-define
      blee:nfActivity:manage:menuSelect
      nil
      "" 
      (append
       (list $menuHeading)
       (list "---")
       (mapcar (lambda (<each)
		 (vector (format "Raise NF Activities: %s" (blee:nf-activity:struct:-shortTitle <each))
			 `(lambda ()
			    (interactive)  ;; Must be a command -- not just a function
			    (message (blee:nf-activity:struct:-shortTitle ,<each))
			    )
			 )
		 )
	       <nfActivityList
	       )))))


(lambda () "
**  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:virsh:domain:selectPopupMenu kvmHost) [[elisp:(org-cycle)][| ]]
  ")

;;
;; (blee:virsh:domain:selectPopupMenu blee:named-frame:list)
;;
(defun blee:nf:manage:selectPopupMenu  (@nfList)
  ""
  (blee:nf:manage/menuSelectDef @nfList)  
  (popup-menu blee:nf:manage:menuSelect)
  (blee:menu-box:parallelBranches)  
  )



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


(defun blee:xinf:default:browse-url/at-point (@url &rest @args)
  "In the named-frame, blee:xinf:web-browser:at-point:selected, open @url."
  (interactive)
  (blee:xinf:browse-url/at-point
   blee:xinf:web-browser:at-point:default
   @url
   )
  )


(defun blee:xinf:news:browse-url/at-point (@url &rest @args)
  "In the named-frame, blee:xinf:web-browser:at-point:selected, open @url."
  (interactive)
  (blee:xinf:browse-url/at-point
   blee:xinf:web-browser:at-point:news
   @url
   )
  )

(defun blee:xinf:bxde:browse-url/at-point (@url &rest @args)
  "In the named-frame, blee:xinf:web-browser:at-point:selected, open @url."
  (interactive)
  (blee:xinf:browse-url/at-point
   blee:xinf:web-browser:at-point:bxde
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
    (tab-bar-new-tab)    
    (eaf-open-browser @url t)
    (tab-bar-rename-tab (url-host (url-generic-parse-url @url)))
    )
  )


(lambda () "
* Local Functions
")


(lambda () "
* Provide
")

(provide 'blee-frames)

