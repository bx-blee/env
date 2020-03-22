

(require 'bx-lcnt-lib)
(require 'dblock-governor)
(load "time-stamp")

(defun blee:panel:button:shCommand (@commandStr)
  "Returns String"
    (format "[[elisp:(lsip-local-run-command \"%s\")][%s]]"
	    @commandStr @commandStr))


(defun blee:panel:outLevelStr (@outLevel)
  "Outline level is included."
  (make-string @outLevel ?*)
  )

(defun blee:panel:dividerLineFull (@outLevel)
  "Returns a string as full line divider with outline level string included."  
  (format
   "%s  %s "
   (blee:panel:outLevelStr @outLevel)
   (make-string 110 ?-)
   ))


(defun blee:panel:divider (@outLevel)
  "Returns a string as front divider with outline level string included."
  (format
   "%s  [[elisp:(beginning-of-buffer)][|^]] ############ [[elisp:(delete-other-windows)][|1]] "
   (blee:panel:outLevelStr @outLevel)   
   ))

;;;

;;; (blee:panel:frontControl 1 :inDblock nil)
;;;

(defun blee:panel:frontControl (@outLevel &rest @args)
  "Outline level is included.
|N is not in a dblock
(> is immediately in a dblock (above line is BEGIN)
|n is in a dblock but not immediatley (above line is not BEGIN)
"

  (let (
	(@inDblock (or (plist-get @args :inDblock) nil))
	  ;;;
	($primaryNaturalControl)
	($result)
	)

    (defun $commonFrontControls ()
      "Other than the front |N or -> or |n "
      "[[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]"
      )

    (when (not @inDblock)
      (setq $primaryNaturalControl (format "%s [[elisp:(show-all)][|N]]"
					  (blee:panel:outLevelStr @outLevel)
					  )))
    (when (equal @inDblock t)
      (setq $primaryNaturalControl (format "%s [[elisp:(show-all)][(>]]"
					   (blee:panel:outLevelStr @outLevel)
					   )))

    (when (equal @inDblock "yes")
      (setq $primaryNaturalControl (format "%s [[elisp:(show-all)][|n]]"
					   (blee:panel:outLevelStr @outLevel)
					   )))


    (setq $result (format "%s %s "
			  $primaryNaturalControl
			  ($commonFrontControls)
			  ))
    $result
   ))


(defun blee:panel:delimiterFrontControl (@outLevel &rest @args)
  "Outline level is included.
|N is not in a dblock
(> is immediately in a dblock (above line is BEGIN)
|n is in a dblock but not immediatley (above line is not BEGIN)
"

  (let (
	(@inDblock (or (plist-get @args :inDblock) nil))
	  ;;;
	($primaryNaturalControl)
	($result)
	)

    (defun $commonFrontControls ()
      "Other than the front |N or -> or |n "
      "[[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]"
      )

    (when (not @inDblock)
      (setq $primaryNaturalControl (format "%s [[elisp:(show-all)][|N]]"
					  (blee:panel:outLevelStr @outLevel)
					  )))
    (when @inDblock
      (setq $primaryNaturalControl (format "%s [[elisp:(show-all)][(>]]"
					   (blee:panel:outLevelStr @outLevel)
					   )))
    (setq $result (format "%s %s "
			  $primaryNaturalControl
			  "[[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]"
			  ))
    $result
   ))

(defun blee:panel:foldingFrontControl (@outLevel &rest @args)
  "Outline level is included.
|N is not in a dblock
-> is immediately in a dblock (above line is BEGIN)
|n is in a dblock but not immediatley (above line is not BEGIN)
"

  (let (
	(@inDblock (or (plist-get @args :inDblock) nil))
	  ;;;
	($primaryNaturalControl)
	($result)
	)

    (defun $commonFrontControls ()
      "Other than the front |N or -> or |n "
      "[[elisp:(blee:menu-sel:outline:popupMenu)][+-]]"
      )

    (when (not @inDblock)
      (setq $primaryNaturalControl (format "%s [[elisp:(show-all)][|N]]"
					  (blee:panel:outLevelStr @outLevel)
					  )))
    (when @inDblock
      (setq $primaryNaturalControl (format "%s [[elisp:(show-all)][(>]]"
					   (blee:panel:outLevelStr @outLevel)
					   )))
    (setq $result (format "%s %s"
			  $primaryNaturalControl
			  ($commonFrontControls)
			  ))
    $result
   ))



(defun blee:panel:frontControlOld (@outLevel &rest @args)
  "Outline level is included."
  (let (
	(@inDblock (or (plist-get @args :inDblock) nil))
	  ;;;
	($result)
	)

    (when (not @inDblock)
      (setq $result (format "%s \
[[elisp:(show-all)][|N]] [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(blee:org:overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] "
	             (blee:panel:outLevelStr @outLevel)
	     )))
    (when @inDblock
      (setq $result (format "%s \
[[elisp:(show-all)][->]] [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(blee:org:overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] "
                     (blee:panel:outLevelStr @outLevel)
       )))
    $result
   ))



(defun blee:panel:foldingSection (@outLevel
				  @title
				  @anchor
				  @extraInfo
				  &rest @args				  
				  )
  
  "Returns a string with outline level string included.
For outlevel=1, we have chapters and sections at same level.
We then distinguish between chapter and section based on indentation and TitleStr.
"
  (let (
	(@inDblock (or (plist-get @args :inDblock) nil))
	(@rawTitle (or (plist-get @args :rawTitle) nil))
	(@sep (or (plist-get @args :sep) nil))
	;;
	($openTitleStr "==")
	($closeTitleStr "==")
	($indentationStr "")
	)
    (unless (plist-member @params :rawTitle)
      (setq @rawTitle nil))
    
    (when (equal @outLevel 1)
      (setq $openTitleStr "*")
      (setq $closeTitleStr "*")
      (setq $indentationStr "  ")
      )
    (when (equal @outLevel 2)
      (setq $openTitleStr "/")
      (setq $closeTitleStr "/")
      (setq $indentationStr "  ")      
      )
    (when (equal @outLevel 3)
      (setq $indentationStr "  ")      
      )
    (when (equal @outLevel 4)
      (setq $indentationStr "  ")      
      )

    (when @rawTitle
      (setq $openTitleStr "")
      (setq $closeTitleStr "")
      (setq $indentationStr "")      
      )

    (defun effectiveAnchor (@anchor)
      (let (
	    ($result)
	    )
	    (when (string-equal "" @anchor)
	      (setq @anchor nil))
	    (when @anchor
      	      (setq $result (format "<<%s>>"@anchor)))
	    (unless @anchor
	      (setq $result ""))
	    $result
	    )
      )
    ;;
    ;; (effectiveExtraInfo nil)
    ;; (effectiveExtraInfo "str")    
    (defun effectiveExtraInfo (@extraInfo)
      (if @extraInfo
	  (format "%s" @extraInfo)
	""
	))
    
    (when @sep
      (insert
       (format "\
%s \
/[[elisp:(beginning-of-buffer)][|^]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]] [[elisp:(delete-other-windows)][|1]]/ 
"
	       (blee:panel:outLevelStr @outLevel)
	       )))
    
    (format "\
%s \
%s   [[elisp:(org-cycle)][| %s%s:%s |]] %s %s \
"
	    (blee:panel:frontControl @outLevel :inDblock @inDblock)
	    $indentationStr
	    $openTitleStr
	    @title
	    $closeTitleStr
	    (effectiveAnchor @anchor)
	    (effectiveExtraInfo @extraInfo)
     )))


(defun blee:panel:foldingSectionOLD (@outLevel
				  @title
				  @anchor
				  &rest @args				  
				  )
  
  "Returns a string with outline level string included."
  (let (
	(@inDblock (or (plist-get @args :inDblock) nil))	
	($openTitleStr "==")
	($closeTitleStr "==")
	)
    (when (equal @outLevel 1)
      (setq $openTitleStr "*=")
      (setq $closeTitleStr "=*")
      )
    (when (equal @outLevel 2)
      (setq $openTitleStr "/=")
      (setq $closeTitleStr "=/")
      )

    (defun effectiveAnchor (@anchor)
      (if @anchor
	  (format "<<%s>> "@anchor)
	""
	))
    
    (format "\
%s \
   [[elisp:(org-cycle)][| %s %s: %s | ]] %s \
"
	    (blee:panel:frontControl @outLevel :inDblock @inDblock)
	    $openTitleStr
	    @title
	    $closeTitleStr
	    (effectiveAnchor @anchor)
     )))

(defun org-dblock-write:blee:pdf|disposition  (@params)
  "Produces a section for an lcnt based on the PLPC parameter.
After expanding, displays complete information about the document.
---
** TODO Perhaps colours should be different for folding section
   SCHEDULED: <2020-03-17 Tue>
** TODO Expand this to work on any file. Replace with org-dblock-write:blee:file|disposition
   SCHEDULED: <2020-03-01 Sun>
*** First determin file type. Then determine how we can display it.
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) (list "openBlank" "closeContinue"))) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 2)) ;; Outline Level
	;;
	(@anchor (or (plist-get @params :anchor) nil))
	(@extraInfo (or (plist-get @params :extraInfo) nil))
	(@sep (or (plist-get @params :sep) nil))    ;; seperator line
	;;
	(@title (or (plist-get @params :title) ""))
	(@file (or (plist-get @params :file) ""))
	;;
	)

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns


    (defun helpLine ()
      ":taskControls \"default\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (defun constructedExtraInfo ()
	(let (
	      ($extraInfoDelim "")
	      ($extraInfoEffective "")		
	      )
	  (when @extraInfo
	    (when (not (string-equal @extraInfo ""))
	      (setq $extraInfoEffective @extraInfo)
	      (setq $extraInfoDelim "--")))
	  (format
	   "[[elisp:(find-file-other-window \"%s\")][pdf]] || %s %s"
	   @file $extraInfoDelim $extraInfoEffective)
	  ))
	
	(insert
	 (format
	  "%s" (blee:panel:foldingSection
		@outLevel
		@title
		@anchor
		(constructedExtraInfo)
		:inDblock t
		:rawTitle t
		:sep @sep
		)
	  ))
	(insert "\n")
	(insert (blee:bxPanel|pdfViewing @file))
	(insert "\n")	
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)
    ))


