
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
    git-gutter
    wrap-region))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------
(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'dracula t) ;; load material theme

(global-display-line-numbers-mode t)
(global-auto-complete-mode t)
(auto-save-visited-mode t)
(global-visual-line-mode t)

(setq-default display-line-numbers-width 2
              display-line-numbers-widen t)
(defun display-line-numbers-disable-hook ()
  "Disable display-line-numbers locally."
  (display-line-numbers-mode 0))


(defun disable-visual-line-mode ()
  "Disable display-line-numbers locally."
   (visual-line-mode -1))

(add-hook 'neotree-mode-hook 'display-line-numbers-disable-hook)
(add-hook 'neotree-mode-hook 'disable-visual-line-mode)
(add-hook 'maggit-mode-hook 'display-line-numbers-disable-hook)
(add-hook 'org-mode-hook 'display-line-numbers-disable-hook)
(add-hook 'minibuffer-setup-hook 'disable-visual-line-mode)

(require 'projectile)
(require 'neotree)
(require 'all-the-icons)
(require 'multiple-cursors)
(require 'netlogo-mode)
(require 'virtualenvwrapper)
(require 'helm-projectile)

(load "~/.emacs.d/keybinding")
(load "~/.emacs.d/org-config")
(load "~/.emacs.d/git-config")
(load "~/.emacs.d/elfeed-config")

(projectile-global-mode)
(helm-projectile-toggle 1)
(setq projectile-enable-caching t)
(electric-pair-mode t)


;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(epa-pinentry-mode (quote loopback))
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(explicit-shell-file-name "/bin/zsh")
 '(org-agenda-files
   (quote
    ("~/Documents/org-notes/bibliography/references.org" "~/Documents/org-notes/projects/agenda.org" "~/Documents/org-notes/projects/inbox.org" "~/Documents/org-notes/projects/projects.org")))
 '(org-export-backends (quote (ascii beamer html icalendar latex md odt)))
 '(package-selected-packages
   (quote
    (json-mode org-brain smart-mode-line-powerline-theme geben-helm-projectile helm-projectile virtualenvwrapper org-sticky-header html-to-markdown org-babel-eval-in-repl bibtex-utils use-package elfeed-org interleave org-ref elfeed slime auto-complete git-gutter-fringe+ git-gutter+ org-password-manager writegood-mode all-the-icons org-bullets treemacs pdf-tools helm-company markdown-mode+ ssh zotxt jupyter dockerfile-mode csv-mode csv helm multiple-cursors magit material-theme better-defaults)))
 '(term-char-mode-point-at-process-mark t)
 '(term-eol-on-send t)
 '(term-suppress-hard-newline t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(wrap-region-global-mode 1)
(delete-selection-mode 1)

(setq tab-width 2
      indent-tabs-mode nil)
   
(setq display-time-string-forms
       '((propertize (concat day "." month "." (substring year -2) " " 12-hours ":" minutes " "  am-pm)
 		    'face 'bold)))
(display-time-mode 1)

(elpy-enable)
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/"))
(setq doc-view-ghostscript-program "/usr/local/bin/gs")
(setq projectile-project-search-path '("~/Documents/Projects/"))
(setq projectile-indexing-method 'alien)
(helm-mode 1)

(epa-file-enable)
(setq neo-theme (if (display-graphic-p) 'icons))
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Shell setting
(setq explicit-shell-file-name "/bin/zsh")
(setq shell-file-name "zsh")
(setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
(setenv "SHELL" shell-file-name)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

;; Others
(setq make-backup-files nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq echo-keystrokes 0.1)
(show-paren-mode t)

(setq flyspell-issue-welcome-flag nil)
(if (eq system-type 'darwin)
    (setq-default ispell-program-name "/usr/local/bin/aspell")
  (setq-default ispell-program-name "/usr/bin/aspell"))
(setq-default ispell-list-command "list")

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-hook 'markdown-mode-hook
          (lambda ()
            (visual-line-mode t)
            (writegood-mode t)
            (flyspell-mode t)))


(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "/Users/in-justin.jose/.miniconda/envs")
(setenv "WORKON_HOME" "/Users/in-justin.jose/.miniconda/envs")
(pyvenv-mode 1)
;; Smart Mode line
(require 'smart-mode-line)
(sml/setup)
;; (setq sml/no-confirm-load-theme t)
(setq sml/theme 'light-powerline)
;; (setq sml/theme 'respectful)

;; Hydra

(defhydra hydra-helm (:color blue)
  "
^
^Helm^              ^Browse^
^────^──────────────^──────^────────────
_q_ quit            _a_ Arxiv Search
_r_ resume          _g_ google
^^                  _i_ imenu
^^                  _k_ kill-ring
^^                  ^^
"
  ("q" nil)
  ("g" helm-google-suggest)
  ("a" arxiv-lookup)
  ("i" helm-imenu)
  ("k" helm-show-kill-ring)
  ("r" helm-resume))

(defhydra hydra-projectile (:color blue)
  "
^
^Projectile^        ^Buffers^           ^Find^              ^Search^
^──────────^────────^───────^───────────^────^──────────────^──────^────────────
_q_ quit            _b_ list            _d_ directory       _r_ replace
_i_ reset cache     _K_ kill all        _D_ root            _R_ regexp replace
^^                  _S_ save all        _f_ file            _s_ ag
^^                  ^^                  _p_ project         ^^
^^                  ^^                  ^^                  ^^
"
  ("q" nil)
  ("b" helm-projectile-switch-to-buffer)
  ("d" helm-projectile-find-dir)
  ("D" projectile-dired)
  ("f" helm-projectile-find-file)
  ("i" projectile-invalidate-cache :color red)
  ("K" projectile-kill-buffers)
  ("p" helm-projectile-switch-project)
  ("r" projectile-replace)
  ("R" projectile-replace-regexp)
  ("s" helm-projectile-ag)
  ("S" projectile-save-project-buffers))
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(setq comint-process-echoes t)
(toggle-frame-fullscreen)
