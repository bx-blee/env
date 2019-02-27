
(require 'bx-lcnt-lib)

;;;
;;;  Layered as:
;;;   run-result-stdout             :command
;;;



(defun org-dblock-write:bx:dblock:global:run-result-stdout (params)
  (let ((bx:command (or (plist-get params :command) ""))
	)
    (insert
      (shell-command-to-string 
       (format "%s 2> /dev/null"  bx:command))
     )
    ))

(defun org-dblock-write:bx:dblock:global:run-result (params)
  (let ((bx:command (or (plist-get params :command) ""))
	)
    (insert
      (shell-command-to-string 
       (format "%s"  bx:command))
     )
    ))


