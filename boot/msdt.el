;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-

;;;
;;; MCDT (Mail Com, Distributing and Tracking)
;;; Previously MSDT (Mail Sending, Distributing and Tracking)
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

(defvar msdt:compose:ephemera:base "/tmp"
  "Basedir of where ephemera compositions go")



;;
;; (msdt:setup$with-filePath "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail")
;; (macroexpand-all (msdt:setup$with-filePath "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail"))
;;
(defmacro msdt:setup$with-filePath (<mailingFilePath)
  "Creates/Defines all msdt:xx commands based on <mailingFilePath.
Base function for other msdt:setup:s map to this.
Needs to be a macro, so that ,<mailingFilePath is cpatured.
Is expected to be invoked once for each <mailingFilePath.
For use by elisp applications.
"
  `(progn
     (msdt:compose$mailing-defun ,<mailingFilePath)
     (msdt:batch$mailing-defun ,<mailingFilePath)
     )
  )


(defun msdt:setup:with-filePath%% (<mailingFilePath)
  "Place holder to be absrobed."
  (interactive)
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
  
;;
;; (macroexpand-all '(msdt:setup$with-curBuffer))
;;
;; Example  "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail"
;;
(defmacro $:msdt:setup$with-curBuffer ()
  "Creates/Defines all msdt:xx commands based on current buffer file-name.
$: indicates it is private to this module. Is not expected to be invoked by any external user. 
NOTYET, try make-symbol
interactive P is necessary.
gensym did not work, ended up using msdt:cur:buffer which works but is obviously not the right way.
NOTYET, we need a wrapper around msdt:setup/with-curBuffer.
Is not expected to be invoked by any external user. $: indicates it is local to this module.
External user uses msdt:setup/with-curBuffer
"
  `(fset (intern "msdt:setup:gened/with-curBuffer")
	 (lambda (params)
	   (interactive "p")
	   (setq msdt:cur:buffer (buffer-file-name))
	   (msdt:compose$mailing-defun msdt:cur:buffer)
  	   (msdt:batch$mailing-defun  msdt:cur:buffer)
	   )
	 )
  )

($:msdt:setup$with-curBuffer)



;;
;; (msdt:mailing:params/proc-all (msdt:mailing:params/get-from-field))
;;
(defun msdt:mailing:params/proc-all (<params)
  "Creates terse links for navigation surrounding current panel in treeElem."
  (let* (
	 ;;
	 (<extSrc (or (plist-get <params :extSrc) nil))
	 )
    (format "XXX %s" <extSrc)
    )
  )

 
;; Example  "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail"
(defun msdt:setup/with-curBuffer (args)
  ""
  (interactive "p")
  (let* (
	 ($mailingFilePath (buffer-file-name))
	)
    (when $mailingFilePath
      (with-selected-window (frame-selected-window)
	(save-excursion
	  (msdt:setup:gened/with-curBuffer args)
	  ))
      )
    (when (not $mailingFilePath)
      (message "Buffer Does Not Have A File -- Skipped")
      )
    )
  )



;;
;; (msdt:mailing:getName|with-file "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail")
;;
(defun msdt:mailing:getName|with-file (<mailingFilePath)
  "Return the value of x-mailingname field of header of <mailingFilePath.
May be called from within macros with <mailingFilePath and not the mailingBuf being available.
x-mailingname should be all lower case."
  (let* (
	 ($mailingBuf (switch-to-buffer (find-file <mailingFilePath)))
	 ($result)
	 )
    (save-excursion
      (setq $result (msdt:mailing:getName/with-buffer $mailingBuf))
      (kill-buffer $mailingBuf)
      )
    $result
    ))


