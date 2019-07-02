(require 'org)
(setq org-directory "~/Documents/org-notes")
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'org-zotxt-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-agenda-files '("~/Documents/org-notes/gtd/agenda.org"))
(setq org-default-notes-file (concat org-directory "/gtd/capture.org"))

(setq org-todo-keywords '((sequence "TODO(t)" "WORKING(w)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/Documents/org-notes/gtd/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/Documents/org-notes/gtd/tickler.org" "Tickler")
                               "* %i%? \n %U")))

(setq org-refile-targets '(("~/Documents/org-notes/gtd/gtd.org" :maxlevel . 3)
                           ("~/Documents/org-notes/gtd/someday.org" :level . 1)
                           ("~/Documents/org-notes/gtd/tickler.org" :maxlevel . 2)))
