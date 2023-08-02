;;; Vim Bindings
(use-package evil
  :demand t
  :config
  (evil-mode 1))

;; Load and configure helm using use-package
(use-package helm
  :ensure t
  :init
  (helm-mode 1)
  ;; Additional configuration for helm can go here
  :config
    (helm-autoresize-mode 1) ;; Helm resizes according to the number of candidates
    (global-set-key (kbd "C-x C-f") 'helm-find-files) ;; Finding files with Helm
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
    (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "C-x b") 'helm-buffers-list)
  )
