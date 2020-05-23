;;;
;;;

(require 'easymenu)

(require 'blee-doc-howto)

;;;
;;; Global Blee Menu
;;;


;; (blee:menu:top|xia)
(defun blee:menu:top|xia ()
  (easy-menu-define
    blee-menu-global
    global-map
    "Global XIA Menu"
    '("XIA"
      ["Blee Top Activities Panel" bx:bnsm:top:panel-blee t]
      "---"
      ("XIA Help"
       ["Help: Blee Overview" blee:blee:menu:overview-help t]
       )      
      ))

      ;; bx-visibility-menu.el
      (require 'bx-visibility-menu)
      (bx:visibility:global-menu)
      (easy-menu-add-item nil '("XIA") 'bx:visibility:menu "XIA Help")

      ;; bystar-browser-menu.el
      (require 'bystar-browser-menu)
      (bystar:browser:menu:define)
      (easy-menu-add-item nil '("XIA") 'bystar:browser:menu:definition "XIA Help")
      )



(provide 'blee-menu-xia)

