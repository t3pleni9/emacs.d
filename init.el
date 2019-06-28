;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))


(package-initialize)
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
(global-linum-mode t) ;; enable line numbers globally
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(global-set-key (kbd "C-c p") 'projectile-command-map)
;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zotxt org-pdfview jupyter dockerfile-mode csv-mode csv git-gutter-fringe+ helm multiple-cursors magit material-theme better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-git-gutter+-mode +1)
(wrap-region-global-mode 1)
(delete-selection-mode 1)
(elpy-enable)
(setq projectile-project-search-path '("~/Documents/Projects/"))
(setq projectile-indexing-method 'alien)
(helm-mode 1)
(load "~/.emacs.d/keybinding")
(require 'neotree)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(setq explicit-shell-file-name "/bin/zsh")
(setq shell-file-name "zsh")
(setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
(setenv "SHELL" shell-file-name)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
(add-hook 'org-mode 'org-zotxt-mode)
