(use-package doom-themes
  :ensure t
  :init
   (load-theme 'doom-palenight t)) 

(require 'nerd-icons)
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))    
