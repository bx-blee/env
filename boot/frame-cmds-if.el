;;;
;;;

(require 'frame-cmds)

(lambda () "
* frame-cmds-if is layered on top of frame-cmds to provide menu and keybindings.
")

(lambda () "
* Variables
")

(defvar menu-bar-frames-menu (make-sparse-keymap "Frames"))

(lambda () "
* Menus
")


;;; 
(defun menu-bar-frames-define ()
  "Assemble the Frame menu"
  
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

(lambda () "
* Keyboard Bindings
")

;;; 
(defun frames:keyboard|map ()
  "Key Bindings For Frame Commands"

  ;;  Suggested key bindings:
  ;;
  
  (global-set-key [(meta up)]                    'move-frame-up)
  (global-set-key [(meta down)]                  'move-frame-down)
  (global-set-key [(meta left)]                  'move-frame-left)
  (global-set-key [(meta right)]                 'move-frame-right)
  (global-set-key [(meta shift ?v)]              'move-frame-to-screen-top)      ; like `M-v'
  (global-set-key [(control shift ?v)]           'move-frame-to-screen-bottom)   ; like `C-v'
  (global-set-key [(control shift prior)]        'move-frame-to-screen-left)     ; like `C-prior'
  (global-set-key [(control shift next)]         'move-frame-to-screen-right)    ; like `C-next'
  (global-set-key [(control shift home)]         'move-frame-to-screen-top-left)
  (global-set-key [(control meta down)]          'enlarge-frame)
  (global-set-key [(control meta right)]         'enlarge-frame-horizontally)
  (global-set-key [(control meta up)]            'shrink-frame)
  (global-set-key [(control meta left)]          'shrink-frame-horizontally)
  (global-set-key [remap enlarge-window-horizontally] 'enlarge-window-horizontally-repeat)
  (global-set-key [remap shrink-window-horizontally]  'shrink-window-horizontally-repeat)
  (global-set-key [remap enlarge-window]         'enlarge/shrink-window-repeat)
  (global-set-key (kbd "C-M-S-<down>")           'increase-frame-transparency)
  (global-set-key (kbd "C-M-S-<up>")             'decrease-frame-transparency)
  (global-set-key [(control ?x) (control ?z)]    'iconify-everything)
  (global-set-key [vertical-line S-down-mouse-1] 'iconify-everything)
  (global-set-key [(control ?z)]                 'iconify/show-frame)
  (global-set-key [mode-line mouse-3]            'mouse-iconify/show-frame)
  (global-set-key [mode-line C-mouse-3]          'mouse-remove-window)
  (global-set-key [(control meta ?z)]            'show-hide)
  (global-set-key [vertical-line C-down-mouse-1] 'show-hide)
  (global-set-key [C-down-mouse-1]               'mouse-show-hide-mark-unmark)
  (substitute-key-definition 'make-frame-command 'clone-frame   global-map)
  (substitute-key-definition 'delete-window      'remove-window global-map)
  (define-key ctl-x-map "o"                      'other-window-or-frame)
  (define-key ctl-x-4-map "1"                    'delete-other-frames)
  (define-key ctl-x-5-map "h"                    'show-*Help*-buffer)
  (substitute-key-definition 'delete-window      'delete-windows-for global-map)
  (define-key global-map "\C-xt."                'save-frame-config)
  (define-key ctl-x-map "o"                      'other-window-or-frame)

  (defalias 'doremi-prefix (make-sparse-keymap))
  (defvar doremi-map (symbol-function 'doremi-prefix) "Keymap for Do Re Mi commands.")
  (define-key global-map "\C-xt" 'doremi-prefix)
  (define-key doremi-map "." 'save-frame-config)
  )

(frames:keyboard|map)

(menu-bar-frames-define)

(provide 'frame-cmds-if)

