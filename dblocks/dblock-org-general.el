

(require 'bx-lcnt-lib)
(require 'dblock-governor)


(defun blee:panel:divider (@outLevel)
  "Outline level is included."
  (format
   "%s   [[elisp:(beginning-of-buffer)][|^]] #################### [[elisp:(delete-other-windows)][|1]] "
   "*"
   ))

(defun blee:panel:frontControl (@outLevel)
  "Outline level is included."
  (format
   "%s  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] "
   "*"
   ))

(defun org-dblock-write:blee:bxPanel:title  (@params)
  "Title of the Panel. 
"
  (let (
	(@toggle (or (plist-get @params :toggle) nil))       ;; For backwards compatibility -- replaced by governor
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "default")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@panelType (or (plist-get @params :panelType) "bxPanel"))
	(@title (or (plist-get @params :title) "title"))	
	
	;;
	($localVarPlaceHolder)
	)

    (when @toggle (setq @governor @toggle))   ;; for backwards compatibility
    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelType \"bxPanel\" :title \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
	"%s                /* %s: %s */\n"
	(blee:panel:divider @outLevel)
	@panelType
	@title
	))
      )
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))


(defun org-dblock-write:blee:bxPanel:relatedPanels  (@params)
  "Lists related panels in two parts. 1) based on :panelsList -- 2) based on :inFile
"
  (let (
	(@toggle (or (plist-get @params :toggle) nil))       ;; For backwards compatibility -- replaced by governor
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "default")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@panelsList (or (plist-get @params :panelsList) "bxPanel"))
	(@inFile (or (plist-get @params :inFile) "panelSisters.org"))	
	;;
	($fileAsString)
	)

    (when @toggle (setq @governor @toggle))   ;; for backwards compatibility
    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
	"%s  Related Panels ::   [[elisp:(find-file \"/libre/ByStar/InitialTemplates/activeDocs/listOfDocs/fullUsagePanel-en.org\")][BxDE Top Panel]]\n"
	(blee:panel:frontControl @outLevel)
	@panelsList
	))
      (setq $fileAsString (get-string-from-file (format "%s" @inFile)))
      (insert $fileAsString)
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))


(defun org-dblock-write:blee:bxPanel:maintenance  (@params)
  "
"
  (let (
	(@toggle (or (plist-get @params :toggle) nil))       ;; For backwards compatibility -- replaced by governor
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "closeContinue")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@taskControls (or (plist-get @params :taskControls) "default"))
	;;
	($fileAsString)
	)

    (when @toggle (setq @governor @toggle))   ;; for backwards compatibility
    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":taskControls \"default\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format 	"\
%s \
/Task Controls/ ::  [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda List This]] || [[elisp:(bx:org:todo:this-file-otherWin)][ToDo List This]] ||  [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda List This]] || [[elisp:(bx:org:todo:this-file-otherWin)][ToDo List This]] |
"
	"*"
	))
      (insert
       (format 	"\
%s \
   [[elisp:(org-cycle)][| *= Maintenance: =* | ]]  <<tasks>>  "
	(blee:panel:frontControl @outLevel)
	))
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))

(defun org-dblock-write:blee:bxPanel:thisFile  (@params)
  "This File. Used to be
"
  (let (
	(@toggle (or (plist-get @params :toggle) nil))       ;; For backwards compatibility -- replaced by governor
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "openCloseBlank")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@origin (or (plist-get @params :origin) ""))
	;;
	($out-string)
	)

    (when @toggle (setq @governor @toggle))   ;; for backwards compatibility
    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (setq $out-string (concat "*  This File :: *= " buffer-file-name " =*"))
      (if (not (string-equal "" @origin))
	  (setq $out-string (concat $out-string "\n** Origin    :: /libre/ByStar/InitialTemplates/activeDocs/common/activitiesPanels/" $origin))
	)
      (insert $out-string)
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))

