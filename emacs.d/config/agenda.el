;; Diary integration
(setq org-agenda-include-diary t)

(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (agenda "")
          (alltodo "")))))

;;(add-to-list 'org-agenda-custom-commands
;;             '("W" "Weekly review"
;;               agenda ""
;;               ((org-agenda-span 'week)
;;                (org-agenda-start-on-weekday 0)
;;                (org-agenda-start-with-log-mode t)
;;                (org-agenda-skip-function
;;                 '(org-agenda-skip-entry-if 'nottodo 'done))
;;                 )))

;;(setq org-agenda-custom-commands
;;      '(("w" "Weekly Summary"
;;         ((agenda "" ((org-agenda-span 'week)
;;                      (org-agenda-start-on-weekday 1)
;;                      (org-agenda-format-date "")
;;                      (org-agenda-prefix-format "  %-12t%?-12T% s")))
;;          (org-agenda-log-mode-items '(clock))
;;          (org-agenda-files org-agenda-files)))))

