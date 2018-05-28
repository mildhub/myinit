;;============================================================
;;Basic setting
;;============================================================

;;encoding
;;(set-language-environment "UTF-8")

;;start-message
(setq inhibit-startup-message t)

;;menu-bar, tool-bar remove
(menu-bar-mode -1)
(tool-bar-mode -1)

;;tab
;; (defun my-insert-tab-char ()
;;   "Insert a tab char. (ASCII 9, \t)"
;;   (interactive)
;;   (insert "\t"))
;; (global-set-key (kbd "TAB") 'my-insert-tab-char)
(setq-default tab-width 4)
(setq tab-width 4)
;; (setq-default tab-always-indent t)
;; (setq-default tab-always-indent nil)
;; (setq-default tab-always-indent 'complete)
(setq-default c-basic-offset 4)
(set-variable 'py-indent-offset 4)
(set-variable 'python-indent-guess-indent-offset nil)

;;backupfile remove
(setq make-backup-files nil)
(setq auto-save-default nil)

;;block active
(show-paren-mode t)

;;yes-or-no
(defalias 'yes-or-no-p 'y-or-n-p)

;;basic location
;; (setq default-directory "//")

;;theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'brin t)

;;korean
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
;;(set-file-name-coding-system 'cp949-dos)
(global-set-key (kbd "S-SPC") 'toggle-input-method)

;;line
(global-linum-mode 1)
(setq linum-format "%3d ")
;;(setq linum-format "%3d \u2502 ")

;;===========================================================
;;my packages setting
;;===========================================================

;;melpa
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;;use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
	:ensure t)

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

;;yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c y") 'yas-expand)
;;(define-key yas-minor-mode-map (kbd "S-SPC") 'yas-expand)

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
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)

;;=====================================================================
;;my setting end
;;=====================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(try zenburn-theme yasnippet which-key web-mode use-package s pyvenv neotree multiple-cursors lorem-ipsum js2-mode highlight-indentation find-file-in-project emmet-mode dash-functional company auto-complete ace-window)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 102 :width normal))))
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
