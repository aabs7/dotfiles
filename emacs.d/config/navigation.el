;; Define Custom functions

;; Switch to a Projectile project and open its directory in Dired."
(defun abs/switch-to-project-and-open-directory ()
  (interactive)
  (let ((original-action projectile-switch-project-action))
    (setq projectile-switch-project-action 'projectile-dired)
    (projectile-switch-project)
    (setq projectile-switch-project-action original-action)))


;;; Evil Configurtion
(setq evil-want-keybinding nil) ;; Evil mode won't override or modify existing emacs keybindings
(use-package evil
  :demand t
  :init
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1)
  ;; keybindinds for insert mode
  :bind
  (:map evil-insert-state-map
	("C-h" . left-char)
	("C-j" . next-line)
	("C-k" . previous-line)
	("C-l" . right-char)))

(use-package evil-collection
  :after evil
  :init
  (evil-collection-init))


(use-package evil-nerd-commenter
  :ensure t
  :config
  ;; Normal state (gcc equivalent)
  (define-key evil-normal-state-map (kbd "s-/") 'evilnc-comment-or-uncomment-lines)
  ;; Visual state (commenting the selected block)
  (define-key evil-visual-state-map (kbd "s-/") 'evilnc-comment-or-uncomment-lines)
  ;; Optional: Insert state (so you don't have to leave insert mode to comment)
  (define-key evil-insert-state-map (kbd "s-/") 'evilnc-comment-or-uncomment-lines))


;; Previously used helm. Helm turned out to be too laggy, when doing M-x, and it felt bloated.
;; Vertigo is the new choice (with savehist, marginalia, and orderless packages). Works good for me
;;; Vertico Configuration
(use-package vertico
  :ensure t
  :init
  (vertico-mode 1)
  :config
  (setq vertico-cycle t))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode 1))

;; Annotations (shows file info/docstrings in the minibuffer)
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode 1))

;; Fuzzy/Space-separated searching
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;;; Global Keybindings
(global-set-key (kbd "C-x C-f") 'find-file)
(global-set-key (kbd "M-x") 'execute-extended-command)
(global-set-key (kbd "C-x b") 'switch-to-buffer)

;;; Projectile Configuration
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1)
  :bind
  (:map projectile-mode-map
        ("C-S-p" . projectile-switch-project)
        ("C-S-o" . abs/switch-to-project-and-open-directory)))


;; Additional Evil Mode Keybindings (if any)
;; Use C-p for fuzzy file search in current project in both normal and insert mode
(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
  (define-key evil-insert-state-map (kbd "C-p") 'projectile-find-file)
  (define-key evil-ex-map "b" 'switch-to-buffer)
  (define-key evil-ex-map "f" 'find-file))
