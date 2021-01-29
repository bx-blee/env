;;;
;;; MSDT (Mail Sending, Distributing and Tracking)
;;; Constant Contact For Everyone
;;;
;;; This is a Machine Generated File through: mailingProc.sh vis_basic_method_prep
;;; based on: /libre/ByStar/InitialTemplates/mailing/templates/msend-mailing-template.el
;;;
;;;    ======== bxms-compose-MailingName           -- Originate A Fresh Message -- Or Augment An Existing Message
;;;    ======== bxms-batch-MailingName          -- = bx-msend-MailingName + (msend-mail-and-exit)
;;;    ========
;;;    ======== bxms-web-url-MailingName            -- BROWSER ORIGINATION -- (Send Link)
;;;    ======== bxms-web-mailto-MailingName         -- BROWSER ORIGINATION -- (Click On A mailto: URL)
;;;    ========
;;;    ======== x bxms-compose-MailingName         -- BBDB ORIGINATION  -- Interactive on One or on Each one-by-one
;;;    ======== x bxms-batch-MailingName        -- BBDB ORIGINATION  -- Batch on One or on Each one-by-one
;;;    ======== x bxms-toall-MailingName          -- BBDB ORIGINATION  -- Interactive on ALL
;;;    ========
;;;    ======== bxms-bbdb-compose-MailingName  -- BBDB USAGE        -- Interactive on One
;;;    ======== bxms-bbdb-batch-MailingName    -- BBDB USAGE        -- Batch on One
;;;    ======== bxms-bbdb-toall-MailingName    -- BBDB USAGE        -- Interactive on ALL in To:

;;
;; (msdt:setup:with-filePath "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail")
;; (macroexpand-all (msdt:setup:with-filePath "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail"))


(defmacro msdt:setup:with-filePath (<mailingFilePath)
  "Creates/Defines all commands based on <mailingFilePath"
  `(progn
     (msdt:compose$mailing-defun (expand-file-name (file-name-directory ,<mailingFilePath)))
     (msdt:batch$mailing-defun  (expand-file-name (file-name-directory ,<mailingFilePath)))    
     )
  )


(defun msdt:setup:with-filePath%% (<mailingFilePath)
  "Base function for other msdt:setup:s map to this"
  (interactive)
  (let (
	($mailingPath22 (expand-file-name (file-name-directory <mailingFilePath)))
	)
    (message $mailingPath22)
    (msdt:compose$mailing-defun $mailingPath22)
    ;; (msdt:batch$mailing-defun $mailingPath)
    ;; (msdt:bbdb-compose$mailing-defun $mailingPath)
    ;; (msdt:bbdb-batch$mailing-defun $mailingPath)
    ;; (msdt:bbdb-toall$mailing-defun $mailingPath)
    ;; (msdt:bbdb-compose$mailing-defun $mailingPath)
    ;; (msdt:bbdb:compose$mailing-defun $mailingPath)
    ;; (msdt:bbdb:toall$mailing-defun $mailingPath)
    ;; (msdt:bbdb:batch$mailing-defun $mailingPath)
    ;; (msdt:web:mailto-pre$mailing-defun $mailingPath)
    ;; (msdt:web:mailto-post$mailing-defun $mailingPath)
    ;; (msdt:web:mailto$mailing-defun $mailingPath)  
    )
  )

;; (macroexpand-all '(msdt:setup$with-curBuffer))
;;
;; Example  "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail"
(defmacro msdt:setup$with-curBuffer ()
  "interactive P is necessary.
gensym did not work, ended up using msdt:cur:buffer which works but is obviously not the right way.
NOTYET, we need a wrapper around msdt:setup/with-curBuffer.
"
  `(fset (intern "msdt:setup/with-curBuffer")
	 (lambda (params)
	   (interactive "p")
	   (setq msdt:cur:buffer (buffer-file-name))
	   (msdt:compose$mailing-defun (expand-file-name (file-name-directory msdt:cur:buffer)))
  	   (msdt:batch$mailing-defun (expand-file-name (file-name-directory msdt:cur:buffer)))
	   )
	 )
  )


(msdt:setup$with-curBuffer)
 
