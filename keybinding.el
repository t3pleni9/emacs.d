(global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c p") 'projectile-command-map)
(defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))
(global-set-key (kbd "s-1") 'neotree-project-dir)
(global-set-key (kbd "s-`") 'ansi-term)

(global-set-key (kbd "s->") #'other-window)
(global-set-key (kbd "s-<") #'prev-window)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)


(defun prev-window ()
  (interactive)
  (other-window -1))

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  (move-beginning-of-line 1)
  )
(global-set-key (kbd "C-c C-d") 'duplicate-line)


(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
