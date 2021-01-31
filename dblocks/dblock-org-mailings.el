(require 'bx-lcnt-lib)
(require 'dblock-governor)
(load "time-stamp")


(advice-add 'org-dblock-write:bxPanel:mailing|start :around #'bx:dblock:control|wrapper)
(defun org-dblock-write:bxPanel:mailing|start  (<params)
  "Creates terse links for navigation surrounding current panel in treeElem."
  (let* (
	 (<governor (letGet$governor)) (<extGov (letGet$extGov))
	 (<outLevel (letGet$outLevel 1)) (<model (letGet$model))
	 (<style (letGet$style "openTerseNoNl" "closeContinue"))
	 ;;
	 (<mailingFile (or (plist-get <params :mailingFile) "auto"))
	 )

    (bxPanel:params$effective)	 

    (defun helpLine ()
      ":bxoId \"auto or bxoId\""
      )

    (defun bodyContentPlus ()
      ;;(bxPanel:lineDeliminator|top <realm)      
      )

    (defun bodyContent ()
      "If there is user data, insert it."
      (let* (
	     ($extensionFileName)
	     ($mailingName)
	     )
	(setq $mailingName (msdt:mailing:getName|with-file <mailingFile))
	(insert (format "    [[elisp:(msdt:compose/with-file \"%s\")][%s]]    " <mailingFile $mailingName))
	(insert (format "    [[file:%s][Visit MailingFile]]    " <mailingFile))
	)
      )
    
    (bx:invoke:withStdArgs$bx:dblock:governor:process)    
    ))


;;;#+BEGIN: bx:dblock:lisp:provide :disabledP "false" :lib-name "dblock-org-mailings"
(lambda () "
*  [[elisp:(org-cycle)][| ]]  Provide                     :: Provide [[elisp:(org-cycle)][| ]]
")

(provide 'dblock-org-mailings)
;;;#+END:
