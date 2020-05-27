
;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)
(require 'epa-file)


(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/external/")
(add-to-list 'load-path "~/.emacs.d/external/emacs-totp")
(add-to-list 'load-path "~/.emacs.d/external/py-build")


(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(expand-region doom-themes org-trello ob-prolog dashboard yasnippet-snippets monokai-theme helm-swoop ttl-mode js2-mode image+ org-pdfview hmac org-super-agenda json-navigator password-generator yafolding ob-rust darktooth-theme gruvbox-theme web-mode express clojure-mode rust-mode spacemacs-theme docker-compose-mode cmake-project cmake-mode zpresent helm-ag python-pytest org-journal calfw-org calfw-ical calfw helm-system-packages rainbow-delimiters undo-tree dumb-jump helm-spotify spotify vterm yaml-mode anaconda-mode sml-modeline iedit emms json-mode org-brain smart-mode-line-powerline-theme geben-helm-projectile helm-projectile virtualenvwrapper org-sticky-header html-to-markdown org-babel-eval-in-repl bibtex-utils use-package elfeed-org interleave org-ref elfeed slime auto-complete git-gutter-fringe+ git-gutter+ org-password-manager writegood-mode all-the-icons org-bullets pdf-tools helm-company markdown-mode+ ssh jupyter dockerfile-mode csv-mode csv helm multiple-cursors magit material-theme better-defaults elpy wrap-region nov twittering-mode org-alert volume define-word org-emms org-roam-bibtex org-roam unicode-fonts))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)




;; init.el ends here
(setq custom-file "~/.emacs.d/external/custom-variables.el")
(load custom-file)

(org-babel-load-file (expand-file-name "~/.emacs.d/README.org"))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
