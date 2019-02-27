;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)

;;;#+BEGIN: bx:dblock:global:org-controls :disabledP "false" :mode "auto"
(lambda () "
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
*  /Maintain/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 
*      ================
")
;;;#+END:

;;;#+BEGIN: bx:dblock:global:org-contents-list :disabledP "false" :mode "auto"
(lambda () "
*      ################ CONTENTS-LIST ###############
*  [[elisp:(org-cycle)][| ]]  *Document Status, TODOs and Notes*          ::  [[elisp:(org-cycle)][| ]]
")
;;;#+END:

(lambda () "
**  [[elisp:(org-cycle)][| ]]  Idea      ::  Description   [[elisp:(org-cycle)][| ]]
")


(lambda () "
* TODO [[elisp:(org-cycle)][| ]]  Description   :: *Info and Xrefs* UNDEVELOPED just a starting point <<Xref-Here->> [[elisp:(org-cycle)][| ]]
")


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "blee-lib-widget"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."  :: Loading Announcement Message blee-lib-widget [[elisp:(org-cycle)][| ]]
")

(message "blee-lib-widget")
;;;#+END:

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires      :: Requires [[elisp:(org-cycle)][| ]]
")

(require 'f)

(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry     :: blee:blee-lib-widget:all-defaults-set [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee-lib-widget:all-defaults-set) [[elisp:(org-cycle)][| ]]
")

(defun blee-lib-widget:all-defaults-set ()
  ""
  (interactive)

  (require 'blee-menu-ipAddr)
  (require 'blee-menu-domain)
  (require 'blee-checklist-vmHosts)

  ;;(blee:visitFilesMenuDef)  ;; Should not be initialized before (set-buffer "*LSIP* localhost")
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:visitFilesAtDirMenuDef dir) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:visitFilesAtDirMenuDef (dir)
  ""
  (interactive)
  (easy-menu-define blee:visitFilesAtDirMenu
    nil
    "Doc String" 
    (append
     '("Visit -- Files Menu")
     (mapcar (lambda (x)
	       (vector (file-name-nondirectory x)
		       `(lambda () (interactive) (find-file ,x) t)))
	     (f-glob
	      "*"
	      dir
	      )))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:visitFilesAtDirPopupMenu dir) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:visitFilesAtDirPopupMenu (dir)
  ""
  (blee:visitFilesAtDirMenuDef dir)
  (popup-menu blee:visitFilesAtDirMenu)
  (blee:menu-box:parallelBranches)  
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:visitFilesMenuDef) [[elisp:(org-cycle)][| ]]
")

(defun blee:visitFilesMenuDef ()
  ""
  (interactive)
  (easy-menu-define visitFilesMenu nil "Doc String" 
    (append
     '("Visit -- Files Menu")
     (mapcar (lambda (x)
	       (vector (file-name-nondirectory x)
		       `(lambda () (interactive) (find-file ,x) t)))
	     (f-glob
	      "*"
	      (save-excursion
		(set-buffer "*LSIP* localhost")
		default-directory)
	      )))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:visitFilesPopupMenu) [[elisp:(org-cycle)][| ]]
")

(defun blee:visitFilesPopupMenu ()
  ""
  (blee:visitFilesMenuDef)
  (popup-menu visitFilesMenu)
  (blee:menu-box:parallelBranches)    
  )


(lambda () "
*      Testing/Execution          ::  [[elisp:(blee:visitFilesPopupMenu)][Popup Files Menu]]  | 
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:selectFilesMenuDef) [[elisp:(org-cycle)][| ]]
")

(defun blee:selectFilesMenuDef ()
  ""
  (interactive)
  (easy-menu-define selectFilesMenu nil "Doc String" 
    (append
     '("Select -- Files Menu")
     (mapcar (lambda (x)
	       (vector (file-name-nondirectory x)
		       `(lambda ()
			  (interactive)
			  ;;(message (format "%s YYYYZZZZZ" ,x))			  
			  (setq bufloc:selectedSubject ,x)			  
			  t)))
	     (f-glob
	      "*"
	      (save-excursion
		(set-buffer "*LSIP* localhost")
		default-directory)
		     )))))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:selectFilesPopupMenu) [[elisp:(org-cycle)][| ]]
")

(defun blee:selectFilesPopupMenu ()
  ""
  (blee:selectFilesMenuDef)
  (popup-menu selectFilesMenu)
  (blee:menu-box:parallelBranches)  
  )


(lambda () "
*      Testing/Execution          ::  [[elisp:(blee:selectFilesPopupMenu)][Popup Select File Menu]]  | 
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:virsh:domain:menuSelectDef kvmHost) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:virsh:domain:menuSelectDef (kvmHost)
  ""
  (interactive)
  (let ((menuHeading (format "%s -- KVM Virtual Machines Selection Menu" kvmHost)))  
  (easy-menu-define blee:virsh:domain:menuSelect nil "" 
    (append
     (list menuHeading)
     (list "---")
     (mapcar (lambda (x)
	       (vector (format "%s:  %s" kvmHost x)
		       `(lambda ()
			  (interactive)
			  (let ((lineAsList)
				(vmName)
				)
			    (setq lineAsList (split-string ,x))
			    (setq vmName (car (cdr lineAsList)))
			    (setq bufloc:selectedSubject vmName)
			    ))))
	     (virsh:list:linesList kvmHost)
	     )))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:virsh:domain:selectPopupMenu kvmHost) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:virsh:domain:selectPopupMenu  (kvmHost)
  ""
  (blee:virsh:domain:menuSelectDef kvmHost)
  (popup-menu blee:virsh:domain:menuSelect)
  (blee:menu-box:parallelBranches)  
  )


(lambda () "
*      Testing/Execution          ::  [[elisp:(blee:virsh:domain:selectPopupMenu)][Popup KVM Selection Menu]]  | 
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (virsh:list:linesList kvmHost) [[elisp:(org-cycle)][| ]]
  ")

(defun virsh:list:linesList (kvmHost)
  "Ignores the first two lines which are tabulated labels."
  (let ((linesList))
    (setq linesList
	  (split-string
	   (shell-command-to-string 
	    ;;(format "virsh --connect qemu:///system list --all --title --table" )
	    (format "virsh --connect qemu+ssh://lsipusr@%s/system list --all --title --table" kvmHost)	    
	    )
	   "\n"
	   t
	   ))
    (setq linesList (cdr (cdr linesList)))
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel:iif:define iim) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-sel:iif:define (iim)
  ""
  (interactive)
  (let ((menuHeading (format "%s (IIM) IIF Selection Menu" iim)))
    (message menuHeading)
    (easy-menu-define
      blee:menu-sel:iif:name
      nil
      "" 
      (append
       (list menuHeading)
       (list "---")
       (mapcar (lambda (x)
	       (vector (format "%s" x)
		       `(lambda ()
			  (interactive)
			  (setq bx:iimBash:iimIif ,x)
			  )
		       )
	       )
	       (iifsOfIim iim)
	       )))))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel:iif:popupMenu iim) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-sel:iif:popupMenu (iim)
  ""
  (blee:menu-sel:iif:define iim)
  (popup-menu blee:menu-sel:iif:name)
  (blee:menu-box:parallelBranches)  
  )

;;; (iifsOfIim "lcaVirshManage.sh")
(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (nil iim) [[elisp:(org-cycle)][| ]]
  ")

(defun  iifsOfIim (iim)
  ""
  (split-string
   (shell-command-to-string 
    (format "%s -i lsIifs"  iim)
    )))


(lambda () "
*      Testing/Execution          ::  [[elisp:(blee:menu-sel:iif:popupMenu "lcaVirshManage.sh")][Popup IIFs of IIM  Selection Menu]] | 
")




(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel:varAsPathFromDir:define var dir) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-sel:varAsPathFromDir:define (var dir)
  ""
  (interactive)
  (easy-menu-define blee:menu-sel:varAsPathFromDir:name
    nil
    "Doc String" 
    (append
     '("Select -- Targets Menu")
     (mapcar (lambda (x)
	       (vector (file-name-nondirectory x)
		       `(lambda ()
			  (interactive)
			  (setq ,var ,x)			  
			  t)))
	     (f-glob
	      "*"
	      dir
	      )))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel:varAsPathFromDir:popupMenu var dir) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-sel:varAsPathFromDir:popupMenu (var dir)
  ""
  (blee:menu-sel:varAsPathFromDir:define var dir)
  (popup-menu blee:menu-sel:varAsPathFromDir:name)
  (blee:menu-box:parallelBranches)  
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel:varAsNameFromDir:define var dir) [[elisp:(org-cycle)][| ]]
  ")


(defun blee:menu-sel:varAsNameFromDir:define (var dir)
  ""
  (interactive)
  (easy-menu-define blee:menu-sel:varAsNameFromDir:name
    nil
    "Doc String" 
    (append
     '("Select -- Targets Menu")
     (mapcar (lambda (x)
	       (vector (file-name-nondirectory x)
		       `(lambda ()
			  (interactive)
			  (setq ,var (file-name-nondirectory ,x))
			  t)))
	     (blee:fn:dir:*-relevant dir)   	     
	     ))))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-sel:varAsNameFromDir:popupMenu var dir) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-sel:varAsNameFromDir:popupMenu (var dir)
  ""
  (blee:menu-sel:varAsNameFromDir:define var dir)
  (popup-menu blee:menu-sel:varAsNameFromDir:name)
  (blee:menu-box:parallelBranches)  
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-box:varAsNameFromDirUpdate:define var dir) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-box:varAsNameFromDirUpdate:define (var dir)
  ""
  (interactive)
  (easy-menu-define blee:menu-box:varAsNameFromDirUpdate:name
    nil
    "Doc String" 
    (append
     (list (format "Selections Menu For: var=%s" var))
     (mapcar (lambda (x)
	       (vector (file-name-nondirectory x)
		       `(lambda ()
			  (interactive)
			  (setq ,var (blee:menu-box:translate (file-name-nondirectory ,x)))
			  (blee:menu-box:updateCurValue (file-name-nondirectory ,var))
			  t)))
	     (blee:fn:dir:*-relevant dir)   	     
	     ))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-box:varAsNameFromDirUpdate:popupMenu var dir) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-box:varAsNameFromDirUpdate:popupMenu (var dir)
  ""
  (blee:menu-box:varAsNameFromDirUpdate:define var dir)
  (popup-menu blee:menu-box:varAsNameFromDirUpdate:name)
  (blee:menu-box:parallelBranches)  
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-box:paramFromDirUpdate:define dir) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-box:paramFromDirUpdate:define (dir)
  ""
  (interactive)
  (let (
	(paramName (file-name-nondirectory dir))
	)
    (easy-menu-define blee:menu-box:paramFromDirUpdate:name
      nil
      "Doc String" 
      (append
       (list (format "Selections Menu For: param=%s" paramName))
       (mapcar (lambda (x)
		 (vector (file-name-nondirectory x)
			 `(lambda ()
			    (interactive)
			    (blee:iimBash:paramSetAndUpdate (format "%s" ,paramName) (file-name-nondirectory ,x))
			    t)))
	       (blee:fn:dir:*-relevant dir)   	     
	       )))))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-box:paramFromDirUpdate:popupMenu dir) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-box:paramFromDirUpdate:popupMenu (dir)
  ""
  (blee:menu-box:paramFromDirUpdate:define dir)
  (popup-menu blee:menu-box:paramFromDirUpdate:name)
  (blee:menu-box:parallelBranches)  
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:iimBash:paramSet paramName paramValue) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:iimBash:paramSet (paramName paramValue)
  ""
  (blee:eval-string
   (format "(put 'bx:iimBash:paramsPropList '%s \"%s\")"
	   paramName paramValue)))



(defun blee:iimBash:paramSetAndUpdate (paramName paramValue &optional dontUpdate)
  ""
  (let (
	(processedParamValue paramValue)
	)
    (when (string= paramValue "UserInput")
      (setq processedParamValue (read-string "User Input: "))
      )
    (blee:eval-string
     (format "(put 'bx:iimBash:paramsPropList '%s \"%s\")"
	     paramName processedParamValue))
    (if (not dontUpdate)
	(blee:menu-box:updateCurValue processedParamValue)
      )
    )
  )



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-box:translate var) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-box:translate (var)
  ""
  (let ((retVal var))
    (when (string= var "None")
      (setq retVal ""))

    (when (string= var "UserInput")
      (setq retVal (read-string "User Input: "))
      )

    retVal
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-box:paramsPropListClear) [[elisp:(org-cycle)][| ]]
")

(defun blee:menu-box:paramsPropListClear ()
  ""
  (save-excursion
    (bx:iimBash:paramsPropListClear)
    (blee:org-update-named-dblocks "bx:dblock:org:iimBash:execControlShow")
    ))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-box:cmndLineResultsRefresh) [[elisp:(org-cycle)][| ]]
")

(defun blee:menu-box:cmndLineResultsRefresh ()
  ""
  (save-excursion
    (blee:org-update-named-dblocks "bx:dblock:org:iimBash:execControlShow")
    ))

(defun blee:org-refresh:run-result ()
  ""
  (save-excursion
    (blee:org-update-named-dblocks "bx:dblock:global:run-result")
    ))


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:org-update-named-dblocks name-of-dblock) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:org-update-named-dblocks (name-of-dblock)
  ""
  (interactive)
  (goto-char (point-min))    
  (save-excursion
    (while (search-forward name-of-dblock nil t)
      (save-excursion
	;;(org-mode)
	(org-dblock-update)
	)
      )))

(defun blee:org-update-named-dblocks-here (name-of-dblock)
  ""
  (interactive)
  (save-excursion
    (goto-char (point-min))        
    (while (search-forward name-of-dblock nil t)
      (save-excursion
	;;(org-mode)
	(org-dblock-update)
	)
      )))

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-box:iif:define "lcaVirshManage.sh") [[elisp:(org-cycle)][| ]]
  ")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-box:iif:define iim) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-box:iif:define-deleteLater (iim)
  ""
  (interactive)
  (let ((menuHeading (format "%s (IIM) IIF Selection Menu" iim)))
    (message menuHeading)
    (easy-menu-define
      blee:menu-box:iif:name
      nil
      "" 
      (append
       (list menuHeading)
       (list "---")
       (mapcar (lambda (x)
	       (vector (format "%s" x)
		       `(lambda ()
			  (interactive)
			  (setq bx:iimBash:iimIif ,x)
			  (blee:menu-box:updateCurValue bx:iimBash:iimIif)
			  )
		       )
	       )
	       (iifsOfIim iim)
	       )))))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:virsh:domain:selectPopupMenu) [[elisp:(org-cycle)][| ]]
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-box:iif:popupMenu iim) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-box:iif:popupMenu-deleteLater (iim)
  ""
  (blee:menu-box:iif:define iim)
  (popup-menu blee:menu-box:iif:name)
  (blee:menu-box:parallelBranches)
  )


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-box:iif:define iim) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-box:iifSpecific:define-deleteLater (iim)
  ""
  (interactive)
  (let ((menuHeading (format "%s (IIM) IIF Selection Menu" iim)))
    (message menuHeading)
    (easy-menu-define
      blee:menu-box:iifSpecific:name
      nil
      "" 
      (append
       (list menuHeading)
       (list "---")
       (mapcar (lambda (x)
	       (vector (format "%s" x)
		       `(lambda ()
			  (interactive)
			  (setq bx:iimBash:iimIif ,x)
			  (blee:menu-box:updateCurValue bx:iimBash:iimIif)
			  )
		       )
	       )
	       (set-difference (iifsOfIim iim) (iifsOfIim "/opt/public/osmt/bin/iimBashNull.sh") :test 'string=)
	       )))))



(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:virsh:domain:selectPopupMenu) [[elisp:(org-cycle)][| ]]
")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (blee:menu-box:iif:popupMenu iim) [[elisp:(org-cycle)][| ]]
  ")

(defun blee:menu-box:iifSpecific:popupMenu-deleteLater (iim)
  ""
  (blee:menu-box:iifSpecific:define iim)
  (popup-menu blee:menu-box:iifSpecific:name)
  (blee:menu-box:parallelBranches)
  )



;; (easy-menu-define jrk-menu global-map "MyMenu"
;;   '("My Files"))

;; (defun update-my-file-menu ()
;;   (easy-menu-add-item jrk-menu '() (get-menu)))

;; (add-hook 'menu-bar-update-hook 'update-my-file-menu)

;; (defun get-menu ()
;;   (easy-menu-create-menu
;;    "Files"
;;    (mapcar (lambda (x)
;; 	     (vector (file-name-nondirectory x)
;; 		     `(lambda () (interactive) (find-file ,x) t)))
;; 	   (f-glob "*"))))


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "blee-lib-widget"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide       :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'blee-lib-widget)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; bx:iimp:iimName: "hereHere"
;;; end:
