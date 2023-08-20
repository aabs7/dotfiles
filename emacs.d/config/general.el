;; Don't show the splash screen
(setq inhibit-startup-message t  ; Don't show the initial emacs screen
      visible-bell nil)            ; Flash when the bell rings

(tool-bar-mode -1)   ; remove tool bar
(scroll-bar-mode -1) ; remove scrolling
(menu-bar-mode -1)   ; remove menu bar above
 
(global-display-line-numbers-mode 1) ; display line numbers

(set-face-attribute 'default nil :height 180) ; set the font size to 18. Value is 1/10 pt

(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; Make ESC quit prompts

(define-key global-map "\C-cc" 'org-capture)

(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0))