;;
;; "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail"
;; (msdt:mailing:getName/with-curBuffer)
;;
(defun msdt:mailing:getName/with-buffer (<mailingBuf)
  "Return the value of x-mailingname field of header. x-mailingname should be all lower case."
  (interactive)
  (let* (
	 (result nil)
	)
    (setq result (bx:mail:header:field:get-from-buffer 'x-mailingname <mailingBuf))
    result
    )
  )


(defun msdt:mailing:getName/with-curBuffer%% ()
  "Return the value of x-mailingname field of header. x-mailingname should be all lower case."
  (interactive)
  (let* (
	 ($mailingFilePath (buffer-file-name))
	 (result nil)
	)
    (when $mailingFilePath
      (save-excursion
	(ignore-errors
	  (setq result (bx:mail:header:field:get-from-file 'x-mailingname $mailingFilePath))
	  )
	))
    (when (not $mailingFilePath)
      (message "Buffer Does Not Have A File -- Skipped")
      )
    (message result)
    result
    )
  )

;;
;; (bx:mail:header:field:get-from-buffer 'x-mailingparams (find-file "~/BUE/mailings/start/family.fa/blank/basicLatex.fa/basicLatex/mailingStatic/content.mail"))
;; (message "%s" (msdt:mailing:params|from-buf )
;;
(defun msdt:mailing:params|from-buf (<mailingBuf)
  "Return params as a list based on the string"
  (let* (
	 ($paramsAsStr (bx:mail:header:field:get-from-buffer 'x-mailingparams <mailingBuf))
	 (params (append (list :name 'someName)
			 (read (concat "(" $paramsAsStr ")"))))
	 )
    params))


(defun msdt:mailing:compose|get-function-name (<mailingName)
  "Given <mailingName, return name of compose function"
  (concat "msdt:compose/" <mailingName))

(defun msdt:compose/with-file (<mailingFilePath)
  "Given a mailing file, initiate an outgoing message.
  - visit the file
  - setup  msdt:compose/mailingName if needed
  - invoke msdt:compose/mailingName go to the to field
 "
  (interactive)
  (let (
	($mailingName nil)
	($mailingBuf nil)
	($funcSymbol nil)
	)
    (find-file-read-only-other-frame <mailingFilePath)
    (setq $mailingBuf (current-buffer))
    (setq $mailingName (msdt:mailing:getName/with-buffer $mailingBuf))
    (setq $funcSymbol (intern (msdt:mailing:compose|get-function-name $mailingName)))
    (when (commandp $funcSymbol)
      ;;(switch-to-buffer $mailingBuf)
      (call-interactively $funcSymbol)
      )
    (when (not (commandp $funcSymbol))
      (msdt:setup$with-filePath <mailingFilePath)
      (call-interactively $funcSymbol)
      )
    ;; NOTYET, go to the To field
    )
  )

;;
;; (msdt:compose$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail")
;; (macroexpand-all (msdt:compose$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail"))
;;
(defmacro msdt:compose$mailing-defun (<mailingFilePath)
  "The macro defines a function to be invoked to compose a message from a template

<mailingPath is expected to be a static path.
interactive p is needed so that there are some params.
"
  `(fset (intern (concat "msdt:compose/" (msdt:mailing:getName|with-file ,<mailingFilePath)))
	 (lambda (args)
	   (interactive "p")
	   (msdt:compose|with-file ,<mailingFilePath args)
	   )
	 ))

;;
;; 
;; 
(defun msdt:compose|with-file (<mailingFilePath args)
  "Out of macro work of msdt:compose$mailing-defun.
ModuleLocal."
  (let* (
	 ($mailingBuf (switch-to-buffer (find-file <mailingFilePath)))
	 ($mailingParams (msdt:mailing:params|from-buf $mailingBuf))
	 (<extSrcBase (or (plist-get $mailingParams :extSrcBase) nil))
	 )
    (message "$mailingParams %s" $mailingParams)
    (message "<extSrcBase %s" <extSrcBase)
    (unless <extSrcBase
      (message "22222222222 <extSrcBase %s" <extSrcBase)
      (message "6666  current-buffer %s" (current-buffer))
      (text-mode) ;; bxms-compose-from-base checks for major-mode      
      (bxms-compose-from-base (expand-file-name (file-name-directory <mailingFilePath)) args)
      ;; Setup default-directory of mail buffer to be mailingDirPath
      )
    (when <extSrcBase
      (message "3333 <extSrcBase %s" <extSrcBase)
      (setq $ephemeraMailingFilePath
	    (msdt:compose:ephemera|copyToBase <mailingFilePath <extSrcBase))
      ;;(switch-to-buffer (find-file $ephemeraMailingFilePath))
      (message "4444 $ephemeraMailingFilePath %s" $ephemeraMailingFilePath)
      (message "5555  current-buffer %s" (current-buffer))
      (text-mode) ;; bxms-compose-from-base checks for major-mode
      (bxms-compose-from-base (expand-file-name (file-name-directory $ephemeraMailingFilePath)) args)
      )
    ))

;;
;; (bx:ephemera:dated|pathName-in "/tmp")
;;
(defun bx:ephemera:dated|pathName-in (<baseDir)
  "Return (format-time-string \"%Y-%m-%d-%H-%M-%S\") plus a counter.
If that date to a second exists, do a plus counter.
NOTYET, counter has not been implemented yet."
  (let* (
	 ($ephemeraUniqe (format-time-string "%Y-%m-%d-%H-%M-%S"))
	 ($result (f-join <baseDir $ephemeraUniqe))
	 )
    $result))

;;
;; (msdt:compose:ephemera|copyToBase "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail" ".")
;; 
(defun msdt:compose:ephemera|copyToBase (<mailingFilePath <extSrcBase)
  "Copy recursively <extSrcBase to msdt:compose:ephemera:base.
"
  (let* (
	 ($mailingBaseDir (expand-file-name (file-name-directory <mailingFilePath)))
	 ($srcBase (f-join $mailingBaseDir <extSrcBase))
	 ($destBase (bx:ephemera:dated|pathName-in msdt:compose:ephemera:base))
	 ($mailingRelativeToExtSrcBase (f-relative <mailingFilePath $srcBase))
	 ($ephemeraMailingFilePath (f-join $destBase $mailingRelativeToExtSrcBase))
	 ($shellCmndResult)
	 )
    (setq $shellCmndResult
	  (shell-command-to-string 
	   (format "cp -r %s %s" $srcBase $destBase)))
    (message $shellCmndResult)
    $ephemeraMailingFilePath
    ))

  
;;
;; (msdt:batch$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail")
;; (macroexpand-all (msdt:batch$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa/content.mail"))
;;
(defmacro msdt:batch$mailing-defun (<mailingFilePath)
  "The macro defines a function to be invoked to batch send a message based on a template
NOTYET, instead of fset intern, try defun -- would be simpler."
  `(fset (intern (concat "msdt:batch/"  (msdt:mailing:getName|with-file ,<mailingFilePath)))
	 (lambda (args)
	   (interactive "p")
	   ($:msdt:batch|with-file ,<mailingFilePath args)
	   )
	 ))

(defun $:msdt:batch|with-file (<mailingFilePath args)
  "Out of macro work of msdt:batch$mailing-defun.
ModuleLocal."
  (let* (
	 ($mailingPath <mailingFilePath)
       )
    (funcall (intern (concat "msdt:compose/" (msdt:mailing:getName|with-file <mailingFilePath))) args)
    (msend-mail-and-exit)
    ))

;;
;; (msdt:batch$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa")
;; (macroexpand-all (msdt:batch$mailing-defun "~/BUE/mailings/start/family.fa/blank/basicText.fa"))
;;
(defmacro msdt:batch$mailing-defun%% (<mailingPath)
  "The macro defines a function to be invoked to batch send a message based on a template"
  (let* (
	($baseFuncName "msdt:batch/")
	($mailingName (msdt:mailing:getName|with-file <mailingPath))
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
	($mailingName (msdt:mailing:getName|with-file <mailingPath))
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
	($mailingName (msdt:mailing:getName|with-file <mailingPath))
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
	($mailingName (msdt:mailing:getName|with-file <mailingPath))
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
	($mailingName (msdt:mailing:getName|with-file <mailingPath))
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
	($mailingName (msdt:mailing:getName|with-file <mailingPath))
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
	($mailingName (msdt:mailing:getName|with-file <mailingPath))
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
	($mailingName (msdt:mailing:getName|with-file <mailingPath))
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
	($mailingName (msdt:mailing:getName|with-file <mailingPath))
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
	($mailingName (msdt:mailing:getName|with-file <mailingPath))
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
	($mailingName (msdt:mailing:getName|with-file <mailingPath))
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

(provide 'msdt)
