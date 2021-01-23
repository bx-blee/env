;;;
;;;

(require 'easymenu)

;;;
;;;
;;;

(defun bxo:listSubMenuDef ()
  ""
  (interactive)
  (easy-menu-define bxo:listSubMenu
    nil
    "Doc String??" 
    (append
     '("Dynamic Listing Of This Container's BxOs")
     (mapcar (lambda (x)
	       (vector x
		       `(lambda () (interactive)
			  (find-file (expand-file-name (format "~%s/panel/_nodeBase_/fullUsagePanel-en.org" ,x))) t)))
	     (bxosList
	      )))))

;; (bxosList)
(defun  bxosList ()
  ""
  (split-string
   (shell-command-to-string 
    (format "bxoReports.sh list")
    )))

;; Usage These happen in 
;; (bxo:listSubMenuDef)
;; (easy-menu-add-item nil '("Blee") 'bxo:listSubMenu "Blee Help")

(provide 'bxo-list-menu)