(defun org-dblock-write:blee:bxPanel:mention-lcnt  (@params)
  "Produces a section for an lcnt based on the PLPC parameter.
After expanding, displays complete information about the document.
---
** TODO Add author, date, form (article/presentation)
   SCHEDULED: <2020-02-23 Sun>
** TODO Add jump to main.org and Panel.org
   SCHEDULED: <2020-02-23 Sun>
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) (list "openBlank" "closeContinue"))) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 2)) ;; Outline Level
	;;
	(@anchor (or (plist-get @params :anchor) nil))
	(@extraInfo (or (plist-get @params :extraInfo) nil))
	(@sep (or (plist-get @params :sep) nil))    ;; seperator line
	;;
	(@lcntNu (or (plist-get @params :lcnt-nu) ""))	 
	;;
	($fileAsString)
	(lcntBase)
	)

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns


    (defun helpLine ()
      ":taskControls \"default\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (set 'lcntBase
	   (shell-command-to-string 
	    (format "echo -n $( lcnLcntSelect.sh  %s 2> /dev/null | head -1 )" @lcntNu))
	   )
    
      (bx:lcnt:info:base-read-dir lcntBase)

      (let (
	    (lcnt-shortTitle (get 'bx:lcnt:info:base 'shortTitle))
	    (lcnt-mainTitle (get 'bx:lcnt:info:base 'mainTitle))
	    (lcnt-subTitle (get 'bx:lcnt:info:base 'subTitle))
	    (lcnt-subSubTitle (get 'bx:lcnt:info:base 'subSubTitle))
	    (lcnt-lcntNu (get 'bx:lcnt:info:base 'lcntNu))
	    (lcnt-version (get 'bx:lcnt:info:base 'version))
	    (lcnt-url (get 'bx:lcnt:info:base 'url))
	    )

	(defun constructedExtraInfo ()
	  (let (
		($extraInfoDelim "")
		($extraInfoEffective "")		
		)
	    (when @extraInfo
	      (when (not (string-equal @extraInfo ""))
		(setq $extraInfoEffective @extraInfo)
		(setq $extraInfoDelim "--")))
	    (format
	     "[[elisp:(dired-other-window \"%s\")][dired]] || %s %s %s"
	     lcntBase lcnt-shortTitle $extraInfoDelim $extraInfoEffective)
	    ))
	
	(insert
	 (format
	  "%s" (blee:panel:foldingSection
		@outLevel
		@lcntNu
		@anchor
		(constructedExtraInfo)
		:inDblock t
		:rawTitle t
		:sep @sep
		)
	  ))

	(insert (format "\n~%s~\n" lcnt-mainTitle))
	
	(when (not (string-equal (format "%s" lcnt-subTitle) ""))
	  (insert (format "~%s~\n" lcnt-subTitle)))

	(when (not (string-equal (format "%s" lcnt-subSubTitle) ""))
	  (insert (format "~%s~\n" lcnt-subSubTitle)))

	(insert (blee:bxPanel|pdfViewing (lcnt:base:pdf|article lcntBase)))
	
	(insert (format " %s\n" lcnt-url))
      ))

    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))


