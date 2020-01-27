;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
;;;#+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "org-img-link-readme.org"
* org-img-link  allows for associating any link to an image.
  The obvious natural way to do this with org links would have been:

  [ [ link-destination ] [ link-description ] ]

  And when link description had been a file specification or a url
  pointing to an image, the description would have become the image
  that you would click to get to link-destination.

  But even with the latest org-mode (org-mode 9.1), this does not work for me.

** img-link Syntax

  As a work around, we are creating a new org-link-type called:
  "img-link". 
  We would then use it like this:
  [ [ img-link: img-path ] [ link-destination ] ] 
  An example would then be:

  [[img-link:file:/bisos//blee/env/images/signup.jpg][http://www.by-star.net]]

  [[img-link:https://d1ra4hr810e003.cloudfront.net/media/27FB7F0C-9885-42A6-9E0C19C35242B5AC/0/D968A2D0-35B8-41C6-A94A0C5C5FCA0725/F0E9E3EC-8F99-4ED8-A40DADEAF7A011A5/dbe669e9-40be-51c9-a9a0-001b0e022be7/thul-IMG_2100.jpg][http://www.by-star.net]]

** Installation

  You can initialize this package as:
     (require 'org-img-link)
     (xtn:org:link:img-link/activate)

** Usage

  You can then use it by:
        (img-link-overlays)          -- to activate it and 
	(img-link-clear-overlays)    -- to go back to seeing it as text.

** Origin And Status

  Much of this code has been lifted from John Kitchn.

  And at this time, it is just a stop gap measure.  Such capability is
  so very essential that it should be incorporated into the org-mode
  proper. We hope that the equivalent code be incorporated in org-mode
  distribution.

** Known problems:

*** The syntax is backwards, instead of:
    
    [ [ link-destination ] [ link-description-img ] ]
    
    we have 

    [ [ img-link link-description-img ] [ link-destination ] ]

*** Hovering over the image of the link we get the link-description-img   
    and not the link-destination.

*** The display is controlled by 
    (img-link-overlays) and (img-link-clear-overlays)
    instead of the native 
    (org-toggle-inline-images) and (org-display-inline-images t)

*** A bad img-link throws and error and stops other good img-links to be displayed.
** Evolution Plans:

*** TODO The backwardsness can easily be fixed 
    in xtn:org:link:img-link :path/proc
    but img-link-overlays may be harder to fix. 
    Need to see if xtn:org:link:description/get-at-point
    can be used there.

*** TODO There should be a way to avoid img-link-overlays and
    have (org-toggle-inline-images) do the job. 
    Need to run this by the org-mode mailing list.

*** TODO All of this points to the fact that the org-mode
    link syntax is incomplete. We should evolve org-mode to be on top
    of "Emacs Mark-Up Language" (EML) -- a parallel to html5 -- in
    which a link syntax would be at least as rich of html.  html link
    syntax sees img as an integral part of the syntax.  For example An
    image as a link is something like:
    <a href="https://www.w3schools.com"> <img
    border="0" alt="W3Schools" src="logo_w3s.gif" width="100"
    height="100"> </a>
    This is all unrelated to org-exporting.

;;;#+END:
")

(lambda () "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
")


;; (xtn:org:link:img-link/activate)
(defun xtn:org:link:img-link/activate ()
  ""
  (interactive)
  (org-add-link-type
   "img-link"
   'xtn:org:link:img-link:path/proc   
   )
  )


(defun xtn:org:link:img-link:path/proc  (@path)
  ""
  (let (
	($linkDesc (xtn:org:link:description/get-at-point))
	)
    ;;(org-end-of-line)
    ;;(insert (format "--Path is %s == desc is %s" @path $linkDesc))
    (org-open-link-from-string $linkDesc)
    )
  )


(defun xtn:org:link:description/get-at-point ()
  (let (
	($link (org-element-context))
	)
    (buffer-substring (org-element-property :contents-begin $link)
                      (org-element-property :contents-end $link))
    )
  )


(lambda () "
* Original code from John Kitchn
(org-add-link-type
 \"image-url\"
 (lambda (path)
   (let ((img (expand-file-name
           (concat (md5 path) \".\" (file-name-extension path))
           temporary-file-directory)))
     (if (file-exists-p img)
     (find-file img)
       (url-copy-file path img)
       (find-file img)))))
")



(defun img-link-overlays ()
  "Put image overlays on remote image urls."
  (interactive)
  (loop for img-link in (org-element-map (org-element-parse-buffer) 'link
               (lambda (link)
                 (when (string= "img-link" (org-element-property :type link))
                   link)))
    do
    (let* ((path (org-element-property :path img-link))
           (ov (make-overlay (org-element-property :begin img-link)
                 (org-element-property :end img-link)))
           (img (create-image (expand-file-name
                   (concat (md5 path)
			   "."
                       (file-name-extension
                        path))
                   temporary-file-directory))))
      (overlay-put ov 'display img)
      (overlay-put ov 'img-link t))))

(defun img-link-clear-overlays ()
  "Remove overlays on img-links."
  (interactive)
  (require 'ov)
  (ov-clear 'img-link))

(provide 'org-img-link)

(lambda () "
*      ======[[elisp:(org-cycle)][Fold]]====== /[dblock] -- End-Of-File Controls/
#+STARTUP: showall
")

;;; local variables:
;;; no-byte-compile: t
;;; end:
