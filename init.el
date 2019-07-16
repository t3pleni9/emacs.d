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
;; (setq display-line-numbers "%3d\u2502")
(setq-default display-line-numbers-width 2
              display-line-numbers-widen t)
(defun display-line-numbers-disable-hook ()
  "Disable display-line-numbers locally."
  (display-line-numbers-mode 0))

(add-hook 'neotree-mode-hook 'display-line-numbers-disable-hook)
(add-hook 'maggit-mode-hook 'display-line-numbers-disable-hook)
(add-hook 'org-mode-hook 'display-line-numbers-disable-hook)


(require 'autopair) 
(require 'projectile)
(require 'neotree)
(require 'all-the-icons)
(require 'multiple-cursors)
(require 'netlogo-mode)

(load "~/.emacs.d/keybinding")
(load "~/.emacs.d/org-config")
(load "~/.emacs.d/git-config")

(projectile-global-mode)
(setq projectile-enable-caching t)


(setq elfeed-feeds
      '("https://www.reddit.com/r/emacs/.rss"
	"https://www.reddit.com/r/MachinesLearn/.rss"
	"https://www.reddit.com/r/psychology/.rss"
	"https://www.reddit.com/r/science/.rss"
	"https://www.reddit.com/r/singularity/.rss"
	"https://www.thehindu.com/news/feeder/default.rss"
	"https://timesofindia.indiatimes.com/rssfeeds/-2128821991.cms"
	"https://timesofindia.indiatimes.com/rssfeeds/-2128936835.cms"
	"https://www.reddit.com/r/Python/.rss"))

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(epa-pinentry-mode (quote loopback))
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(package-selected-packages
   (quote
    (elfeed slime auto-complete git-gutter-fringe+ git-gutter+ org-password-manager writegood-mode autopair all-the-icons org-bullets treemacs pdf-tools helm-company markdown-mode+ ssh zotxt jupyter dockerfile-mode csv-mode csv helm multiple-cursors magit material-theme better-defaults))))
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

(setenv "WORKON_HOME" "/Users/in-justin.jose/.miniconda/envs")
(pyvenv-mode 1)
