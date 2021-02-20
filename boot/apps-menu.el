;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-


(lambda () "
* Description And Design
**
** This Information should be moved to a BleePanel and blee manual etc.
**
** Global Minor Modes Plus modes:
**
**
")

(orgCmntBegin "
** TODO NOTYET, absorb orgCmntBegin in the right place.
   SCHEDULED: <2021-02-17 Wed>
" orgCmntEnd)

(lambda () "

Next Steps
Capture this in a function.

Also, consider

(featurep 'org-roam)

(if org-roam-mode
    (message \"Enabled\")
  (message \"Disabled\"))

Add engine/primary engine/secondary
Add C-c s 1 for primary 2 and 3.
C-c s 0 is list subject to words for globish.
C-c s 9 is list subject to words for secondary language.

")

(require 'easymenu)


(require 'apps-calc-menu)
(require 'apps-calendar-menu)
(require 'apps-bbdb-menu)

;; (apps:menu-bar|install)
(defun apps:menu-bar|install ()
  "Primary interface."
  (apps:menu:global|define)

  (add-hook 'menu-bar-update-hook 'apps:menu-bar|update-hook)
  )


(defun apps:menu-bar|update-hook ()
  "This is to be added to menu-bar-update-hook.
It runs everytime any menu is invoked.
As such what happens below is exactly what is necessary and no more."

  (apps:menu:global|define)
  )

;;
;; (popup-menu (symbol-value (apps:menu:global|define)))
;; (apps:menu:global|define)
(defun apps:menu:global|define ()
  "Top level menu for all things global minor mode related."
  (let (($thisFuncName (compile-time-function-name)))
    (easy-menu-define
      apps:menu:global
      global-map
      "Global Apps Menu"
      `("Apps"
	:help "Global Apps Menu"
	,(s-- 3)
	,(s-- 4)
	,(s-- 5)
	,(s-- 6)
	,(s-- 7)
	,(s-- 8)
	))

    (apps:calc:menu:plugin|install
     apps:menu:global (s-- 3))

    (apps:calendar:menu:plugin|install
     apps:menu:global (s-- 4))

    (apps:bbdb:menu:plugin|install
     apps:menu:global (s-- 4))
    
  ))

(provide 'apps-menu)