;;; (lcnt:base:pdf|article "/lcnt/lgpc/bystar/permanent/engineering/wsTesting")
(defun lcnt:base:pdf|article  (@lcntBasePath)
  "Returns a file path to lcnt pdf article form file."
  (expand-file-name
   (shell-command-to-string 
    (format "cd %s; echo -n $( ./lcntProc.sh  -p extent=name -i lcntBuild dev )" @lcntBasePath)
    )
   @lcntBasePath
   ))

(defun lcnt:base:pdf|presentation  (@lcntBasePath)
  "Returns a file path to lcnt pdf presentation form file."
  )

(defun blee:bxPanel|pdfViewing  (@pdfFilePath)
  "Returns an org-mode string for viewing of the pdf file."
  (format
   "[[elisp:(find-file-other-window \"%s\")][Pdf Other Window]] || [[elisp:(lsip-local-run-command \"acroread -openInNewInstance %s &\")][Pdf Acroread]] || "
   @pdfFilePath
   @pdfFilePath   
   ))

  
(defun org-dblock-write:blee:bxPanel:foldingSection  (@params)
  "foldingSection is often the basic ingredient of a bxPanel. 
A bxPanel is often structured similar to a LaTeX document With Parts, Chapters, Section, SubSection, etc.
Parts are rare and can be done with ;rawTitle.
Chapters are specified as :outLevel 0.
Sections are specified as :outLevel 1,n
:style should be closeContinue for folding segment.
---
** TODO Chapters specified as :outLevel 0 needs to be implemented.
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) (list "openBlank" "closeContinue"))) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 2)) ;; Outline Level
	;;
	(@title (or (plist-get @params :title) "TBD"))
	(@rawTitle (or (plist-get @params :rawTitle) nil))	
	(@anchor (or (plist-get @params :anchor) nil))
	(@extraInfo (or (plist-get @params :extraInfo) nil))
	(@sep (or (plist-get @params :sep) nil))    ;; seperator line
	;;
	($fileAsString)
	)

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":taskControls \"default\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
	"%s" (blee:panel:foldingSection @outLevel
					@title
					@anchor
					@extraInfo
					:inDblock t
					:rawTitle @rawTitle
					:sep @sep
					)
	)))

    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))

