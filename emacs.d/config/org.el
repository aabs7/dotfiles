;; org mode
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
	(quote ("~/orgfiles"))))
;;  (setq org-agenda-files
;;	'("~/orgfiles/tasks.org"
;;	  "~/orgfiles/Birthday.org")))

(setq org-todo-keywords
    '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●"))) ;; use bullets instead of astreisks

;; fill left and right part so that text is in the middle
(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))