;; Example  "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail"
(defun msdt:setup/with-curBuffer%% ()
  ""
  (interactive)
  (let* (
	 ($mailingFilePath (buffer-file-name))
	 ($mailingPath (expand-file-name (file-name-directory $mailingFilePath)))	 
	)
    (when $mailingFilePath
      (msdt:compose$mailing-defun (eval '$mailingPath))
      )
    (when (not $mailingFilePath)
      (message "Buffer Does Not Have A File -- Skipped")
      )
    )
  )


(defun msdt:bbdb:actions-placeHolder% (mailingName)
  "This is a place holder for now, to be sorted out later."
  (setq bbdb-action-alist 
	(append 
	 bbdb-action-alist
	 '(("bxms-compose-start-family.fa-blank-basicText.fa" 
	    ;;
	    (setq bbdb-action-hook nil)
	    (add-hook 'bbdb-action-hook 'bxms:bbdb:compose:start-family.fa-blank-basicText.fa)
	    ))))


  (setq bbdb-action-alist 
	(append 
	 bbdb-action-alist
	 '(("bxms-toall-start-family.fa-blank-basicText.fa" 
	    ;;
	    (setq bbdb-action-hook nil)
	    (add-hook 'bbdb-action-hook 'bxms:bbdb:toall:start-family.fa-blank-basicText.fa)
	    ))))

  (setq bbdb-action-alist 
	(append 
	 bbdb-action-alist
	 '(("bxms-batch-start-family.fa-blank-basicText.fa" 
	    ;;
	    (setq bbdb-action-hook nil)
	    (add-hook 'bbdb-action-hook 'bxms:bbdb:batch:start-family.fa-blank-basicText.fa)
	    ))))
  )



;; (msdt:mailing|get-name "~/BUE/mailings/start/family.fa/blank/basicText.fa")

(defun msdt:mailing|get-name%% (mailingPath)
  (fv:read-as-string (concat mailingPath "/mailingName"))
  )

