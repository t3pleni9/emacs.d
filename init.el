
;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)
(require 'epa-file)


(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/external/")
(add-to-list 'load-path "~/.emacs.d/external/emacs-totp")

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
    use-package
    wrap-region))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)




;; init.el ends here
(setq custom-file "~/.emacs.d/external/custom-variables.el")
(load custom-file)

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
