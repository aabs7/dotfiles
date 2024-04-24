;; Don't show the splash screen
(setq inhibit-startup-message t)  ; Don't show the initial emacs screen
(setq visible-bell nil) ; Flash when the bell rings

(tool-bar-mode -1)   ; remove tool bar
(scroll-bar-mode -1) ; remove scrolling
(menu-bar-mode -1)   ; remove menu bar above
 
(global-display-line-numbers-mode 1) ; display line numbers

(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; Make ESC quit prompts

;; don't show line numbers for the following modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(add-to-list 'default-frame-alist '(fullscreen . maximized)) ;; full screen mode on startup
;;(add-hook 'window-setup-hook 'toggle-frame-fullscreen) ;; toggle the extended full screen mode after emacs has started
;; This package shows which key does what after some delay
(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0))

;; Magit package for git
(use-package magit
  :ensure t)

(defun abs/browse-url (url &optional new-window)
  "Open URL in the default web browser, adding 'http://' if missing."
  (interactive (browse-url-interactive-arg "URL: "))
  (setq url (if (string-match-p "^https?://" url)
                url
              (concat "http://" url)))
  (browse-url url new-window))

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c C-b") 'abs/browse-url))

(use-package undo-fu)