(defun org-dblock-write:blee:bxPanel:topPanelControls  (@params)
  "Top Controls.
"
  (let (
	(@toggle (or (plist-get @params :toggle) nil))       ;; For backwards compatibility -- replaced by governor
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "default")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	)

    (when @toggle (setq @governor @toggle))   ;; for backwards compatibility
    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
	"%s \
*  [[elisp:(org-cycle)][|#Controls:|]]  [[elisp:(blee:bnsm:menu-back)][Back]] [[elisp:(toggle-read-only)][read/wr]] | [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]]  [[elisp:(bury-buffer)][Bury]]  [[elisp:(org-cycle)][| ]]
"
	"*"
	))
      (insert
       (format
	"%s \
 [[elisp:(blee:buf:re-major-mode)][Re-Major-Mode]] ||  [[elisp:(org-dblock-update-buffer-bx)][Update Buf Dblocks]] || [[elisp:(org-dblock-bx-blank-buffer)][Blank Buf Dblocks]] || [[elisp:(bx:panel:variablesShow)][bx:panel:variablesShow]]  E|
"
	"**"
	))
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))




(defun org-dblock-write:blee:bxPanel:footerPanelControls  (@params)
  " Example for pure Blee org-mode dblocks.
"
  (let (
	(@toggle (or (plist-get @params :toggle) nil))       ;; For backwards compatibility -- replaced by governor
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "default")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@panelsList (or (plist-get @params :panelType) "bxPanel"))
	(@inFile (or (plist-get @params :inFile) "panelSisters.org"))	
	;;
	($fileAsString)
	)

    (when @toggle (setq @governor @toggle))   ;; for backwards compatibility
    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
	"%s \
/Footer Controls/ ::  [[elisp:(blee:bnsm:menu-back)][Back]]  [[elisp:(toggle-read-only)][toggle-read-only]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Cycle Glob Vis]]  [[elisp:(delete-other-windows)][1 Win]]  [[elisp:(save-buffer)][Save]]   [[elisp:(kill-buffer)][Quit]] 
"
	"*"
	))
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))


(defun org-dblock-write:blee:bxPanel:footerOrgParams (@params)
  " Example for pure Blee org-mode dblocks.
"
  (let (
	(@toggle (or (plist-get @params :toggle) nil))       ;; For backwards compatibility -- replaced by governor
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "default")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@panelsList (or (plist-get @params :panelType) "bxPanel"))
	(@inFile (or (plist-get @params :inFile) "panelSisters.org"))	
	;;
	($fileAsString)
	)

    (when @toggle (setq @governor @toggle))   ;; for backwards compatibility
    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
	"%s    [[elisp:(org-cycle)][| *= Org-Mode Local Params: =* | ]]\n"
	(blee:panel:frontControl @outLevel)
	))
      
      (insert
       (format "\
#+STARTUP: lognotestate
#+SEQ_TODO: TODO WAITING DELEGATED | DONE DEFERRED CANCELLED
#+TAGS: @desk(d) @home(h) @work(w) @withInternet(i) @road(r) call(c) errand(e)
"
	))
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))



(defun org-dblock-write:blee:bxPanel:footerEmacsParams (@params)
  " Example for pure Blee org-mode dblocks.
"
  (let (
	(@toggle (or (plist-get @params :toggle) nil))       ;; For backwards compatibility -- replaced by governor
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "default")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@panelsList (or (plist-get @params :panelType) "bxPanel"))
	(@inFile (or (plist-get @params :inFile) "panelSisters.org"))	
	;;
	($fileAsString)
	)

    (when @toggle (setq @governor @toggle))   ;; for backwards compatibility
    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
	"%s    [[elisp:(org-cycle)][| *= Emacs Local Params: =* | ]]\n"
	(blee:panel:frontControl @outLevel)
	))
      
      (insert
       (format "\
;; Local Variables:
;; eval: (make-local-variable '~selectedSubject)
;; eval: (setq ~selectedSubject \"noSubject\")
;; eval: (bx:load-file:ifOneExists \"./panelActions.el\")
;; End:
"
	))
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))


(defun org-dblock-write:bx:dblock:org:parameters (params)
  "Old Style. Kept for backwards comptibilitty"
  (let ((bx:types (or (plist-get params :types) ""))
	)
    (when (equal bx:types "agenda")
      ;;;(insert "#+STARTUP: showall
      (insert "#+STARTUP: lognotestate
#+SEQ_TODO: TODO WAITING DELEGATED | DONE DEFERRED CANCELLED
#+TAGS: @desk(d) @home(h) @work(w) @withInternet(i) @road(r) call(c) errand(e)"
	      )
      )
    (when (equal bx:types "menu")
      (insert "#+STARTUP: showall")
      )
   ;;(insert (format "Unknon param: %s" bx:types))
   )
  )
  

;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-org-general"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-org-general)
;;;#+END:
