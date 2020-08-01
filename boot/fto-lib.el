;;; -*- Mode: Emacs-Lisp; -*-
;; (setq debug-on-error t)
;; Start Example: (replace-string "fv-lib" "fto-lib")  (replace-string "fv:" "fto:")

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


;;;#+BEGIN: bx:dblock:lisp:loading-message :disabledP "false" :message "fto-lib"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  "Loading..."                :: Loading Announcement Message fto-lib [[elisp:(org-cycle)][| ]]
")

(blee:msg "Loading: fto-lib")
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

(defun fto:main-init ()
  "Desc:"
  nil
  )

(lambda () "
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || defun        :: (fto:withBaseNode? ftoBase) [[elisp:(org-cycle)][| ]]
  ")


;;;
;;; (fto:withBase:treeElementGet  "~/org/assests/houses/3610/main")
;;; 
(defun fto:withBase:treeElementGet (<ftoBase)
  "Given ftoBase, return nil if ftoBase is not a Node."
  (fv:read-as-string (concat <ftoBase "/_tree_"))
  )


;;;
;;; (fto:withBase:isNode? "~/org/assests/houses/3610/main")
;;; 
(defun fto:withBase:isNode? (<ftoBase)
  "Given ftoBase, return nil if ftoBase is not a Node."
  (let (
	($result nil))
    (when (string= (fto:withBase:treeElementGet <ftoBase) "node")
      (setq $result t)
      )
    $result
    )
  )

;;;
;;; (fto:withBase:isLeaf? "~/org/assests/houses/3610/main")
;;; 
(defun fto:withBase:isLeaf? (<ftoBase)
  "Given ftoBase, return nil if ftoBase is not a Node."
  (let (
	($result nil))
    (when (string= (fto:withBase:treeElementGet <ftoBase) "leaf")
      (setq $result t)
      )
    $result
    )
  )

;;;
;;; 
;;; 
(defun fto:treeElem|withBaseGetName (<ftoBase)
  "Name of the treeElem based on fileName base"
  (let (
	($result nil)
	)
    $result
    )
  )

;;;
;;; 
;;; 
(defun fto:treeElem|withBaseGetType (<ftoBase)
  "One of Node, Leaf, AuxNode"
  (let (
	($result nil)
	)
    $result
    )
  )

;;;
;;; 
;;; 
(defun fto:node|withBaseGetName (<ftoBase)
  "Name of the Node as string"
  (let (
	($result nil)
	)
    $result
    )
  )

;;;
;;; 
;;; 
(defun fto:node|withBaseGetDescendantsBases (<ftoBase)
  "Provides a list of descendants bases"
  (let (
	($result nil)
	)
    $result
    )
  )

;;;
;;; 
;;; 
(defun fto:node|withBaseGetSiblingsBases (<ftoBase)
  "Provides a list of siblings bases"
  (let (
	($result nil)
	)
    $result
    )
  )

;;;
;;; 
;;; 
(defun fto:node|withBaseGetAncestorBases (<ftoBase)
  "Provides a list of ancestor bases"
  (let (
	($result nil)
	)
    $result
    )
  )

;;;
;;; 
;;; 
(defun fto:leaf|withBaseGetName (<ftoBase)
  "Name of the leaf as string"
  (let (
	($result nil)
	)
    $result
    )
  )

;;;
;;; 
;;; 
(defun fto:leaf|withBaseGetSiblingsBases (<ftoBase)
  "Provides a list of siblings bases"
  (let (
	($result nil)
	)
    $result
    )
  )

;;;
;;; 
;;; 
(defun fto:leaf|withBaseGetAncestorBases (<ftoBase)
  "Provides a list of ancestor bases"
  (let (
	($result nil)
	)
    $result
    )
  )





;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "fto-lib"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'fto-lib)
;;;#+END:


(lambda () "
*  [[elisp:(org-cycle)][| ]]  Common        :: /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
