;;;-*- mode: Emacs-Lisp; lexical-binding: t ; -*-
;;;
;;;

(lambda () "
* Module Name: bcf-misc
* Authors: Mohsen Banan
** Mohsen Banan contact: http://mohsen.1.banan.byname.net/contact
** Mohsen Banan email: emacs آت mohsen.1.banan.byname.net
* Copying And Usage: This is a Libre-Halaal polyexistential (software).
** See: [[http://www.halaalsoftware.org/][Libre-Halaal Software]]
** See: [[http://mohsen.1.banan.byname.net/PLPC/120033][Nature Of Polyexistentials]]
* A Blee Derivative: A part of Blee which can be used outside of Blee
** About Blee: ByStar Libre-Halaal Emacs Environment
")

(lambda () "
* Module Overview:   -- Misc bcf (Blee Common Facilities) using bcf: name space
* Initial Release Date: [2021-02-09 Tue 22:32]
* Current Release: ver-0.2 -- 
* Style and Conventions: Blee derivative style.
* Scope: Facilities, used in Blee which are general enough not to justify bcf: prefix.
* Features:
** get-arg (same as plist-get-or-default) facilitates named arguments processing
")



;; (bcf:var/localized 'org-roam-directory)
(defun bcf:var/localized (<varName)
  "Return the value of <varName. Buffer or directory local vars are accounted for."
  (let (($varValue))
    (save-excursion
      (set-buffer (current-buffer))
      (setq $varValue (eval <varName))
      )
    $varValue
    ))


(provide 'bcf-misc)

