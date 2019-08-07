
;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)
(require 'epa-file)


(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/external/")

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    dracula-theme
    neotree
    elpy
    flycheck
    magit
    projectile
    org
    git-gutter
    wrap-region))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)




;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(epa-pinentry-mode (quote loopback))
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(explicit-shell-file-name "/bin/zsh")
 '(org-agenda-files
   (quote
    ("~/Documents/org-notes/bibliography/references.org" "~/Documents/org-notes/projects/agenda.org" "~/Documents/org-notes/projects/inbox.org" "~/Documents/org-notes/projects/projects.org")))
 '(org-export-backends (quote (ascii beamer html icalendar latex md odt)))
 '(package-selected-packages
   (quote
    (dumb-jump helm-spotify spotify vterm yaml-mode anaconda-mode sml-modeline iedit emms json-mode org-brain smart-mode-line-powerline-theme geben-helm-projectile helm-projectile virtualenvwrapper org-sticky-header html-to-markdown org-babel-eval-in-repl bibtex-utils use-package elfeed-org interleave org-ref elfeed slime auto-complete git-gutter-fringe+ git-gutter+ org-password-manager writegood-mode all-the-icons org-bullets treemacs pdf-tools helm-company markdown-mode+ ssh zotxt jupyter dockerfile-mode csv-mode csv helm multiple-cursors magit material-theme better-defaults)))
 '(send-mail-function (quote mailclient-send-it))
 '(term-char-mode-point-at-process-mark t)
 '(term-suppress-hard-newline t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
