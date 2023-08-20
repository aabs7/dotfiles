;; org mode
(setq org-lowest-priority ?E) ;; Gives us priorities A through E

(defun abs/org-mode-setup ()
  (org-indent-mode) ;; use indentation for org files
  (visual-line-mode 1)) ;; wrap around text

(use-package org
    :hook (org-mode . abs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾") ;; Use down arrow instead of ...
  (setq org-hide-emphasis-markers nil)
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time) ;; log time when task is done
  (setq org-log-into-drawer t) ;; time stamps into drawer 
  (setq org-agenda-files
	'("~/orgfiles/daily_logs/Task.org"
	  "~/orgfiles/Birthday.org")))

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/orgfiles/RoamNotes")
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
    ("p" "paper notes" plain
    (file "~/orgfiles/RoamNotes/templates/t_paper_note.org")
    :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
    :unnarrowed t)))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))


(setq org-todo-keywords
    '((sequence "TODO(t)" "REMAINING(n)" "|" "DONE(d!)")))


;; fill left and right part so that text is in the middle
(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))
