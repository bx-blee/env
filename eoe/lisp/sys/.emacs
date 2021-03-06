;;; -*- Mode: Emacs-Lisp; -*-
;;; RCS: $Id: .emacs,v 1.1 2007-02-24 04:08:07 mohsen Exp $
;;;
;;; Local Variables: ***
;;; mode:lisp ***
;;; comment-column:0 ***
;;; comment-start: ";;; "  ***
;;; comment-end:"***" ***
;;; End: ***
;;; -----------------------------------------------------------------
;;; EOE - Emacs Office Environment Start Up
;;; -----------------------------------------------------------------
;;;
;;; The standard emacs init file for EOE users.
;;;
;;; THIS FILE DOES ONLY THE FOLLOWING THINGS:
;;; 0. Site determination.  Set the value of a well-known, global 
;;;    variable *eoe-site-name*.
;;; 1. Modifies the emacs load-path to include the EOE directories.
;;; 2. Determines the version of emacs being run, and sets the value 
;;;    of *eoe-emacs-type*.
;;; 3. Loads the EOE site-wide, run-time initialization library 
;;;    "default-eoe".
;;; 4. Loads the user's EOE user-parameters file if present, or else
;;;    the system's default. (.eoe)
;;; 5. Loads the EOE user's emacs init file, if found or else the
;;;    system's default. { .emacs18f | .emacs19f | .emacs19x }
;;;
;;; NO ADDITIONAL CODE FOR OTHER PURPOSES SHOULD BE PUT INTO THIS FILE.
;;; Any EOE site-specific startup code belongs in library default-eoe.el
;;; Any user-specific startup code belongs in the EOE user's emacs init file.
;;;
;;; -----------------------------------------------------------------
;;; SOME BACKGROUND:
;;; We use:
;;;    * this standard ~/.emacs file
;;;    * default-eoe.el library
;;;    * ~/emacs-usr.el file (emacs 18); ~/xemacs-usr.el file (xemacs)
;;;
;;; to provide a superset of the functionality that is provided by:
;;;    * site-init.el library (that is sourced once at emacs build time)
;;;    * ~/.emacs file
;;;    * default.el library
;;;
;;; In particular, this makes EOE easy to install at a new site since
;;; the startup files are effectively EOE controlled.  EOE disables
;;; loading of the default.el library (although the EOE user can
;;; override this).
;;; -----------------------------------------------------------------

(setq debug-on-error t) ; to simplify debugging EOE startup, may want
                        ; remove when done debugging.  This is turned
                        ; off at the end of this file just before loading
                        ; the user's eoe init file.

;; temporarily bump up gc-cons-threshold
(setq gc-cons-threshold (* gc-cons-threshold 10))

;;; -----------------------------------------------------------------
;;; Site Determination
;;; -----------------------------------------------------------------

;;
;; set the *eoe-site-name* variable below e.g., "neda.com"
;;
(defvar *eoe-site-name* "neda.com"	; <== EOE CUSTOMIZATION NEEDED HERE ***
  "The name string for the current site.")

(defun guess-site-name ()
  "Guess the current site, returning a string or nil if cannot guess."
  (let ((sn nil)
	(domainname-command "/bin/domainname"))
    (cond ((file-exists-p domainname-command)
	   ;; compute site name from domain name
	   (let ((result-buffer (get-buffer-create " *Guess Site Name*")))
	     (set-buffer result-buffer)
	     (kill-region (point-min) (point-max))
	     (call-process domainname-command nil result-buffer nil)
	     (setq sn (buffer-substring (point-min) (- (point-max) 1)))
	     (kill-buffer result-buffer)
	     ))
	  (t
	   ;; place holder for some other heuristic here
	   ))
    sn))

(cond ((or (null *eoe-site-name*)
	   (string= "" *eoe-site-name*))
       (ding)
       (message "EOE improperly set up--site name unspecified.  Guessing ...")
       (sleep-for 3)
       (cond ((setq *eoe-site-name* (guess-site-name))
	      (message "assuming %s" *eoe-site-name*)
	      (sleep-for 2))
	     (t
	      (error "Failed!  Check .emacs file."))))
      (t (message "Starting EOE for site %s" *eoe-site-name*)))


;;; -----------------------------------------------------------------
;;; emacs version determination and site-specific EOE load-path setup
;;; -----------------------------------------------------------------

;;; Prepend the emacs load path with EOE specific directories.
;;; Prepending allows overriding standard library files.  These
;;; directories are defined as well-known, global variables to allow
;;; for avoiding use of hardcoded paths in eoe files.

