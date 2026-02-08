(set-frame-font "JetBrains Mono 20" nil t)
;; doom emacs theme
(use-package doom-themes
  :ensure t
  :init
   (load-theme 'doom-spacegrey t)) 

;; To load icons. Note: you might have to use M-x package-install nerd-icons if this doesn't work. If the icons show unicode character
;; do M-x nerd-icons-install-fonts
(use-package nerd-icons)

;; modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))    
 
