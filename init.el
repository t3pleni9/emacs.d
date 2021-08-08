
;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)
(require 'epa-file)


(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defun system-is-laptop ()
  "Returns true if its the laptop work machine"
  (string-equal system-name "in-justinjose.local"))

(defun system-is-workstation ()
  "Returns true if its the laptop work machine"
  (string-equal system-name "justinj"))

(defvar basePackages
  '(expand-region doom-themes ob-prolog dashboard yasnippet-snippets monokai-theme
                  helm-swoop ttl-mode js2-mode image+ org-pdftools hmac org-super-agenda
                  json-navigator yafolding ob-rust darktooth-theme gruvbox-theme
                  web-mode express clojure-mode rust-mode spacemacs-theme
                  docker-compose-mode cmake-project cmake-mode zpresent helm-ag python-pytest
                  helm-system-packages rainbow-delimiters undo-tree dumb-jump vterm yaml-mode anaconda-mode
                  sml-modeline iedit json-mode smart-mode-line-powerline-theme
                  geben-helm-projectile helm-projectile virtualenvwrapper org-sticky-header
                  html-to-markdown org-babel-eval-in-repl use-package
                  slime auto-complete git-gutter-fringe+ git-gutter+
                  writegood-mode all-the-icons org-bullets pdf-tools
                  helm-company ssh jupyter dockerfile-mode csv helm
                  multiple-cursors magit material-theme better-defaults elpy wrap-region nov
                  org-alert define-word unicode-fonts eshell-prompt-extras
                  org-present pdf-view-restore ob-elixir elixir-mode ein smartscan 
                  dash-functional org-pomodoro hydra))

(when (system-is-workstation)
  (defvar additionalPackages '()))

(when (system-is-laptop)
  (defvar additionalPackages
    '(password-generator org-journal calfw-org calfw-ical calfw emms org-brain bibtex-utils elfeed-org
                  org-noter org-ref elfeed pdf-tools
                  volume org-emms
                  deft zone)))


(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      (append basePackages additionalPackages))



;; init.el ends here
(add-to-list 'load-path "~/.emacs.d/external/")
(add-to-list 'load-path "~/.emacs.d/external/py-build")

;; Personal repository for deprecated packages
(when (system-is-laptop)
  (add-to-list 'load-path "~/.emacs.d/external/emacs-totp")
  (add-to-list 'load-path "~/.emacs.d/deprecated/org-password-manager")
  (add-to-list 'load-path "~/.emacs.d/deprecated/org-roam")
  (add-to-list 'load-path "~/.emacs.d/deprecated/org-roam-server")
  (add-to-list 'load-path "~/.emacs.d/deprecated/emacsql")
  (add-to-list 'load-path "~/.emacs.d/deprecated/emacsql-sqlite"))

(setq custom-file "~/.emacs.d/external/custom-variables.el")
(load custom-file)

(org-babel-load-file (expand-file-name "~/.emacs.d/README.org"))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
