;;;
;;;

(require 'easymenu)

(require 'blee-doc-howto)

;;;
;;; Global Blee Menu
;;;


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
	[,(format "Browse with %s" browse-url-browser-function) (find-file-at-point  blee:search-engine:primary)  t]
	"----"
	[,(format "Search with %s" blee:search-engine:primary) (find-file-at-point blee:search-engine:primary)  t]
	"-----"
	))

    (blee:menu:browse-url|define)
    (easy-menu-add-item nil '("XIA") 'blee:menu|browse-url "----")
    
    (blee:menu:search-engines|define)
    ;;(easy-menu-add-item nil '("XIA") 'blee:menu|search-engines "XIA Help")
    (easy-menu-add-item nil '("XIA") 'blee:menu|search-engines "-----")    

    (blee:menu:destinations|define)
    (easy-menu-add-item nil '("XIA") 'blee:menu|destinations)

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
      `("XIA Help"
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
	 ["XIA Browser Frame" (setq browse-url-browser-function 'blee:browse-url/dispatch) t]
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

