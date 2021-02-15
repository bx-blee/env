;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-


(lambda () "
* Description And Design
** 
** This Information should be moved to a BleePanel and blee manual etc.
** 
** In Blee, Availability of a number of Named emacs frames is assumed.
** 
** Concepts, Terminology, Labels and Acronyms:
*** ~NF~ : Named Frames (union of Native Named Frames and XINF)
*** ~NNF~ : Native Named Frames (native emacs frames)
*** ~EAF~ : Emacs Application Framework -- https://github.com/manateelazycat/emacs-application-framework
Emacs Application Framework (EAF) is a GUI application framework that
revolutionizes Emacs graphical capabilities to ultimately Live in
Emacs.
*** ~XIA~ : eXternally Integrated Applications (XIA) -- A better name for EAF -- and associated 
with named frames.
**** ~NAFM-Web-Browser~
**** ~NAFM-PDF-Viewer~
*** ~XINF~ : eXternally Integrated Named/emacs Frames
XINFs contain eXternally Integrated Applications (XIA) such as an EAF-browser.
*** ~ELAW~ : Emacs Linked Application Windows -- external (non-integrated) application such as firefox/chrome.
*** ~NAF~ : Named Activity Frames -- A set of Named Frames related to a given Activity.
*** ~NAFM~ : Named Activities Frames Manager -- A set of collaborating Named Frames to be managed collectively.
** 
")


(require 'easymenu)

;; (nafm:menu-bar/install)
(defun nafm:menu-bar/install ()
  "Primary interface."
  
  (interactive)
  (nafm:menu:global|define)
  (add-hook 'menu-bar-update-hook 'nafm:menu-bar-update-hook)
  )


(defun nafm:menu-bar-update-hook ()
  "This is to be added to menu-bar-update-hook. 
It runs everytime any menu is invoked.
As such what happens below is exactly what is necessary and no more."
  
  (easy-menu-add-item
   nil '("NAFM") (nafm:menuItem:param:nafm-directory|define) "---")
    
  (easy-menu-add-item
   nil '("NAFM") (nafm:menuItem:param:nafm-db-location|define) "---")
  )


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


;; (nafm:menu:global|define)
(defun nafm:menu:global|define ()
  "Top level menu for all things xia related."
  (let (($thisFuncName (compile-time-function-name)))
    (easy-menu-define
      nafm:menu:global
      global-map
      "Global xia menu"
      `("NAFM"
	:help "Xia And NAFM-Server Primary Actions"
	"---"
	"----"
	"-----"
	"------"
	"-------"		
	))
    
    (easy-menu-add-item
     nil '("NAFM") (nafm:menuItem:param:nafm-directory|define) "---")

    (easy-menu-add-item
     nil '("NAFM") (nafm:menuItem:param:nafm-db-location|define) "---")

    ;; 4 dashed
    ;;
    (easy-menu-add-item
     nil '("NAFM") (nafm:menuItem:db-update|define) "----")

    (easy-menu-add-item
     nil '("NAFM") (nafm:menuItem:buffer-toggle|define) "----")

    (easy-menu-add-item
     nil '("NAFM") (nafm:menuItem:buffer-display|define) "----")

    (easy-menu-add-item
     nil '("NAFM") (nafm:menuItem:buffer-hide|define) "----")

    ;; 5 dashed
    ;;
    (easy-menu-add-item
     nil '("NAFM") (nafm:menuItem:find-file|define) "-----")

    (easy-menu-add-item
     nil '("NAFM") (nafm:menuItem:graph|define) "-----")

    (easy-menu-add-item
     nil '("NAFM") (nafm:menuItem:insert|define) "-----")

    (easy-menu-add-item
     nil '("NAFM") (nafm:menuItem:insert-immediate|define) "-----")

    ;; 6 dashed
    ;;
    (if (package-installed-p 'nafm-server)
	(easy-menu-add-item
	 nil '("NAFM") (nafm-server:menu|define) "------")
      (easy-menu-add-item
       nil '("NAFM") (nafm-server:menu:stub|define :active nil) "------")
      )
    
    ;; NOTYET nafm-bibtex:menu|define has not been implemented yet
    ;;(if (package-installed-p 'nafm-bibtex)  
    (if nil
	(easy-menu-add-item
	 nil '("NAFM") (nafm-bibtex:menu|define) "------")
      (easy-menu-add-item
       nil '("NAFM") (nafm-bibtex:menu:stub|define :active nil) "------")
      )
    
    (easy-menu-add-item
     nil '("NAFM") (nafm:menu:help|define) "-------")    
    )
  )

;; (nafm:menuItem:param:nafm-directory|define)
(defun nafm:menuItem:param:nafm-directory|define ()
  "Returns a menuItem vector for a param (perhap dynamically)"
  (setq $:nafm:menuItem:params:nafm-directory
	(format "nafm-directory=\n  %s"
		(bcf:var/localized 'nafm-directory)))
  [
   $:nafm:menuItem:params:nafm-directory
   (describe-variable 'nafm-directory)      
   t
   ]
  )

;; (nafm:menuItem:param:nafm-db-location|define)
(defun nafm:menuItem:param:nafm-db-location|define ()
  "Returns a menuItem vector for a param (perhap dynamically)"
  (setq $:nafm:menuItem:params:nafm-db-location
	(format "nafm-db-location=\n  %s"
		(bcf:var/localized 'nafm-db-location)))
  [
   $:nafm:menuItem:params:nafm-db-location
   (describe-variable 'nafm-db-location)      
   t
   ]
  )

;; (find-function 'nafm:menuItem:db-update|define)
;; (nafm:menuItem:db-update|define)
(defun nafm:menuItem:db-update|define ()
  [
   "Re-Build The Data Base"
   (nafm-db-update)
   :help "Refresh the database"
   :active t	 
   :visible t
   ]
  )

(defun nafm:menuItem:buffer-toggle|define ()
  [
   "Toggle Display Of xia buffer"
   (xia)
   :help "Toggle"
   :active t	 
   :visible t
   ]
  )

(defun nafm:menuItem:buffer-display|define ()
  [
   "Activate xia buffer"
   (nafm-buffer-activate)
   :help "Activate xia buffer -- (nafm-buffer-activate)"
   :active t	 
   :visible t
   ]
  )

(defun nafm:menuItem:buffer-hide|define ()
  [
   "Deactivate xia buffer"
   (nafm-buffer-deactivate)
   :help "Deactivate xia buffer (nafm-buffer-deactivate)"
   :active t	 
   :visible t
   ]
  )

(defun nafm:menuItem:find-file|define ()
  [
   "Find and open an xia file"
   (nafm-find-file)
   :help "Find and open an xia file (nafm-find-file)"
   :active t	 
   :visible t
   ]
  )

(defun nafm:menuItem:graph|define ()
  [
   "Display a graph for current"
   (nafm-graph)
   :help "Display a graph for current (nafm-graph)"
   :active t	 
   :visible t
   ]
  )

(defun nafm:menuItem:insert|define ()
  [
   "With xia file, insert a relative org link at point"
   (nafm-insert)
   :help "With xia file, insert a relative org link at point (nafm-insert)"
   :active t	 
   :visible t
   ]
  )

(defun nafm:menuItem:insert-immediate|define ()
  [
   "With xia file, insert a relative org link at point with capture-immediate-template"
   (nafm-insert-immediate)
   :help "With xia file, insert a relative org link at point with capture-immediate-template (nafm-insert-immediate)"
   :active t	 
   :visible t
   ]
  )


;; (nafm:menu:help|define)
(defun nafm:menu:help|define ()  
  "Generic Blee Help Menu"
  (let (
	($thisFuncName (compile-time-function-name))
	)
    (easy-menu-define
      nafm:menu:help
      nil
      "Help Menu For xia"
      `("xia Help"
	:help "Help For This Menu"
	["Visit xia Help Panel"
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
    'nafm:menu:help
    ))

;;
;; (nafm-server:menu:stub|define)
;; (nafm-server:menu:stub|define :active nil)
;; 
(defun nafm-server:menu:stub|define (&rest <namedArgs)
  "nafm-server menu."
  (let (
	(<active (get-arg <namedArgs :active t))
	(<visible (get-arg <namedArgs :visible t))
	($thisFuncName (compile-time-function-name))
	)

    (setq $:nafm-server:menu:active <active)
    (setq $:nafm-server:menu:visible <visible)    
    
    (easy-menu-define
      nafm-server:menu
      nil
      "nafm-server menu"
      `("xia Server"
	:help "Show And Set Relevant Parameters"
	:active $:nafm-server:menu:active
	:visible $:nafm-server:menu:visible
	"---"
	))
    'nafm-server:menu
    ))

;;
;; (nafm-bibtex:menu:stub|define)
;; (nafm-bibtex:menu:stub|define :active nil)
;; 
(defun nafm-bibtex:menu:stub|define (&rest <namedArgs)
  "nafm-bibtex menu."
  (let (
	(<active (get-arg <namedArgs :active t))
	(<visible (get-arg <namedArgs :visible t))
	($thisFuncName (compile-time-function-name))
	)

    (setq $:nafm-bibtex:menu:active <active)
    (setq $:nafm-bibtex:menu:visible <visible)    
    
    (easy-menu-define
      nafm-bibtex:menu
      nil
      "nafm-bibtex menu"
      `("xia Bibtex"
	:help "Show And Set Relevant Parameters"
	:active $:nafm-bibtex:menu:active
	:visible $:nafm-bibtex:menu:visible
	"---"
	))
    'nafm-bibtex:menu
    ))


(provide 'nafm-menu)