(defun blee:panel:delimiterSection (@outLevel
				  @title
				  @anchor
				  @extraInfo				  
				  &rest @args				  
				  )
  
  "Returns a string with outline level string included."
  (let (
	(@inDblock (or (plist-get @args :inDblock) nil))
	(@sep (or (plist-get @args :sep) nil))
	;;
	($openTitleStr "==")
	($closeTitleStr "==")
	)
    (when (equal @outLevel 1)
      (setq $openTitleStr "_")
      (setq $closeTitleStr "_")
      )
    (when (equal @outLevel 2)
      (setq $openTitleStr "~")
      (setq $closeTitleStr "~")
      )

    (defun effectiveAnchor (@anchor)
      (if @anchor
	  (format "<<%s>>"@anchor)
	""
	))

    ;; (effectiveExtraInfo nil)
    ;; (effectiveExtraInfo "str")    
    (defun effectiveExtraInfo (@extraInfo)
      (if @extraInfo
	  (format "%s" @extraInfo)
	""
	))

    (when @sep
      (insert
       (format "\
%s \
/[[elisp:(beginning-of-buffer)][|^]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]] [[elisp:(delete-other-windows)][|1]]/  
"
	       (blee:panel:outLevelStr @outLevel)
	       )))
    
    (format "\
%s \
  %s %s%s:%s %s \
"
	    (blee:panel:delimiterFrontControl @outLevel :inDblock @inDblock)
	    (effectiveAnchor @anchor)
	    $openTitleStr
	    @title
	    $closeTitleStr
	    (effectiveExtraInfo @extraInfo)
     )))


(defun org-dblock-write:blee:bxPanel:delimiterSection  (@params)
  "Non-Folding section delimiter usually with _title_
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) (list "openBlank" "closeContinue"))) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 2)) ;; Outline Level
	;;
	(@title (or (plist-get @params :title) "TBD"))
	(@anchor (or (plist-get @params :anchor) nil))
	(@extraInfo (or (plist-get @params :extraInfo) nil))
	(@sep (or (plist-get @params :sep) nil))
	;;
	($fileAsString)
	)

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":taskControls \"default\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
	"%s" (blee:panel:delimiterSection @outLevel
					@title
					@anchor
					@extraInfo
					:inDblock t
					:sep @sep
					)
	)))

    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))


(defun org-dblock-write:blee:bxPanel:dividerLineFull  (@params)
  "Title of the Panel. :style is expected to be closeBlank.
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) (list "openLine" "closeContinue"))) ;; souroundings style
	;;(@style (or (plist-get @params :style) "closeContinue")) ;; souroundings style	
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	;;
	($localVarPlaceHolder)
	)

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      "No specific params"
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      )
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))



(defun org-dblock-write:blee:bxPanel:title  (@params)
  "Title of the Panel. :style is expected to be closeBlank.
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	;; (@style (or (plist-get @params :style) (list "openLine" "closeContinue"))) ;; souroundings style
	(@style (or (plist-get @params :style) (list "openLine" "closeContinue"))) ;; souroundings style	
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@panelType (or (plist-get @params :panelType) "bxPanel"))
	(@title (or (plist-get @params :title) "title"))	
	
	;;
	($localVarPlaceHolder)
	)

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelType \"bxPanel\" :title \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      "NOTYET, use @panelType to choose images." 
      (insert
       (format "
%s   [[img-link:file:/bisos/blee/env/images/fpfByStarElipseTop-50.png][http://www.freeprotocols.org]]_ _   %s   [[img-link:file:/bisos/blee/env/images/fpfByStarElipseBottom-50.png][http://www.by-star.net]]
"
	       ;;;%s   [[img-link:file:/bisos/blee/env/images/fpfByStarElipseTop-50.png][http://www.freeprotocols.org]]_ _  %s: %s   [[img-link:file:/bisos/blee/env/images/fpfByStarElipseBottom-50.png][http://www.by-star.net]]
	       "*"
	       ;;@panelType
	       @title
	       ))
      (insert
       (format "%s %s "
	       (blee:panel:outLevelStr @outLevel)
	       (make-string 102 ?-)
	       ))
      )
    
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))


(defun org-dblock-write:blee:bxPanel:titleOld  (@params)
  "Title of the Panel. :style is expected to be closeBlank.
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) (list "openContinue" "closeContinue"))) ;; souroundings style
	;;(@style (or (plist-get @params :style) "closeContinue")) ;; souroundings style	
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@panelType (or (plist-get @params :panelType) "bxPanel"))
	(@title (or (plist-get @params :title) "title"))	
	
	;;
	($localVarPlaceHolder)
	)

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelType \"bxPanel\" :title \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
	"                /* %s: %s */     "
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
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) (list "openFull" "closeContinue"))) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@panelsList (or (plist-get @params :panelsList) "bxPanel"))
	(@inFile (or (plist-get @params :inFile) "panelSisters.org"))	
	;;
	($fileAsString)
	)

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
	"%s  General Panels ::   [[img-link:file:/bisos/blee/env/images/bystarInside.jpg][http://www.by-star.net]] ||  [[elisp:(find-file \"/libre/ByStar/InitialTemplates/activeDocs/listOfDocs/fullUsagePanel-en.org\")][BxDE Top Panel]]\n"
	(blee:panel:frontControl @outLevel :inDblock "yes")
	@panelsList
	))
      (when (ignore-errors (get-string-from-file (format "%s" @inFile)))
	(setq $fileAsString (ignore-errors (get-string-from-file (format "%s" @inFile))))
	(insert $fileAsString)
	)

      (insert
       (format
	"%s%s%s%s"
        (blee:panel:outLevelStr @outLevel)
	(make-string 38 ? )
	(make-string 30 ?-)	
	(make-string 36 ? )
	))
      )
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))

