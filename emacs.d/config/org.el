;; org mode
(setq org-lowest-priority ?E) ;; Gives us priorities A through E
(setq org-cycle-emulate-tab nil) ;; call org-cycle in the current subtree wherever the cursor is
(defun abs/org-mode-setup ()
  (org-indent-mode) ;; use indentation for org files
  (visual-line-mode 1)) ;; wrap around text

(use-package org
    :hook (org-mode . abs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾") ;; Use down arrow instead of ...
  (setq org-hide-emphasis-markers nil)
  (setq org-log-done 'time) ;; log time when task is done
  (setq org-log-into-drawer t) ;; time stamps into drawer 
  (setq org-agenda-files
	'("~/orgfiles/" "~/orgfiles/RAIL/" )))

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
;;    ("p" "paper notes" plain
;;    (file "~/orgfiles/RoamNotes/templates/t_paper_note.org")
;;    :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
;;    :unnarrowed t)
    ))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "PHONE" "MEETING" "|" "CANCELLED(c@/!)" ))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "indian red" :weight bold)
              ("NEXT" :foreground "light blue" :weight bold)
              ("DONE" :foreground "gray" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(custom-set-faces
  '(org-headline-done ((t (:strike-through t :foreground "gray"))))) ;; strikethrough for done tasks

(setq org-directory "~/orgfiles")
(setq org-default-notes-file "~/orgfiles/refile.org")
;; I use C-c c to start capture mode
(global-set-key (kbd "C-c c") 'org-capture)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
     (quote (("t" "todo" entry (file "~/orgfiles/refile.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file "~/orgfiles/refile.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/orgfiles/refile.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file "~/orgfiles/refile.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/orgfiles/refile.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              )))

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

;; fill left and right part so that text is in the middle
(defun abs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . abs/org-mode-visual-fill))

(require 'ox-latex)

(defun my-generate-clock-report-pdf ()
  "Generate a custom clock report in PDF format for tasks in Org mode files."
  (interactive)
  (let* ((current-time (current-time))
         (start-date (list (nth 4 current-time) (nth 3 current-time) (nth 2 current-time)))
         (end-date current-time)
         (output-file "~/orgfiles/clock_report.pdf")) ; Specify the desired output file path
    (setq org-agenda-files '("~/orgfiles/class.org" "~/orgfiles/lsp_dynamics.org"))
    (setq org-clock-report-include-clocking-task t)
    (setq org-clock-clocktable-default-properties '(:maxlevel 2 :scope agenda :block nil :wstart start-date :wend end-date))
    (org-clock-report)
    (with-current-buffer "*Clock Report*"
      (org-latex-export-to-pdf)
      (write-file output-file))
    (message "Clock report saved to %s" output-file)))
(global-set-key (kbd "C-c e") 'my-generate-clock-report-pdf)
