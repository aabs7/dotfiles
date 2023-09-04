;;; Vim Bindings
(setq evil-want-keybinding nil)
(use-package evil
  :demand t
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :init
  (evil-collection-init))

;; Load and configure helm using use-package
(use-package helm
  :ensure t
  :init
  (helm-mode 1)
  ;; Additional configuration for helm can go here
  :config
    (helm-autoresize-mode 1) ;; Helm resizes according to the number of candidates
    (global-set-key (kbd "C-x C-f") 'helm-find-files) ;; Finding files with Helm
    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "C-x b") 'helm-buffers-list)
    )

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1))

;; TODO: Move these bindings inside helm.
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(define-key evil-ex-map "b" 'helm-mini)  ;; buffer using :b in evil mode
(define-key evil-ex-map "f" 'helm-find-files) ;; find-files using :f
(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)