;;
;; EOE base directory
;;
(defvar *eoe-root-dir* (cond ((eq system-type 'windows-nt)	; <== EOE CUSTOMIZATION MAYBE NEEDED ***
			      "g:/eoe")
			     (t
			      "/opt/public/eoe"))
  "This is the base EOE directory.")

;;
;; other directories are derived from *eoe-root-dir*
;;
(defvar *eoe-sys-dir* (concat *eoe-root-dir* "/lisp/sys")
  "Place where basic elisp code for EOE services is kept.
This must be non-emacs version specific code.")

(defvar *eoe-local-dir* (concat *eoe-root-dir* "/lisp/local")
  "Place where locally-developed elisp code for EOE services is kept.
This must be non-emacs version specific code.")

(defvar *eoe-public-dir* (concat *eoe-root-dir* "/lisp/public")
  "Place where public-domain, externally developed emacs code is kept.
This must be non-emacs version specific.")

(defvar *eoe-esfiles-dir* (concat *eoe-root-dir* "/lisp/esfiles")
  "Place to keep -site.el files that cannot be in the same directory as
the main .el file say due to file-permissions restrictions.
We call these estranged -site.el files.
This must be non-emacs version specific code.")

;;
;; Determine Emacs version
;;

(load-file (concat *eoe-sys-dir* "/eoe.el"))
(load-file (concat *eoe-sys-dir* "/eoe-emacs-vers.el"))

;; All emacs version operations should be based on emacs-vers.el
;; the library is loaded with an explicit path because the load
;; path is currently a function of emacs versions so we cannot
;; yet use the load-path to resolve library names reliably
(message "Emacs version: %s %d.%d"
	 emacs-type emacs-major-version emacs-minor-version)

(setq *eoe-emacs-type*
      (cond ((equal emacs-type 'fsf)
	     (intern (format "%df" emacs-major-version)))
	    ((equal emacs-type 'xemacs)
	     (intern (format "%dx" emacs-major-version)))
	    ((equal emacs-type 'lucid)
	     (intern (format "%dl" emacs-major-version)))
	    (t
	     (message "Unsupported emacs type: %s" emacs-type)
	     (intern (format "%d%s" emacs-major-version)))))


(defvar *eoe-ver-local-dir* (concat *eoe-root-dir*
				    (format "/lisp/%s/local" *eoe-emacs-type*))
  "Locally-developed, version specific, elisp code kept here.")

(defvar *eoe-ver-public-dir* (concat *eoe-root-dir*
				     (format "/lisp/%s/public" *eoe-emacs-type*))
  "Public-domain, externally developed emacs code kept here.")

(defvar *eoe-ver-esfiles-dir* (concat *eoe-root-dir*
				      (format "/lisp/%s/esfiles" *eoe-emacs-type*))
  "*-site.el files that can't be kept with their main .el files are kept here.
We call these estranged -site.el files.")

;;
;; Now setup the load-path
;;
(setq load-path (append (list *eoe-sys-dir*) ; eoe base files
			;;
			;; local directories
			;;
			(append (eoe-get-package-subdirs *eoe-ver-local-dir*) ; version dependant dir(s)
				(list *eoe-ver-local-dir*))
			(append (eoe-get-package-subdirs *eoe-local-dir*) ; version independant dir(s)
				(list *eoe-local-dir*))
			;;
			;; public directories
			;;
			(append (eoe-get-package-subdirs *eoe-ver-public-dir*) ; version dependant dir(s)
				(list *eoe-ver-public-dir*))
			(append (eoe-get-package-subdirs *eoe-public-dir*) ; version independant dir(s)
				(list  *eoe-public-dir*))
			;;
			;; estranged -site.el file directories
			;;
			(list *eoe-ver-esfiles-dir* *eoe-esfiles-dir*)
			;;
			;; prepend to the existing load-path
			;;
			load-path
			))


;;; -----------------------------------------------------------------
;;; Setup EOE's info directories
;;; -----------------------------------------------------------------

(cond ((or (eq *eoe-emacs-type* '19x)
	   (eq *eoe-emacs-type* '19f))
       ;; emacs 19 supports a list of info directories
       (require 'info)
       (setq Info-directory-list
	     (append Info-directory-list
		     (list
		      (expand-file-name (format "%s/info" *eoe-root-dir*))
		      (expand-file-name (format "%s/lisp/%s/info" *eoe-root-dir* *eoe-emacs-type*))
		      (expand-file-name (format "%s/lisp/info" *eoe-root-dir*))
		      ))))
      ((eq *eoe-emacs-type* '18f)
       ;; emacs 18 only has 1 info directory--use eoe's
       (setq Info-directory (expand-file-name
			     (format "%s/info" *eoe-root-dir*))))
      )

;;; -----------------------------------------------------------------
;;; Now load the basic eoe functionality
;;; -----------------------------------------------------------------
(load "eoe")

;;; -----------------------------------------------------------------
;;; Now load the default-eoe library for site wide EOE run-time
;;; -----------------------------------------------------------------
(load "default-eoe")			; this is being obsoleted...

;; we don't use admin-administered emacs defaults (but we set this
;; *before* loading the user's init file so that this decision can be
;; overridden).
(setq inhibit-default-init t)

;;; -----------------------------------------------------------------
;;; Now load user-specific EOE parameters
;;; -----------------------------------------------------------------
(defvar *eoe-user-parameters-file* "~/.eoe"
  "User's init file to load (if present).")

(defvar *eoe-default-user-parameters-file* (format "%s/.eoe" *eoe-sys-dir*)
  "Default init file to load (if user's is not present).")

(cond ((file-exists-p *eoe-user-parameters-file*)
       (load *eoe-user-parameters-file*))
      (t
       (load *eoe-default-user-parameters-file*)))

;;; -----------------------------------------------------------------
;;; XEmacs initial fonts and faces setup
;;; -----------------------------------------------------------------
;; eoe uses dark background
(defconst eoe-background-mode 'dark "EOE uses dark background.")

(defun eoe-set-font (std-font)
  "Set all defined faces to use STD-FONT as it's font.
If STD-FONT is not specified or nil, `eoe-font' is used."
  (cond ((eq *eoe-emacs-type* '19x)
	 (mapcar '(lambda (face)
		    (set-face-font face (or std-font eoe-font)))
		 (face-list)))
	((and (eq *eoe-emacs-type* '19f)
	      (member window-system '(x win32)))
	 (set-default-font (or std-font eoe-font)))))

(cond ((and (eq *eoe-emacs-type* '19x)
	    (eq window-system 'x))
       ;;
       ;; XEmacs
       ;;
       (set-face-foreground 'default '((global (nil . "green"))))
       (set-face-background 'default '((global (nil . "black"))))

       (modify-frame-parameters (selected-frame)
				(list
				 (cons 'background-mode eoe-background-mode)
				 (cons 'cursor-color "white")
				 ))
       )
      ((and (eq *eoe-emacs-type* '19f)
	    (member window-system '(x win32)))
       ;;
       ;; FSF Emacs 19
       ;;
       ;; Colors - basics
       (set-foreground-color "green")
       (set-background-color "black")
       (set-cursor-color "white")
       ;; Colors - faces
       (set-face-foreground 'highlight "white")
       (set-face-background 'highlight "blue")
       (set-face-foreground 'secondary-selection "black")
       (set-face-foreground 'bold "yellow")
       (set-face-foreground 'bold-italic "White")
       (set-face-foreground 'italic "LightBlue")
       (set-face-foreground 'modeline "Black")
       (set-face-background 'modeline "gray")
       (set-face-background 'region "lightgray")
       (set-face-foreground 'region "red")
       (and (fboundp 'make-face) (make-face 'gui-button-face))
       (set-face-foreground 'gui-button-face "red")
       (set-face-background 'gui-button-face "black")
       ;; font-lock faces
       (require 'font-lock)
       (font-lock-make-faces)
       (set-face-foreground 'font-lock-keyword-face "LightGray")
       (set-face-foreground 'font-lock-string-face "Khaki")
       (set-face-foreground 'font-lock-type-face "Orange")
       (set-face-foreground 'font-lock-function-name-face "Cyan")
       (set-face-foreground 'font-lock-variable-name-face "LightBlue")
       (set-face-foreground 'font-lock-reference-face "Yellow")
       ;;
       ;; Fonts
       ;;
       (set-default-font eoe-font)
       ))


;;; -----------------------------------------------------------------
;;; Now site-specific initialization (load packages, autoloads, ...)
;;; allow the user to override with his own
;;; -----------------------------------------------------------------
(defvar *eoe-site-init-file* (format "%s/.emacs%s" *eoe-sys-dir* *eoe-emacs-type*)
  "Site init file to load (if present).")

(defvar *eoe-user-init-file* (format "~/.emacs%s" *eoe-emacs-type*)
  "User's init file to load (if present).")

(cond ((file-exists-p *eoe-user-init-file*)
       (load *eoe-user-init-file*))
      ((file-exists-p *eoe-site-init-file*)
       (load *eoe-site-init-file*)))

;; Options Menu Settings
;; =====================
(cond
 ((and (string-match "XEmacs" emacs-version)
       (boundp 'emacs-major-version)
       (or (and
	    (= emacs-major-version 19)
	    (>= emacs-minor-version 14))
	   (= emacs-major-version 20))
       (fboundp 'load-options-file))
  ;; load user's .xemacs-options or not present load eoe's
  (cond ((file-exists-p "~/.xemacs-options")
	 (load-options-file "~/.xemacs-options"))
	(t
	 (message "User ~/.xemacs-options not found, using default.")
	 (load-options-file (format "%s/.xemacs-options" *eoe-sys-dir*))))))
;; ============================
;; End of Options Menu Settings

;; set the font for all faces currently defined see doc for variable
;; `eoe-font' and `eoe-font-candidates' for more info.
(if (member window-system '(x win32))
    (eoe-set-font eoe-font))


;; restore gc-cons-threshold
(setq gc-cons-threshold (/ gc-cons-threshold 10))

;; now turn off debugging on error
(setq debug-on-error nil)

(setq minibuffer-max-depth nil)

(load-file "/opt/public/eoe/lisp/esfiles/bbdb-filters-site.el")ffer-max-depth nil)