(defun org-dblock-write:blee:bxPanel:evolution  (@params)
  "Maintenance has a controls segment and a folding segment. :style should be closeContinue for folding segment.
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "closeContinue")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@taskControls (or (plist-get @params :taskControls) "default"))
	;;
	($fileAsString)
	)

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
   [[elisp:(org-cycle)][| <<Evolution>> *Maintenance:* | ]]  [[elisp:(blee:menu-sel:agenda:popupMenu)][||Agenda]] "
	(blee:panel:frontControl @outLevel :inDblock "yes")
	))
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))


(defun org-dblock-write:blee:bxPanel:evolutionOld  (@params)
  "Maintenance has a controls segment and a folding segment. :style should be closeContinue for folding segment.
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "closeContinue")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@taskControls (or (plist-get @params :taskControls) "default"))
	;;
	($fileAsString)
	)

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
   [[elisp:(org-cycle)][| *= Maintenance: =* | ]]  <<Evolution>>  "
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

(defun org-dblock-write:blee:bxPanel:evolutionMaintainers  (@params)
  "Maintenance has a controls segment and a folding segment. :style should be closeContinue for folding segment.
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "closeBlank")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 2)) ;; Outline Level
	;;
	(@taskControls (or (plist-get @params :taskControls) "default"))
	;;
	($fileAsString)
	)

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
   [[elisp:(org-cycle)][| /= Bug Reports, Development Team: =/ | ]]  <<Maintainers>>  
"
	(blee:panel:frontControl @outLevel :inDblock "yes")
	))
      (insert
       (format 	"\
%s  Problem Report                       ::   [[elisp:(find-file \"\")][Send debbug Email]]
"
	(blee:panel:outLevelStr (+ 1 @outLevel))
	))
      (insert
       (format 	"\
%s  Maintainers                          ::   [[bbdb:Mohsen.*Banan]]  :: http://mohsen.1.banan.byname.net  E|\
"
	(blee:panel:outLevelStr (+ 1 @outLevel))
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
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "openCloseBlank")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@origin (or (plist-get @params :origin) ""))
	;;
	($out-string)
	)

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (setq $out-string (concat "*  This File :: *= " buffer-file-name " =* E|"))
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

(defun org-dblock-write:blee:bxPanel:bashControls  (@params)
  "Bash Controls. :style is expected to be openCloseBlank.
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "openCloseBlank")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	)

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format 	"%s \
 [[elisp:(org-cycle)][|#Sh|]] :: (Results: [[elisp:(blee:bnsm:results-here)][Here]] | [[elisp:(blee:bnsm:results-split-below)][Below]] | [[elisp:(blee:bnsm:results-split-right)][Right]] | [[elisp:(blee:bnsm:results-other)][Other]] | [[elisp:(blee:bnsm:results-popup)][Popup]]) (Select:  [[elisp:(lsip-local-run-command \"lpCurrentsAdmin.sh -i currentsGetThenShow\")][Show Currents]]  [[elisp:(lsip-local-run-command \"lpCurrentsAdmin.sh\")][lpCurrentsAdmin.sh]] ) [[elisp:(org-cycle)][| ]]
"
	"*"
	))
      (insert
       (format 	"%s \
 #See:  (Window: [[elisp:(blee:bnsm:results-window-show)][?]] | [[elisp:(blee:bnsm:results-window-set 0)][0]] | [[elisp:(blee:bnsm:results-window-set 1)][1]] | [[elisp:(blee:bnsm:results-window-set 2)][2]] | [[elisp:(blee:bnsm:results-window-set 3)][3]] ) || [[elisp:(lsip-local-run-command-here \"echo pushd dest\")][echo pushd dir]] || [[elisp:(lsip-local-run-command-here \"lsf\")][lsf]] || [[elisp:(lsip-local-run-command-here \"pwd\")][pwd]] |\
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

(defun org-dblock-write:blee:bxPanel:destinationControls  (@params)
  "Destination Controls. :style is expected to be openCloseBlank.
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "openCloseBlank")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	)

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format 	"%s \
 [[elisp:(org-cycle)][|#Destinations|]] :: [[Evolution]] | [[Maintainers]]  [[elisp:(org-cycle)][| ]]
"
	(blee:panel:outLevelStr @outLevel)
	))
      (insert
       (format 	"%s \
 #See:  [[elisp:(bx:bnsm:top:panel-blee)][Blee]] | [[elisp:(bx:bnsm:top:panel-listOfDocs)][All Docs]]  E|\
"
	(blee:panel:outLevelStr (+ 1 @outLevel))
	))
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))