(defun msdt:mailing|get-name%%% (<mailingPath)
  (let (
	($mailingFilePath (concat <mailingPath "/content.mail"))
	)
    (bx:mail:header:field:get-from-file 'x-mailingname $mailingFilePath)
    )
  )

;;
;; (msdt:mailing|get-name "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail")
;;
(defun msdt:mailing|get-name (<mailingFilePath)
  "Return the value of x-mailingname field of header. x-mailingname should be all lower case."
  (save-excursion
    (bx:mail:header:field:get-from-file 'x-mailingname <mailingFilePath)
    ))

;;
;; (msdt:compose$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail")
;; (macroexpand-all (msdt:compose$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail"))
;;
(defmacro msdt:compose$mailing-defun (<mailingFilePath)
  "The macro defines a function to be invoked to compose a message from a template

<mailingPath is expected to be a static path.
interactive p is needed so that there are some params.
"
  ;;
  ;; Equivalent of (defun ,fullFuncName (params)
  ;;
  `(fset (intern (concat "msdt:compose/" (msdt:mailing|get-name ,<mailingFilePath)))
	     (lambda (params)
	       (interactive "p")
	       (bxms-compose-from-base (expand-file-name (file-name-directory ,<mailingFilePath)) params)
	       )
	     )
  )

;;
;; (macroexpand-all (bx:lcnt:org-dblock-defun ":bx:dblock:lcnt:latex-section" "section" 1))
;; (org-dblock-write:bx:dblock:lcnt:latex-section "example")
;;

;; (setq bx:tt "~/BUE/mailings/start/family.fa/blank/basicText.fa/")

;; (message bx:tt)
;; (msdt:compose$mailing-defun bx:tt)
;; (macroexpand-all (msdt:compose$mailing-defun%% "~/BUE/mailings/start/family.fa/blank/basicText.fa/"))
;;
(defmacro msdt:compose$mailing-defun%% (<mailingPath)
  "The macro defines a function to be invoked to compose a message from a template"
  ;;
  ;; Equivalent of (defun ,fullFuncName (params)
  ;;
  (let (
	(g (gensym))
	)
  `(fset (intern (concat "msdt:compose/" (msdt:mailing|get-name ,<mailingPath)))
	 (lambda (params)
	   (interactive "p")
	   (let ((,g ,<mailingPath))
	     (bxms-compose-from-base ,g params)
	     )))
  ))


;;
;; (msdt:batch$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa")
;; (macroexpand-all (msdt:batch$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa"))
;;
(defmacro msdt:batch$mailing-defun (<mailingPath)
  "The macro defines a function to be invoked to batch send a message based on a template"
  (let (
	($mailingPath (gensym))
	)
    `(fset (intern (concat "msdt:batch/"  (msdt:mailing|get-name ,<mailingPath)))
	   (lambda (params)
	     (interactive "p")
	     (let* (
		    (,$mailingPath ,<mailingPath)
		    )
	       (funcall (intern (concat "msdt:compose/" (msdt:mailing|get-name ,<mailingPath))) params)
	       (msend-mail-and-exit)
	       )))
    ))

;;
;; (msdt:batch$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa")
;; (macroexpand-all (msdt:batch$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa"))
;;
(defmacro msdt:batch$mailing-defun%% (<mailingPath)
  "The macro defines a function to be invoked to batch send a message based on a template"
  (let* (
	($baseFuncName "msdt:batch/")
	($mailingName (msdt:mailing|get-name <mailingPath))
	($fullFuncName (concat $baseFuncName $mailingName))	
	($composeFuncName (concat "msdt:compose/" $mailingName))
	($composeFuncSymb (intern $composeFuncName))
	)
    ;;;
    ;;; Equivalent of (defun ,fullFuncName (params)
    ;;;
    `(fset (intern ,$fullFuncName)
	   (lambda (params)
	     (interactive "p")
	     (,$composeFuncSymb params)
	     (msend-mail-and-exit)	     
	     ))
    ))

;;
;; (msdt:bbdb-compose$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa")
;; (macroexpand-all (msdt:bbdb-compose$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa"))
;;
(defmacro msdt:bbdb-compose$mailing-defun (<mailingPath)
  "The macro defines a function to be invoked to batch send a message based on a template"
  (let* (
	($baseFuncName "msdt:bbdb-compose/")
	($mailingName (msdt:mailing|get-name <mailingPath))
	($fullFuncName (concat $baseFuncName $mailingName))	
	)
    ;;;
    ;;; Equivalent of (defun ,fullFuncName (params)
    ;;;
    `(fset (intern ,$fullFuncName)
	   (lambda (params)
	     (interactive "p")
	     (bx:mailing:bbdb:compose ,<mailingPath params)
	     ))
    ))

;;
;; (msdt:bbdb-batch$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa")
;; (macroexpand-all (msdt:bbdb-batch$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa"))
;;
(defmacro msdt:bbdb-batch$mailing-defun (<mailingPath)
  "The macro defines a function to be invoked to batch send a message based on a template"
  (let* (
	($baseFuncName "msdt:bbdb-batch/")
	($mailingName (msdt:mailing|get-name <mailingPath))
	($fullFuncName (concat $baseFuncName $mailingName))	
	)
    ;;;
    ;;; Equivalent of (defun ,fullFuncName (params)
    ;;;
    `(fset (intern ,$fullFuncName)
	   (lambda (params)
	     (interactive "p")
	     (bx:mailing:bbdb:batch ,<mailingPath params)
	     ))
    ))

;;
;; (msdt:bbdb-toall$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa")
;; (macroexpand-all (msdt:bbdb-toall$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa"))
;;
(defmacro msdt:bbdb-toall$mailing-defun (<mailingPath)
  "The macro defines a function to be invoked to batch send a message based on a template"
  (let* (
	($baseFuncName "msdt:bbdb-toall/")
	($mailingName (msdt:mailing|get-name <mailingPath))
	($fullFuncName (concat $baseFuncName $mailingName))	
	)
    ;;;
    ;;; Equivalent of (defun ,fullFuncName (params)
    ;;;
    `(fset (intern ,$fullFuncName)
	   (lambda (params)
	     (interactive "p")
	     (bx:mailing:bbdb:toall ,<mailingPath params)
	     ))
    ))

;;
;; (msdt:bbdb-compose$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa")
;; (macroexpand-all (msdt:bbdb-compose$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa"))
;;
(defmacro msdt:bbdb-compose$mailing-defun (<mailingPath)
  "The macro defines a function to be invoked to batch send a message based on a template"
  (let* (
	($baseFuncName "msdt:bbdb-compose/")
	($mailingName (msdt:mailing|get-name <mailingPath))
	($fullFuncName (concat $baseFuncName $mailingName))	
	)
    ;;;
    ;;; Equivalent of (defun ,fullFuncName (params)
    ;;;
    `(fset (intern ,$fullFuncName)
	   (lambda (params)
	     (interactive "p")
	     (bx:mailing:bbdb:toall ,<mailingPath params)
	     ))
    ))

;;
;; (msdt:bbdb:compose$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa")
;; (macroexpand-all (msdt:bbdb:compose$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa"))
;;
(defmacro msdt:bbdb:compose$mailing-defun (<mailingPath)
  "The macro defines a function to be invoked to batch send a message based on a template"
  (let* (
	($baseFuncName "msdt:bbdb:compose/")
	($mailingName (msdt:mailing|get-name <mailingPath))
	($fullFuncName (concat $baseFuncName $mailingName))	
	)
    ;;;
    ;;; Equivalent of (defun ,fullFuncName (records)
    ;;;
    `(fset (intern ,$fullFuncName)
	   (lambda (records)
	     (interactive "p")
	     (bxms-bbdb-compose-from-base ,<mailingPath records)
	     ))
    ))

;;
;; (msdt:bbdb:toall$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa")
;; (macroexpand-all (msdt:bbdb:toall$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa"))
;;
(defmacro msdt:bbdb:toall$mailing-defun (<mailingPath)
  "The macro defines a function to be invoked to batch send a message based on a template"
  (let* (
	($baseFuncName "msdt:bbdb:toall/")
	($mailingName (msdt:mailing|get-name <mailingPath))
	($fullFuncName (concat $baseFuncName $mailingName))	
	)
    ;;;
    ;;; Equivalent of (defun ,fullFuncName (records)
    ;;;
    `(fset (intern ,$fullFuncName)
	   (lambda (records)
	     (interactive "p")
	     (bbdb-mall-from-base ,<mailingPath records)
	     ))
    ))

;;
;; (msdt:bbdb:batch$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa")
;; (macroexpand-all (msdt:bbdb:batch$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa"))
;;
(defmacro msdt:bbdb:batch$mailing-defun (<mailingPath)
  "The macro defines a function to be invoked to batch send a message based on a template"
  (let* (
	($baseFuncName "msdt:bbdb:batch/")
	($mailingName (msdt:mailing|get-name <mailingPath))
	($fullFuncName (concat $baseFuncName $mailingName))	
	)
    ;;;
    ;;; Equivalent of (defun ,fullFuncName (records)
    ;;;
    `(fset (intern ,$fullFuncName)
	   (lambda (records)
	     (interactive "p")
	     (bxms-bbdb-batch-from-base ,<mailingPath records)
	     ))
    ))

;;
;; (msdt:web:mailto-pre$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa")
;; (macroexpand-all (msdt:web:mailto-pre$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa"))
;;
(defmacro msdt:web:mailto-pre$mailing-defun (<mailingPath)
  "The macro defines a function to be invoked to batch send a message based on a template"
  (let* (
	($baseFuncName "msdt:web:mailto|")
	($mailingName (msdt:mailing|get-name <mailingPath))
	($fullFuncName (concat $baseFuncName $mailingName "-pre"))	
	)
    ;;;
    ;;; Equivalent of (defun ,fullFuncName (records)
    ;;;
    `(fset (intern ,$fullFuncName)
	   (lambda ()
	     (bx-mmailto-from-base-pre ,<mailingPath)
	     ))
    ))

;;
;; (msdt:web:mailto-post$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa")
;; (macroexpand-all (msdt:web:mailto-post$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa"))
;;
(defmacro msdt:web:mailto-post$mailing-defun (<mailingPath)
  "The macro defines a function to be invoked to batch send a message based on a template"
  (let* (
	($baseFuncName "msdt:web:mailto|")
	($mailingName (msdt:mailing|get-name <mailingPath))
	($fullFuncName (concat $baseFuncName $mailingName "-post"))	
	)
    ;;;
    ;;; Equivalent of (defun ,fullFuncName (records)
    ;;;
    `(fset (intern ,$fullFuncName)
	   (lambda ()
	     (bx-mmailto-from-base-post ,<mailingPath)
	     ))
    ))

;;
;; (msdt:web:mailto$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa")
;; (macroexpand-all (msdt:web:mailto$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa"))
;;
(defmacro msdt:web:mailto$mailing-defun (<mailingPath)
  "The macro defines a function to be invoked to batch send a message based on a template"
  (let* (
	($baseFuncName "msdt:web:mailto|")
	($mailingName (msdt:mailing|get-name <mailingPath))
	($fullFuncName (concat $baseFuncName $mailingName "-post"))	
	)
    ;;;
    ;;; Equivalent of (defun ,fullFuncName (records)
    ;;;
    `(fset (intern ,$fullFuncName)
	   (lambda ()
	     (interactive)

	     (setq  a-murl-pre-hook nil)
	     ;; NOTYET
	     (add-hook 'a-murl-pre-hook 'bxms:web:mailto:start-family.fa-blank-basicText.fa-pre)

	     (setq  a-murl-post-hook nil)
	     (add-hook 'a-murl-post-hook 'bxms:web:mailto:start-family.fa-blank-basicText.fa-post)

	     ))
    ))

;; (defun bxms:web:url:start-family.fa-blank-basicText.fa-pre ()
;;   ""
;;   (bx-murl-from-base-pre "~/BUE/mailings/start/family.fa/blank/basicText.fa")
;;   )

;; (defun bxms:web:url:start-family.fa-blank-basicText.fa-post ()
;;   ""
;;   (bx-murl-from-base-post "~/BUE/mailings/start/family.fa/blank/basicText.fa")
;;   )

;; (defun bxms-web-url-start-family.fa-blank-basicText.fa ()
;;   ""
;;   (interactive)

;;   (setq  a-murl-pre-hook nil)
;;   (add-hook 'a-murl-pre-hook 'bxms:web:url:start-family.fa-blank-basicText.fa-pre)

;;   (setq  a-murl-post-hook nil)
;;   (add-hook 'a-murl-post-hook 'bxms:web:url:start-family.fa-blank-basicText.fa-post)
;;   )


