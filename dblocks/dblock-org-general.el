
(defun org-dblock-write:bx:dblock:org:parameters (params)
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
  