(defun org-dblock-write:blee:bxPanel:topPanelControls  (@params)
  "Top Controls. :style is expected to be openCloseBlank.
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "openCloseBlank")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@origin (or (plist-get @params :origin) ""))
	;;
	($out-string)
	)

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
 [[elisp:(org-cycle)][|#Control|]] :: [[elisp:(blee:bnsm:menu-back)][Back]] [[elisp:(toggle-read-only)][read/wr]] | [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]] [[elisp:(save-buffer)][Save]] [[elisp:(kill-buffer)][Quit]] [[elisp:(bury-buffer)][Bury]]  [[elisp:(magit)][Magit]]  [[elisp:(org-cycle)][| ]]
"
	"*"
	))
      (insert
       (format
	"%s \
 [[elisp:(blee:buf:re-major-mode)][Re-Major-Mode]] ||  [[elisp:(org-dblock-update-buffer-bx)][Update Buf Dblocks]] || [[elisp:(org-dblock-bx-blank-buffer)][Blank Buf Dblocks]] || [[elisp:(bx:panel:variablesShow)][bx:panel:variablesShow]]
"
	"**"
	))

      (insert
       (format
	"%s \
 [[elisp:(blee:menu-sel:comeega:maintenance:popupMenu)][||Maintenance]] 
"
	"**"
	))


      (setq $out-string (concat "**  This File :: *= " buffer-file-name " =* \n"))
      (if (not (string-equal "" @origin))
	  (setq $out-string (concat $out-string "\n** Origin    :: /libre/ByStar/InitialTemplates/activeDocs/common/activitiesPanels/" $origin))
	)
      (insert $out-string)
      
      (insert
       (format
	"%s \
 [[elisp:(org-cycle)][|#Select|]]  :: (Results: [[elisp:(blee:bnsm:results-here)][Here]] | [[elisp:(blee:bnsm:results-split-below)][Below]] | [[elisp:(blee:bnsm:results-split-right)][Right]] | [[elisp:(blee:bnsm:results-other)][Other]] | [[elisp:(blee:bnsm:results-popup)][Popup]]) (Select:  [[elisp:(lsip-local-run-command \"lpCurrentsAdmin.sh -i currentsGetThenShow\")][Show Currents]]  [[elisp:(lsip-local-run-command \"lpCurrentsAdmin.sh\")][lpCurrentsAdmin.sh]] ) [[elisp:(org-cycle)][| ]]
"
	"*"
	))
      (insert
       (format 	"%s \
 #See:  (Window: [[elisp:(blee:bnsm:results-window-show)][?]] | [[elisp:(blee:bnsm:results-window-set 0)][0]] | [[elisp:(blee:bnsm:results-window-set 1)][1]] | [[elisp:(blee:bnsm:results-window-set 2)][2]] | [[elisp:(blee:bnsm:results-window-set 3)][3]] ) || [[elisp:(lsip-local-run-command-here \"echo pushd dest\")][echo pushd dir]] || [[elisp:(lsip-local-run-command-here \"lsf\")][lsf]] || [[elisp:(lsip-local-run-command-here \"pwd\")][pwd]] |\
"
	"**"
	))
      (insert
       (format
	"%s \
 [[elisp:(blee:buf:re-major-mode)][Re-Major-Mode]] ||  [[elisp:(org-dblock-update-buffer-bx)][Update Buf Dblocks]] || [[elisp:(org-dblock-bx-blank-buffer)][Blank Buf Dblocks]] || [[elisp:(bx:panel:variablesShow)][bx:panel:variablesShow]] 
"
	"**"
	))

      (insert
       (format 	"%s \
 [[elisp:(org-cycle)][|#Destinations|]] :: [[Evolution]] | [[Maintainers]]  [[elisp:(org-cycle)][| ]]
"
	(blee:panel:outLevelStr (+ 1 @outLevel))
	))
      
      (insert
       (format 	"%s \
 #See:  [[elisp:(bx:bnsm:top:panel-blee)][Blee]] | [[elisp:(bx:bnsm:top:panel-listOfDocs)][All Docs]]\
"
	(blee:panel:outLevelStr (+ 1 @outLevel))
	))
      

      (insert
       (format
	"\
  E|\
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


(defun org-dblock-write:blee:bxPanel:footerPanelControls  (@params)
  "Similar to topPanelControls but for bottom. :style is expected to be closeBlank.
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) (list "openLine" "closeContinue"))) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@panelsList (or (plist-get @params :panelType) "bxPanel"))
	(@inFile (or (plist-get @params :inFile) "panelSisters.org"))	
	;;
	($fileAsString)
	)

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
	"
