
;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)
(require 'epa-file)


;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents)˙)

(defun system-is-laptop ()
  "Returns true if its the laptop work machine"
  (or (string-equal system-name "Justins-MBP") (string-equal system-name "Justins-MacBook-Pro.local")))

(defun system-is-workstation ()
  "Returns true if its the laptop work machine"
  (string-equal system-name "justinj"))

(defvar additionalPackages '())

(defvar basePackages
  '(expand-region doom-themes ob-prolog dashboard yasnippet-snippets monokai-theme xclip
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
                  org-present pdf-view-restore ob-elixir elixir-mode ein smartscan lsp-mode lsp-ui god-mode
                  kkp
                  ;;emacsql emacsql-sqlite
                  dash-functional org-pomodoro hydra org-ref org-noter pdf-tools typescript-mode scala-mode emms calfw calfw-org))

(when (system-is-workstation)
  (defvar additionalPackages '()))
(when (system-is-laptop) (message "It is a laptop dummy"))
(when (system-is-laptop)
  (defvar additionalPackages
    '(password-generator org-journal calfw-org calfw-ical calfw emms org-brain bibtex-utils elfeed-org
                    elfeed volume org-emms org-drill org-tree-slide
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
  (add-to-list 'load-path "~/.emacs.d/deprecated/emacsql-sqlite")
  )

(setq custom-file "~/.emacs.d/external/custom-variables.el")
(load custom-file)

(org-babel-load-file (expand-file-name "~/.emacs.d/README.org"))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'scroll-left 'disabled nil)
