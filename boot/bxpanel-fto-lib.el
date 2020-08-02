;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string "fto-lib" "bxpanel-fto-lib")  (replace-string "fv:" "fto:")

(lambda () "
*  [[elisp:(org-cycle)][| ]]  *Short Desription*  :: Library (fto:), for handelling File Tree Objects [[elisp:(org-cycle)][| ]]
* 
")


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


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "bxpanel-fto-lib"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."                :: Loading Announcement Message bxpanel-fto-lib [[elisp:(org-cycle)][| ]]
")

(blee:msg "Loading: bxpanel-fto-lib")
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Requires                    :: Requires [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Top Entry                   :: fto:main-init [[elisp:(org-cycle)][| ]]
")


(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fto:main-init) [[elisp:(org-cycle)][| ]]
")

(defun blee:panel:fto|main-init ()
  "Desc:"
  nil
  )

;;;
;;; (blee:panel:fto|atBaseTreeElementLinkStr "/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs" :format "line")
;;; 
(defun blee:panel:fto|atBaseTreeElementLinkStr (<ftoBase  &rest <args)
  "Given ftoBase, return org-link string for a given descendant.
When :format is terse, a single link.
When :format is line, a complete line.
"
  (let (
	($result nil)
	(<format (or (plist-get <args :format) "terse"))
	($ftoName)
	)
    (when (fto:treeElem|atBaseIsLeaf? <ftoBase)
      (when (string= <format "terse")
	(setq $result (format
		       "%s"
		       "JJ")
	      )
	)
      (when (string= <format "line")
	(setq $ftoName (fto:treeElem|atBaseGetName <ftoBase))
	(setq $result 
	      (format
	       "[[elisp:(blee:bnsm:panel-goto \"%s\")][@ %s @]]    ::  Leaf: /%s/"
	       <ftoBase
	       $ftoName
	       $ftoName	       
	       )
	      )
	)
      )
    (when (fto:treeElem|atBaseIsNode? <ftoBase)
      (when (string= <format "terse")
	(setq $result (format
		       "%s"
		       "JJNode")
	      )
	)
      (when (string= <format "line")
	(setq $ftoName (fto:treeElem|atBaseGetName <ftoBase))
	(setq $result 
	      (format
	       "[[elisp:(blee:bnsm:panel-goto \"%s\")][@ %s @]]    ::  Node: /%s/"
	       (fto:node|atBaseGetNodeBase <ftoBase)
	       $ftoName
	       $ftoName	       
	       )
	      )
	)
      )
    $result
    )
  )


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "bxpanel-fto-lib"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'bxpanel-fto-lib)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
