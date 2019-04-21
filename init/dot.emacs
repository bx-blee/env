;;; -*- Mode: Emacs-Lisp; -*-


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;;
;;; Blee bootstrap Start
;;;

(defun blee:bootstrap:file-name-obtain ()
  (interactive)
  (let (
	(blee-3-bootstrap "/bisos/blee/env/main/bystar-emacs.el")
	(blee-2-bootstrap "~/lisp/bystar-emacs.el")
	)
    (cond
     ((file-exists-p blee-3-bootstrap)
      (message blee-3-bootstrap)
      blee-3-bootstrap
      )
     ((file-exists-p blee-2-bootstrap)
      (message blee-2-bootstrap)      
      blee-2-bootstrap
      )
     (t
      (message "Missing Blee bootstrap file")
      nil
      )
     )))

(defvar blee:bootstrap:file-name (blee:bootstrap:file-name-obtain)  "Initial Blee Load File")

(if blee:bootstrap:file-name
    (load  blee:bootstrap:file-name)
  )

;;;
;;; END OF .emacs