%s /Footer Controls/ ::  [[elisp:(blee:bnsm:menu-back)][Back]]  [[elisp:(toggle-read-only)][toggle-read-only]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Cycle Glob Vis]]  [[elisp:(delete-other-windows)][1 Win]]  [[elisp:(save-buffer)][Save]]   [[elisp:(kill-buffer)][Quit]] \
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
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "closeBlank")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@panelsList (or (plist-get @params :panelType) "bxPanel"))
	(@inFile (or (plist-get @params :inFile) "panelSisters.org"))	
	;;
	($fileAsString)
	)

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
	(blee:panel:frontControl @outLevel :inDblock "yes")
	))
      
      (insert
       (format "\
#+STARTUP: lognotestate
#+STARTUP: inlineimages
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


;;;
;;; (give-me-comment-starters-ender-for-a-mode 'emacs-lisp-mode)
;;; (blee:mode:commentStartGet 'emacs-lisp-mode)
;;; (blee:mode:commentStartGet 'org-mode)
;;; (blee:mode:commentStartGet 'latex-mode)
;;; (blee:mode:commentStartGet 'shell-script-mode)
;;; (blee:mode:commentEndGet 'shell-script-mode)

(defun blee:mode:commentStartGet (mode)
  "Returns a  comment-start of arg MODE"
  (with-temp-buffer
    (funcall mode)
    comment-start))

(defun blee:mode:commentEndGet (mode)
  "Returns comment-end of arg MODE"
  (with-temp-buffer
    (funcall mode)
    comment-end))


(defun org-dblock-write:blee:bxPanel:footerEmacsParams (@params)
  " Example for pure Blee org-mode dblocks.
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) "closeBlank")) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@primMode (or (plist-get @params :primMode) (symbol-name major-mode)))
	(@latexMasters (or (plist-get @params :latexMasters) nil))	
	;;
	($commentStartStr)
	($primModeSymb)
	)

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":primMode \"emacs-lisp\"|\"org-Mode\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
	"%s    [[elisp:(org-cycle)][| *= Emacs Local Params: =* | ]]\n"
	(blee:panel:frontControl @outLevel :inDblock "yes")
	))

      (setq $primModeSymb (intern @primMode))

      (setq $commentStartStr (blee:mode:commentStartGet $primModeSymb))

      (mapcar (lambda (x)
		(insert
		 (format "%s%s\n"
			 $commentStartStr
			 x
			 )))
	      
	      (s-lines
	       (format "\
Local Variables:
eval: (setq-local ~selectedSubject \"noSubject\")
eval: (setq-local ~primaryMajorMode '%s)
eval: (setq-local ~blee:panelUpdater nil)
eval: (setq-local ~blee:dblockEnabler nil)
eval: (img-link-overlays)"

		       @primMode
		       ))
	      )
      
      (when (string= @primMode "latex-mode")
	(mapcar (lambda (x)
		  (insert
		   (format "%s%s\n"
			   $commentStartStr
			   x
			   )))
	      
		(s-lines
		 (format "\
eval: (setq-local ~lcnt:texClass nil)
eval: (setq-local ~lcnt:bibProvider nil)
eval: (setq-local ~lcnt:paperSize nil)"
			 ))
		)
	 
	)
	(when @latexMasters
	  (insert (format "%sTeX-master: \"%s\"\n"
		  $commentStartStr
		  @latexMasters
		  )))

      (mapcar (lambda (x)
		(insert
		 (format "%s%s\n"
			 $commentStartStr
			 x
			 )))
	      
	      (s-lines
	       (format "\
eval: (bx:load-file:ifOneExists \"./panelActions.el\")
End:"
		       ))
	      ))
    
    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))

(defun org-dblock-write:bx:dblock:org:parameters (params)
  "Old Style. Kept for backwards comptibilitty. Also shown to pean."
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

(defun blee:dblockEnablerFunc (@origFunc &rest @params)
  "Experiment with  (compile-time-function-name) to see if we get @origFunc name.

Mystery: (apply 'disabledReport @params) works. (disabledReport @params) does not. @params are not accessible after &rest.

NOTYET, See if this can be improved to include bx:dblock:governor:process when
@origFunc returns a plist of contentPlus, content, helpLine functions.
"

  (defun disabledReport (@params)
      (let (
	    (@content (plist-get @params :content))
	    (@name (plist-get @params :name))	
	    )
	(setq time-stamp-format "%02Y%-02m-%02d-%02H:%02M:%02S")
	(insert (format "%s dblock skipped due to blee:dblockEnabler %s\n" @name (time-stamp-string)))
	(insert (format "%s" @content))
	;; solution below does not work
	;;(org-kill-line)   ;;; @content adds an extra line at the end -- need this as it can be repeated
	)
      )
  (when ~blee:dblockEnabler
    (apply @origFunc @params)
    )
  (unless ~blee:dblockEnabler
    (apply 'disabledReport @params)      
    )
  )

(advice-add 'org-dblock-write:blee:bxPanel:runResult :around #'blee:dblockEnablerFunc)
(defun org-dblock-write:blee:bxPanel:runResult (@params)
  "@command, @comment and @results control the behaviour.

** When @results is nil, D-Run and Results are eliminated
** When @results is t, both stdout and stderr are captured
** When @results is \"stdout\", only stdout is captured
** When @results is not specified, same a t
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) (list "openBlank" "closeTerse"))) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@command (or (plist-get @params :command) ""))
	(@comment (or (plist-get @params :comment) nil))
	(@afterComment (or (plist-get @params :afterComment) nil))	
	(@results (or (plist-get @params :results) nil))
	(@content (plist-get @params :content))
	(@name (plist-get @params :name))		
	;;(@stdErr (and (plist-get @params :stdErr) t))
	;;
	($stdErrStr "")
	($stdOutOnlyIndicator "")
	($name "")
	)

    ;;; unspecified results is t
    (unless (plist-member @params :results)
      (setq @results t))

    (when (string-equal "none" @results)
      (setq @results nil))
    
    ;;(insert (format "%s dblock skipped due to blee:dblockEnabler\n" @name))
    
    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()

      (when (string-equal "stdout" @results)
	(setq $stdErrStr " 2> /dev/null")
	(setq $stdOutOnlyIndicator "stdout "))     


      (insert
       (format
	"%s" (blee:panel:delimiterFrontControl @outLevel
					     :inDblock t
					     )))

   
      ;;(insert "   [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]  ")

      (insert "    ")
      
      (insert (blee:panel:button:shCommand @command))

      ;;(insert (format "results %s" @results))
      
      (when @results
	(insert " _::_ ")
      
	(insert "[[elisp:(blee:org-update-named-dblocks-above)][D-Run]]  ")

	(insert (format "[[elisp:(org-cycle)][| /%sResults:/ |]] " $stdOutOnlyIndicator))
	)

      (when @comment
	(insert " ~||~ ")
	(insert 
	 (format " =%s=" @comment)))

      
      (when @afterComment
	(insert (format " %s " @afterComment)))

 
      (when @results
	(insert " |\n")
	(setq time-stamp-format "%02Y%-02m-%02d-%02H:%02M:%02S")
	(insert (format "Last Executed at: %s  by: %s on: %s\n" (time-stamp-string) (user-login-name) (system-name)))      

	(insert "----------------------------\n")

	(insert
	 (shell-command-to-string 
	  (format "source ~/.bashrc; %s %s" @command $stdErrStr))
	 )
	)
      )

    (when (not @results)
      (setq @style (list "openBlank" "closeContinue"))
      )

    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))


