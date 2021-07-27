;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(require 'easymenu)

;; (apps:magit:menu:plugin|install modes:menu:global (s-- 6))
(defun apps:magit:menu:plugin|install (<menuLabel <menuDelimiter)
  "Adds this as a submenu to menu labeled <menuLabel at specified delimited <menuDelimiter."

  (easy-menu-add-item
   <menuLabel
   nil
   (apps:magit:menu|define :active t)
   <menuDelimiter
   )

  (add-hook 'menu-bar-update-hook 'apps:magit:menu|update-hook)
  )

(defun apps:magit:menu|update-hook ()
  "This is to be added to menu-bar-update-hook.
It runs everytime any menu is invoked.
As such what happens below should be exactly what is necessary and no more."
  ;;(modes:menu:global|define)
  )

;;
;; (apps:magit:menu|define :active nil)
;; (popup-menu (symbol-value (apps:magit:menu|define)))
;;
(defun apps:magit:menu|define (&rest <namedArgs)
  "Returns apps:magit:menu.
:active can be specified as <namedArgs.
"
  (let (
	(<active (get-arg <namedArgs :active t))
	($thisFuncName (compile-time-function-name))
	)

    (easy-menu-define
      apps:magit:menu
      nil
      (format "MAGIT Menu")
      `(
	,(format "MAGIT Menu")
	:help "MAGIT Menu"
	:active ,<active
	:visible t
	,(s-- 3)
	,(s-- 4)
	,(s-- 5)
	,(s-- 6)
	,(s-- 7)
	,(s-- 8)
	))

    (easy-menu-add-item
     apps:magit:menu nil
     (apps:magit:menuItem:magit:status|define)
     (s-- 3))

    (easy-menu-add-item
     apps:magit:menu nil
     (apps:magit:menuItem:magit:bpo-repos|define)
     (s-- 4))

    (easy-menu-add-item
     apps:magit:menu nil
     (apps:magit:menuItem:magit:repolist-status|define)
     (s-- 4))
    
    ;; (easy-menu-add-item
    ;;  apps:magit:menu nil
    ;;  (apps:magit:menuItem:describe|define)
    ;;  (s-- 6))

    'apps:magit:menu
    ))



(defun apps:magit:menuItem:magit:status|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Magit Status")
      (magit-status)
      :help "Magit Status"
      :active t
      :visible t
      ]
     )))

(defun apps:magit:menuItem:magit:bpo-repos|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Magit BPO Repos")
      (bap:magit:bpo-repos/visit)
      :help "Magit BPO Repos"
      :active t
      :visible t
      ]
     )))

(defun apps:magit:menuItem:magit:repolist-status|define ()
  "Returns a menuItem vector."
  (car
   `(
     [,(format "Magit Repo List Status")
      (magit-repolist-status)
      :help "Magit Repo List Status"
      :active t
      :visible t
      ]
     )))

(defun apps:magit:menuItem:describe|define ()
  "Returns a menuItem vector."
  (car
   `(
     [
      "On-Line Help"
      (find-file-at-point "https://www.gnu.org/software/emacs/manual/html_node/calc/index.html")
      :help "On-Line Help -- (visit web info)"
      :active t
      :visible t
      ]
     )))

(provide 'apps-magit-menu)
