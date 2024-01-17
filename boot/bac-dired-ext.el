;;; -*- Mode: Emacs-Lisp; -*-

(defun bac:pkg:makeAvailable:dired ()
  ""
  (blee:load-path:add  
   (concat (file-name-as-directory
	    (concat  (file-name-as-directory (blee:env:aPkgs:base-obtain))
		     "common")
	    )
	   "diredPlus")
   )

  ;;; MB-2024-01-16 Problems woth emacs-28.2 -- amd not sure why
  ;; (require 'dired+)
  ;; (require 'dired-sort-menu+)
  )

 (defun bac:pkg:enable:dired ()
   ""
   ;;;(setq dired-listing-switches "-aBhl  --group-directories-first")
  )

(provide 'bac-dired-ext)
