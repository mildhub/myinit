;;============================================================
;;Basic setting
;;============================================================

;;encoding
(set-language-environment "UTF-8")

;;start-message
(setq inhibit-startup-message t)

;;menu-bar, tool-bar remove
(menu-bar-mode -1)
(tool-bar-mode -1)

;;tab
(setq-default tab-width 4)

;;backupfile remove
(setq make-backup-files nil)
(setq auto-save-default nil)

;;block sign
(show-paren-mode t)

;;yes-or-no
(defalias 'yes-or-no-p 'y-or-n-p)

;;basic location
;; (setq default-directory "") 

;;theme
(load-theme 'github-modern t)

;;한글 관련
;; (prefer-coding-system 'utf-8)
;; (set-language-environment "Korean")

;;===========================================================
;;my packages setting
;;===========================================================

;;melpa
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;;use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;which-key package
(use-package which-key
	:ensure t
	:config
	(which-key-mode))

;;ace-window-package
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

;;auto-complete-package
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

;;multiple-cursors-package
(require 'multiple-cursors)
(global-set-key (kbd "M-.") 'mc/mark-next-like-this)
(global-set-key (kbd "M-,") 'mc/unmark-next-like-this)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)

;;lorem-ipsum-package
(use-package lorem-ipsum
  :ensure t
  :config
  (lorem-ipsum-use-default-bindings))

;;neo-tree-package
;;(directory tree)
(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle))

;;theme-package
;; (use-package zenburn-theme
;;   :ensure t
;;   :config (load-theme 'zenburn t))

;;================================================================
;;coding setting
;;================================================================

;;web-mode
(use-package web-mode
    :ensure t
    :config
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))
    (setq web-mode-engines-alist '(("php" . "\\.html\\'")))
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 4))

;;emmet-mode
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)
(define-key emmet-mode-keymap (kbd "M-j") 'emmet-expand-line)

;;JavaScript Setting
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;my setting end
;;=====================================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 102 :width normal))))
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
