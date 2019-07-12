(require 'org)
(setq secrets-file (cons 'file "~/Documents/Personal/secrets.org.gpg"))
(set-register ?s secrets-file)
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))
(setq org-directory "~/Documents/org-notes")
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'org-zotxt-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-agenda-files '("~/Documents/org-notes/projects/agenda.org"
			 "~/Documents/org-notes/projects/inbox.org"
                         "~/Documents/org-notes/projects/projects.org"
                         "~/Documents/org-notes/projects/tickler.org"))
(setq org-default-notes-file (concat org-directory "/projects/capture.org"))

(setq org-todo-keywords '((sequence "TODO(t)" "WORKING(w)" "|" "DONE(d)" "CANCELLED(c)")))
(setq org-log-done t
      org-todo-keyword-faces '(("WORKING" . (:foreground "#00CCFF" :weight bold :background "#353535"))))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/Documents/org-notes/projects/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/Documents/org-notes/projects/tickler.org" "Tickler")
                               "* %i%? \n %U")))

(setq org-refile-targets '(("~/Documents/org-notes/projects/projects.org" :maxlevel . 3)
                           ("~/Documents/org-notes/projects/someday.org" :level . 1)
                           ("~/Documents/org-notes/projects/tickler.org" :maxlevel . 2)))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))
(add-hook 'org-mode-hook
          (lambda ()
            (writegood-mode)))
(add-hook 'org-mode-hook 'org-password-manager-key-bindings)

(defun my/insert-password-entry ()
  (interactive)
  (insert (concat "* [[" (read-string "Link:") "]["  (read-string "Description:") "]]
:PROPERTIES:
:USERNAME: "  (read-string "Username:") "
:PASSWORD: " (read-string "Password:") "
:END:")))

(defun my/insert-password-entry-key-binding ()
   (local-set-key (kbd "C-c C-p e") #'my/insert-password-entry))

(add-hook 'org-mode-hook #'my/insert-password-entry-key-binding)
