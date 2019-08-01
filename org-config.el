
(require 'org)
(add-to-list 'auto-mode-alist '("^\\*.org\\*$" . org-mode))
(setq org-latex-pdf-process
    '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f"))

(setq secrets-file-path "~/Documents/Personal/secrets.org.gpg")
(setq references-file-path "~/Documents/org-notes/bibliography/references.org")
(setq bookmarks-file-path "~/Documents/org-notes/projects/bookmarks.org")
(setq secrets-file (cons 'file secrets-file-path))
(set-register ?s secrets-file)
(set-register ?r (cons 'file references-file-path))

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))
(setq org-directory "~/Documents/org-notes")
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'org-zotxt-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-agenda-files '("~/Documents/org-notes/projects/agenda.org"
			 "~/Documents/org-notes/projects/inbox.org"
                         "~/Documents/org-notes/projects/projects.org"
                         "~/Documents/org-notes/projects/bookmarks.org"
			 "~/Documents/org-notes/bibliography/references.org"))
(setq org-default-notes-file (concat org-directory "/projects/capture.org"))

(setq org-todo-keywords '((sequence "TODO(t)" "QUEUED(q)" "WORKING(w)" "|" "DONE(d)" "CANCELLED(c)" "RE-VISIT(r)")))
(setq org-log-done t
      org-todo-keyword-faces '(("WORKING" . (:foreground "#00CCFF" :weight bold :background "#353535"))
			       ("QUEUED" . (:foreground "#F7FF00" :weight bold :background "#353535"))
			       ("CANCELLED" . (:foreground "#FF0000" :weight bold :background "#353535"))
			       ("RE-VISIT" . (:foreground "#00FFFF" :weight bold))))

(setq org-refile-targets '(("~/Documents/org-notes/projects/projects.org" :maxlevel . 3)
                           ("~/Documents/org-notes/bibliography/references.org" :level . 1)
                           ("~/Documents/org-notes/projects/capture.org" :maxlevel . 2)))

;; Org-babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; Org ref
(require 'org-ref)
(require 'org-ref-pdf)
(require 'org-ref-url-utils)
(require 'org-ref-arxiv)
;; export citations
;; (require 'ox-bibtex)
;; (setq org-bibtex-file "~/Documents/org-notes/bibliography/bibliography/references.org")
;; Append new packages
(add-to-list 'org-latex-default-packages-alist '("" "natbib" "") t)
(add-to-list 'org-latex-default-packages-alist
	     '("linktocpage,pdfstartview=FitH,colorlinks,
linkcolor=blue,anchorcolor=blue,
citecolor=blue,filecolor=blue,menucolor=blue,urlcolor=blue"
	       "hyperref" nil)
	     t)

;; see org-ref for use of these variables
(setq reftex-default-bibliography '("~/Documents/org-notes/bibliography/references.bib")
      org-ref-default-bibliography '("~/Documents/org-notes/bibliography/references.bib")
      org-ref-pdf-directory "~/Documents/org-notes/bibliography/bibtex-pdfs/")

(setq bibtex-completion-bibliography "~/Documents/org-notes/bibliography/references.bib"
      bibtex-completion-library-path "~/Documents/org-notes/bibliography/bibtex-pdfs"
      bibtex-completion-notes-path "~/Documents/org-notes/bibliography/helm-bibtex-notes"
      bibtex-completion-pdf-field "File"
      bibtex-completion-pdf-symbol "⌘"
      bibtex-completion-notes-symbol "✎"
      bibtex-completion-additional-search-fields '(tags keywords))
(setq bibtex-completion-display-formats
      '((t . "${author:30} ${title:150} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:7}")))

;; Tell org-ref to let helm-bibtex find notes for it
(setq org-ref-notes-function
      (lambda (thekey)
	(let ((bibtex-completion-bibliography (org-ref-find-bibliography)))
	  (bibtex-completion-edit-notes
	   (list (car (org-ref-get-bibtex-key-and-file thekey)))))))
(setq org-latex-prefer-user-labels t)


(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))
(add-hook 'org-mode-hook
          (lambda ()
            (writegood-mode)))
(add-hook 'org-mode-hook 'org-password-manager-key-bindings)
(add-hook 'org-mode-hook 'org-beamer-mode)
(defun my/org-auto-tag ()
  (interactive)
  (let ((alltags (append org-tag-persistent-alist org-tag-alist))
	(headline-words (split-string (org-get-heading t t))))
    (mapcar (lambda (word)
	      (if (assoc word alltags) (org-toggle-tag word 'on)))
            headline-words)))


(setq org-capture-templates
      '(
	("s" "Secrets" entry
	 (file secrets-file-path)
	 "* [[%^{Link}][%^{Description}]]
 :PROPERTIES:
 :USERNAME: %^{Username}
 :PASSWORD: %^{Password}
 :END:
")
	("t" "Todo [inbox]" entry
	 (file+headline "~/Documents/org-notes/projects/inbox.org" "Tasks")
	 "* TODO %i%?")

	("r" "References")
	("rp" "Paper" entry
	 (file+headline references-file-path "Papers")
       	 "*  %^g %i%?
       :PROPERTIES:
       :TYPE: Paper
       :END:
")
	("rb" "Book" entry
	 (file+headline references-file-path "Books")
	   "* %^{title}  %^g
       :PROPERTIES:
       :TYPE: Book
       :URL: [[%^{url}][source]]
       :END:
")

	("b" "Bookmarks")
	("bw" "Web URL" entry
	 (file+headline bookmarks-file-path "Web")
	   "* TODO %^{title}  %^g
       :PROPERTIES:
       :TYPE: Web
       :URL: [[%^{url}][source]]
       :END:
")

	("bv" "Videos" entry
	 (file+headline bookmarks-file-path "Videos")
	   "* TODO %^{title}  %^g
       :PROPERTIES:
       :TYPE: Video
       :URL: [[%^{url}][source]]
       :END:
")

	("bp" "Podcasts" entry
	 (file+headline bookmarks-file-path "Podcasts")
	   "* TODO %^{title} %^g
       :PROPERTIES:
       :TYPE: Podcast
       :URL: [[%^{url}][source]]
       :END:
")))


(defun my-org-confirm-babel-evaluate (lang body)
  (not (member lang '("python" "lisp" "emacs-lisp" "clojure" "sh"))))

(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)
