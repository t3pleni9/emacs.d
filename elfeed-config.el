(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org")))

(defun my/elfeed-show-all ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-all"))

(defun my/elfeed-show-AI-ML ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-ai_ml"))

(defun my/elfeed-show-daily ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-daily"))

(defun my/elfeed-show-reddit ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-reddit"))

(defun my/elfeed-show-astro ()
  (interactive)
  (bookmark-maybe-load-default-file)
  (bookmark-jump "elfeed-astro"))

;;write to disk when quiting
(defun my/elfeed-save-db-and-bury ()
  "Wrapper to save the elfeed db to disk before burying buffer"
  (interactive)
  (elfeed-db-save)
  (quit-window))

(use-package elfeed
  :ensure t
  :bind (:map elfeed-search-mode-map
              ("A" . my/elfeed-show-all)
              ("M" . my/elfeed-show-AI-ML)
              ("D" . my/elfeed-show-daily)
              ("R" . my/elfeed-show-reddit)))
