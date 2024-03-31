(set-frame-font "JetBrains Mono 18" nil t)
;; doom emacs theme
(use-package doom-themes
  :ensure t
  :init
   (load-theme 'doom-palenight t)) 

;; spacemacs theme
;;(use-package spacemacs-theme
;;  :defer t
;;  :init (load-theme 'spacemacs-dark t))

;; to load icons
(require 'nerd-icons)
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))    
