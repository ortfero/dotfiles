(setq inhibit-startup-message t)
(tooltip-mode -1)  ; Disable tooltips
(menu-bar-mode -1)  ; Disable the menu bar
(setq visible-bell t)
(load-theme 'wombat)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(require 'package)
(setq package-archives
  '(("melpa" . "https://melpa.org/packages/")
    ("org" . "https://orgmode.org/elpa/")
    ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)

(global-display-line-numbers-mode t)
(dolist
    (mode '(org-mode-hook
	    term-mode-hook
	    shell-mode-hook
	    eshell-mode-hook))
  (add-hook mode
	    (lambda ()
	      (display-line-numbers-mode 0))))

(global-hl-line-mode 1)
(global-visual-line-mode t)


(setq make-backup-files nil)

(use-package doom-themes
  :init (load-theme 'doom-gruvbox t))

(add-hook
 'lisp-mode-hook
 (lambda ()
   (setq lisp-indent-offset 2)
   (setq lisp-body-indent 2)))

(add-hook
 'c-mode-hook
 (lambda ()
   (setq c-basic-offset 2)))

(use-package magit)

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump)))

(use-package wakib-keys)
(wakib-keys 1)

(global-set-key [home] 'beginning-of-line-text)

(use-package dart-mode)
