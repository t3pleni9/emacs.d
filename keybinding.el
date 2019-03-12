(global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-c g") 'magit-status)
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

(global-set-key (kbd "s-<right>") #'other-window)
(global-set-key (kbd "s-<left>") #'prev-window)

(defun prev-window ()
  (interactive)
  (other-window -1))