(defun org-dblock-write:blee:bxPanel:runResultOrig (@params)
  " Example for pure Blee org-mode dblocks.
"
  (let (
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@extGov (or (plist-get @params :extGov) "na")) ;; External Governor
	(@style (or (plist-get @params :style) (list "openBlank" "closeFull"))) ;; souroundings style
	(@outLevel (or (plist-get @params :outLevel) 1)) ;; Outline Level
	;;
	(@command (or (plist-get @params :command) ""))
	(@comment (or (plist-get @params :comment) nil))	
	(@stdErr (and (plist-get @params :stdErr) t))
	;;
	($stdErrStr "")
	)

    (setq @governor (bx:dblock:governor:effective @governor @extGov))    ;; Now available to local defuns

    (defun helpLine ()
      ":panelsList \"bxPanel\" :inFile \"Title Of This Panel\""
      )

    (defun bodyContentPlus ()
      )

    (defun bodyContent ()
      (insert
       (format
	"%s" (blee:panel:foldingSection @outLevel
					"Results"
					nil
					nil
					:inDblock t
					)))
      
      (insert "[[elisp:(blee:org-update-named-dblocks-above)][D-Run]]")

      (when @comment
	(insert 
	 (format " /%s/" @comment)))
 
      (insert " || ")      

      (insert (blee:panel:button:shCommand @command))
      
      (insert " |\n")

      (unless @stdErr
	(setq $stdErrStr " 2> /dev/null"))

      (setq time-stamp-format "%02Y%-02m-%02d-%02H:%02M:%02S")
      (insert (format "Last Executed at: %s  by: %s on: %s\n" (time-stamp-string) (user-login-name) (system-name)))      

      (insert "----------------------------\n")

      (insert
       (shell-command-to-string 
	(format "source ~/.bashrc; %s %s" @command $stdErrStr))
       )
      )
       

    (bx:dblock:governor:process @governor @extGov @style @outLevel
				(compile-time-function-name)
				'helpLine
				'bodyContentPlus
				'bodyContent
				)

    ))


(defun bx:panel:variablesShow ()
  "Relevant Buffer Local Variables Are "
  (interactive)
  
  (let ((buffer-name (generate-new-buffer-name "bleePanelVars"))
	(aggregatedStr
	 (with-output-to-string
	   (princ "This Panel's Variables\n")
	   (princ "============================================\n")
	   (princ (format "~selectedSubject:\t %S\n" ~selectedSubject))
	   (princ (format "~primaryMajorMode:\t %S\n" ~primaryMajorMode))	   
	   (princ "============================================\n")
	   )
	 ))
    (switch-to-buffer buffer-name)
    (insert aggregatedStr)))



;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-org-general"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-org-general)
;;;#+END:
