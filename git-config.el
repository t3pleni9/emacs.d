;; Git/ VC configs go here
;; If you would like to use git-gutter.el and linum-mode
(global-git-gutter+-mode t)
(setq git-gutter+-disabled-modes '(asm-mode image-mode))
(set-face-background 'git-gutter+-modified "purple") ;; background color
(set-face-foreground 'git-gutter+-added "green")
(set-face-foreground 'git-gutter+-deleted "red")

(defhydra hydra-magit (:color blue)
  "
  ^
  ^Git  ^             ^Do^
  ^─────^─────────────^──^─────────────
  _n_ Next Hunk       _p_ Previous Hunk
  _w_ Show Hunk       _t_ Stage Hunk
  _q_ Quit            _b_ Blame
  _c_ Clone           _s_ Status
  _i_ Init            ^^
  "
  ("q" nil)
  ("n" git-gutter+-next-hunk)
  ("p" git-gutter+-previous-hunk)
  ("w" git-gutter+-show-hunk)
  ("t" git-gutter+-stage-hunks)
  ("b" magit-blame)
  ("c" magit-clone)
  ("i" magit-init)
  ("s" magit-status))
(global-set-key (kbd "C-c m") 'hydra-magit/body)
