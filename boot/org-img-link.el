;;; -*- Mode: Emacs-Lisp; -*-

(lambda () "
* org-img-link  allows for associating any link to an image.
  The obvious natural way to do this with org links would have been:
  [ [ link-destination ] [ link-description ] ]
  And when link description had been a file specification or a url pointing to an image,
  the description would have become the image that you would click to get to link-destination.

  But even with the latest org-mode (org-mode), this is not possible.

  As a work around, we are creating a new org-link-type called:
  "img-link". 
  We would then use it like this:
  [ [ img-link:img-path%%link-destination ] ] 
  An example would then be:


  Much of this code has been lifted from John Kitchn

  Then use it like this: 

[[imgNOTlink:https://d1ra4hr810e003.cloudfront.net/media/27FB7F0C-9885-42A6-9E0C19C35242B5AC/0/D968A2D0-35B8-41C6-A94A0C5C5FCA0725/F0E9E3EC-8F99-4ED8-A40DADEAF7A011A5/dbe669e9-40be-51c9-a9a0-001b0e022be7/thul-IMG_2100.jpg]]


[[imgNOTlink:thisIsTheLink][linkDesc]]--Path is thisIsTheLink == desc is linkDesc

[[img-link:file:/bisos//blee/env/images/signup.jpg][linkDesc]]

org-display-inline-images

  Such capability is so very essential that it should be incorporated into the org-mode proper.
  
")

(lambda () "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
")

(setq xtn:org-add-link-type:img-link:usage:enabled-p t)

;;; (xtn:org-add-link-type:img-link:full/update)
(defun xtn:org-add-link-type:img-link:full/update ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  (when xtn:org-add-link-type:img-link:usage:enabled-p
    (bf:server:install/update)
    (bf:server:config/main)    
    )
  )

(defun xtn:org-add-link-type:img-link:install/update ()
  "Could make sure that needed fonts are installed. Place holder for now."
  (interactive)
  (blee:ann|this-func (compile-time-function-name))
  ;; pkg install for this xtn:
  )


;;;(xtn:org-add-link-type:img-link:config/main)
(defun xtn:org-add-link-type:img-link:config/main ()
  ""
  (interactive)
  (blee:ann|this-func (compile-time-function-name))    

  (xtn:org-add-link-type:img-link/activate)
  )


;; (xtn:org-add-link-type:img-link/activate)
(defun xtn:org-add-link-type:img-link/activate ()
  ""
  (interactive)
  (org-add-link-type
   "img-link"
   'xtn:org-add-link-type:img-link:path/proc   
   )
  )


(defun xtn:org-add-link-type:img-link:path/proc (@path)
  ""
  (let (
	($linkDesc (xtn:org:link:description/get-at-point))
	)
    (org-end-of-line)
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


(defun xtn:org-add-link-type:img-link:path/proc-orig (@path)
  ""
  (let (
	($img (expand-file-name
	       (concat (md5 @path) "." (file-name-extension @path))
	       temporary-file-directory))
	)
    (if (file-exists-p $img)
	(find-file $img)
      (url-copy-file path $img)
      (find-file $img)
      )
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
		   (message "Got Link")
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
  "Reove overlays on img-links."
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
