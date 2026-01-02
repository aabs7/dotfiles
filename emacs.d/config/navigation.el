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


;; Helm Configuration
(use-package helm
  :ensure t
  :init
  (helm-mode 1)
  (setq helm-input-idle-delay 0.3) ; Prevents lag when typing fast

  ;; Helm keybindings
  :config
  (helm-autoresize-mode 1) ; Helm resizes according to the number of candidates
  (global-set-key (kbd "C-x C-f") 'helm-find-files) ; Finding files with Helm
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x b") 'helm-buffers-list)

  ;; Rebind tab in Helm
  :bind
  (:map helm-map
        ("<tab>" . helm-execute-persistent-action)
        ("C-i" . helm-execute-persistent-action)
        ("C-z" . helm-select-action)))

;; Projectile Configuration
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1)

  ;; Keybindings for switching projects and opening directories
  :bind
  (:map projectile-mode-map
        ("C-S-p" . projectile-switch-project)
        ("C-S-o" . abs/switch-to-project-and-open-directory)))


;; Additional Evil Mode Keybindings (if any)
;; Use C-p for fuzzy file search in current project in both normal and insert mode
(with-eval-after-load 'evil 
  (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
  (define-key evil-insert-state-map (kbd "C-p") 'projectile-find-file))

(define-key evil-ex-map "b" 'helm-mini)  ;; buffer using :b in evil mode
(define-key evil-ex-map "f" 'helm-find-files) ;; find-files using :f

