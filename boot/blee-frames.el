;;;
;;;

(require 'blee-doc-howto)   ;;; NOTYET -- un-needed -- remove after cleanup after 

(lambda () "
* TODO Blee Frames Design -- Place Holder
  SCHEDULED: <2020-05-28 Thu>
** 
** This Information should be moved to blee manual etc.
** 
** A Model For Emacs Frames And Linked Application Windows 
*** Native Emacs Frames
*** eXternally Integrated Emacs Frames (XIF)
*** Linked Application Windows 
*** Named Blee Emacs Frames (Listed) <<namedBleeFrames>>
**** Primary Native Emacs Frame
**** Secondary Native Emacs Frame
**** Web-Browser-At-Point Frame
**** Web-Browser-Html-File Frame
**** Web-Browser-Interactive Frame
**** PDF-Viewer-At-Point Frame
**** 
** 
** Blee Named Frames
Availability of a number of emacs frames is assumed. These are called [[namedBleeFrames]]
Creation of windows within these buffers and display of buffers in the named frames is 
part of blee.
*** List of Named Blee Emacs Frames as defvars
*** Initial implementation of Web-Browser-At-Point Frame
*** Raising of named-frames
*** Adoption of frame-fnc.el from both noah friedman and xxx
** 
")


(lambda () "
* Global

")


;; (get-frame-name)
;; (get-a-frame "blee:xia:browser:atpoint")
;; (read-frame "specify frame name:")
;; (flash-ding)

;; (blee:xia:frame:at-point)

;; (progn 
;;   (make-frame-visible
;;    (get-a-frame "blee:xia:browser:atpoint")
;;    )

;;   (raise-frame
;;    (get-a-frame "blee:xia:browser:atpoint")
;;    )
;;   )

;; (select-frame-set-input-focus (get-a-frame "blee:xia:browser:atpoint"))

;; (iconify-or-deiconify-frame (get-a-frame "blee:xia:browser:atpoint"))
;; (iconify-frame (get-a-frame "blee:xia:browser:atpoint"))

;; (frame-visible-p (get-a-frame "blee:xia:browser:atpoint"))


(lambda () "
* Constants 
")


(defconst blee:frame:name@primary "Blee Primary"
  "Name of Blee primary frame.")

(defconst blee:frame:name@secondary "Blee Secondary"
  "Name of Blee secondary frame.")

(defconst blee:frame:name:xif:web-browser:at-point@bxde "Blee XIF Web-Browser-At-Point BXDE"
  "Name of Blee eXternally Integrated Emacs (XIF) frame for Web-Browser-At-Point.")

(defconst blee:frame:name:xif:web-browser:at-point@news "Blee XIF Web-Browser-At-Point News"
  "Name of Blee eXternally Integrated Emacs (XIF) frame for Web-Browser-At-Point.")

(defconst blee:frame:name:xif:web-browser:at-point@default "Blee XIF Web-Browser-At-Point Default"
  "Name of Blee eXternally Integrated Emacs (XIF) frame for Web-Browser-At-Point.")

(defconst blee:frame:name:xif:web-browser-html-file "Blee XIF Web-Browser-Html-File"
  "Name of Blee eXternally Integrated Emacs (XIF) frame for Web-Browser-Html-File.")

(defconst blee:frame:name:xif:web-browser-interactive "Blee XIF Web-Browser-Interactive"
  "Name of Blee eXternally Integrated Emacs (XIF) frame for Web-Browser-Interactive.")

(defconst blee:frame:name:xif:pdf-viewer-at-point "Blee XIF PDF-Viewer-At-Point"
  "Name of Blee eXternally Integrated Emacs (XIF) frame for PDF-Viewer-At-Point.")


(lambda () "
* Variables
")


(defvar lee:frame:name:xif:web-browser:at-point "Blee Primary"
  "Name of Blee primary frame.")




(defun blee:xia:frame|at-point ()
  "Create a frame for web-browser"
  (let (
	($name blee:frame:name:xif:web-browser-at-point)
	)
    (make-frame `((name                 . ,$name)
                  (icon-name            . ,$name)
                  (title                . "some Title")
                  (menu-bar-lines       . 1)
                  (tool-bar-lines       . 3)
                  (vertical-scroll-bars . t)
		  )
		)
    ))

;; (frame-visible-p (get-a-frame blee:frame:name:xif:web-browser-at-point))

;;;
;;; (blee:xif:browse-url/at-point "http://www.neda.com")
;;; (blee:xif:browse-url/at-point "https://google.com")
;;;
(defun blee:xif:browse-url/at-point (url &rest args)
  "Based on configuration parameters, decide which blee:browse-url functionality should be chosen
I
n Blee, you should assume (setq browse-url-browser-function 'blee:browse-url/dispatch)"
  (interactive)
  (let* (
	 ($originalFrame (selected-frame))	 
	 ($browserFrame (get-a-frame blee:frame:name:xif:web-browser-at-point))
	 )
    (when (not $browserFrame)
      (setq $browserFrame (blee:xia:frame|at-point))
      )

    ;;(save-window-excursion        
    
    (select-frame-set-input-focus $browserFrame)
    (eaf-open-browser url t)
    (select-frame-set-input-focus $browserFrame)       
    ;;(make-frame (list '(height . 50) '(width . 105) ))
    ;;)
    ))


(defvar menu-bar-frames-menu (make-sparse-keymap "Frames"))


;;; (menu-bar-frames-define)
(defun menu-bar-frames-define ()
  (define-key global-map [menu-bar frames]
    (cons "Frames" menu-bar-frames-menu))
  (define-key menu-bar-frames-menu [set-all-params-from-frame]
    '(menu-item "Set All Frame Parameters from Frame" set-all-frame-alist-parameters-from-frame
      :help "Set frame parameters of a frame to their current values in frame"))
  (define-key menu-bar-frames-menu [set-params-from-frame]
    '(menu-item "Set Frame Parameter from Frame..." set-frame-alist-parameter-from-frame
      :help "Set parameter of a frame alist to its current value in frame"))
  (define-key menu-bar-frames-menu [separator-frame-1] '("--"))
  (define-key menu-bar-frames-menu [tile-frames-vertically]
    '(menu-item "Tile Frames Vertically..." tile-frames-vertically
      :help "Tile all visible frames vertically"))
  (define-key menu-bar-frames-menu [tile-frames-horizontally]
    '(menu-item "Tile Frames Horizontally..." tile-frames-horizontally
      :help "Tile all visible frames horizontally"))
  (define-key menu-bar-frames-menu [separator-frame-2] '("--"))
  (define-key menu-bar-frames-menu [toggle-max-frame-vertically]
    '(menu-item "Toggle Max Frame Vertically" toggle-max-frame-vertically
      :help "Maximize or restore the selected frame vertically"
      :enable (frame-parameter nil 'restore-height)))
  (define-key menu-bar-frames-menu [toggle-max-frame-horizontally]
    '(menu-item "Toggle Max Frame Horizontally" toggle-max-frame-horizontally
      :help "Maximize or restore the selected frame horizontally"
      :enable (frame-parameter nil 'restore-width)))
  (define-key menu-bar-frames-menu [toggle-max-frame]
    '(menu-item "Toggle Max Frame" toggle-max-frame
      :help "Maximize or restore the selected frame (in both directions)"
      :enable (or (frame-parameter nil 'restore-width) (frame-parameter nil 'restore-height))))
  (define-key menu-bar-frames-menu [maximize-frame-vertically]
    '(menu-item "Maximize Frame Vertically" maximize-frame-vertically
      :help "Maximize the selected frame vertically"))
  (define-key menu-bar-frames-menu [maximize-frame-horizontally]
    '(menu-item "Maximize Frame Horizontally" maximize-frame-horizontally
      :help "Maximize the selected frame horizontally"))
  (define-key menu-bar-frames-menu [maximize-frame]
    '(menu-item "Maximize Frame" maximize-frame
      :help "Maximize the selected frame (in both directions)"))
  (define-key menu-bar-frames-menu [separator-frame-3] '("--"))
  (define-key menu-bar-frames-menu [iconify-everything]
    '(menu-item "Iconify All Frames" iconify-everything
      :help "Iconify all frames of session at once"))
  (define-key menu-bar-frames-menu [show-hide]
    '(menu-item "Hide Frames / Show Buffers" show-hide
      :help "Show, if only one frame visible; else hide."))
  )

(provide 'blee-frames)

