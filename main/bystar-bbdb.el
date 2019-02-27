;;; -*- Mode: Emacs-Lisp -*-


(message "ByStar BBDB LOADING ...")


(require 'bystar-bbdb-lib)

(setq bbdb-file "~/.bbdbV6")
(load "bbdb-append-fix")

(if (file-directory-p (expand-file-name "~/lisp/bbdb-ext-20130513.1152"))
    (setq load-path (cons (expand-file-name "~/lisp/bbdb-ext-20130513.1152")
		      load-path)))

(require 'bbdb-ext)
;;(add-hook 'bbdb-mode-hook 'bbdb-ext-hook)
(bbdb-ext-hook)
