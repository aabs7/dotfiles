(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives (append package-archives
			 '(("melpa" . "http://melpa.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("elpy" . "http://jorgenschaefer.github.io/packages/"))))

;; BOOTSTRAP USE-PACKAE
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

;; General customization
(load "~/.emacs.d/config/general.el")
(load "~/.emacs.d/config/navigation.el")
(load "~/.emacs.d/config/visual.el")
(load "~/.emacs.d/config/org.el")

;; don't let customize add stuff to my init.el
(setq custom-file "~/.emacs.d/config/custom.el")
(load custom-file)
