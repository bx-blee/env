
;;;#+BEGIN: bx:org-mode:startHere :governor "enabled" :
%%% Args: :class "book|pres+art" :langs "en+fa" :toggle "enabled|disabled|hide"  :bibProvider "biblatex|bibtex" :style "plain"
\begin{comment}
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]]  /DBLOCK: print-bibliography --- governor=enabled  bibSrcPaths=/lcnt/BIB/plpcUrl,/lcnt/BIB/rfcs,/lcnt/BIB/bxsup/  == ::  [[elisp:(org-cycle)][| ]]
\end{comment}(lambda () "
* /->/ [[elisp:(describe-function 'org-dblock-write:bx:org-mode:startHere)][(dblock-func]]

Some Stuff
* /<-/ ) E|")
;;;#+END:



(defun org-dblock-write:bx:org-mode:startHere  (@params)
  " Example for pure Blee org-mode dblocks.
Following Features and parameters are expected.

With :governor as:
 - help     :: You get a list of parameters and their expected values
 - enabled  :: Full actual action and produces full informative commented output
 - disbaled :: No actual action, but produces full informative commented output
 - hide     :: No moded notes, The disbaled
 - silent   :: Only actual action -- No informative commented output
 - gov-ext  :: Governed Externally by gov-ext

With :gov-ext as:  (External Governor)
 - A function name
 - A path to a file
 - na -- when :governor is not gov-ext 

With :gen-style as:  (General Souroundings Style Parameter)
 - default   :: same as normal  
 - cascaded  :: /-</ /->/
 - terseEnd  :: /-</ )
 - normal    :: /-</ funcName )
 - quiet     :: No open and no close
"
  (let (
	(@toggle (or (plist-get @params :toggle) nil))       ;; For backwards compatibility -- replaced by governor
	(@governor (or (plist-get @params :governor) "enabled")) ;; Controls general behaviour
	(@ext-gov (or (plist-get @params :gov-ext) "na")) ;; Controls general behaviour
	(@gen-style (or (plist-get @params :gen-style) "default")) ;; Controls general souroundings style	
	;;
	(@exampleOfExtraParams (or (plist-get
			   @params
			   :bibSrcPaths)
			  "/lcnt/BIB/plpcUrl,/lcnt/BIB/rfcs,/lcnt/BIB/bxsup"
			  ))
	
	;;
	($atLeastOnceWhen nil)
	)

    (when @toggle (setq @governor @toggle))
    ;;;(setq @toggle @governor)

    (blee:dblock:params:desc
     'latex-mode
     ":class \"book|pres+art\" :langs \"en+fa\" :toggle \"enabled|disabled|hide\"  :bibProvider \"biblatex|bibtex\" :style \"plain\""
     )
    
    (when (not (string= @governor "hide"))
      (org-latex-node-insert-note
       :label (format "DBLOCK:")
       :name (format
	      "print-bibliography --- governor=%s  bibSrcPaths=%s"
	      @governor
	      @exampleOfExtraParams
	      )
       :level 1
       :comment (format "")
       )
      )

    (when (string= @governor "hide")
      (setq @governor "disabled")
      )

    (when (string= @governor "enabled")

      (bx:dblock:global:moded:insert-begin major-mode)

      (bx:dblock:org-mode:func-open (compile-time-function-name))

      (insert "\nSome Stuff\n")

      (bx:dblock:org-mode:func-close
       (compile-time-function-name)
       :style "terse"
       )
	  
      (bx:dblock:global:moded:insert-end major-mode)
      )
    )
  )
	      
