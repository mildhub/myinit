;;======================================================
;;Basic setting
;;======================================================

;;encoding
;;(set-language-environment "UTF-8")

;;message setting
(setq inhibit-startup-message t)
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
;; (setq default-directory "")

;;korean
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
;;(set-file-name-coding-system 'cp949-dos)
(global-set-key (kbd "S-SPC") 'toggle-input-method)

;;linum
;;(global-linum-mode 1)
;;(setq linum-format " %d ")

;;theme
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (load-theme 'github-modern t)

;;======================================================
;;Package setting
;;======================================================

;;MELPA
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;;use-package
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

;;try
(use-package try
	:ensure t)

;;which-key package
(use-package which-key
	:ensure t 
	:config
	(which-key-mode))

;;window setting
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
    ))

;;for searching swiper package
(use-package counsel
  :ensure t
  )

(use-package swiper
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-load-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

;;auto-complete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

;;yasnippet
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "C-c y") 'yas-expand))

;;multiple-cursors package
(global-unset-key (kbd "M-<down-mouse-1>"))
(use-package multiple-cursors
  :ensure t
  :bind(("M-." . mc/mark-next-like-this)
		("M-," . mc/unmark-next-like-this)
		("M-<mouse-1>" . mc/add-cursor-on-click)))

;;neo-tree-package (directory tree)
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
(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'html-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode)
  (add-hook 'web-mode-hook  'emmet-mode)
  (define-key emmet-mode-keymap (kbd "M-j") 'emmet-expand-line)
  )

;;JavaScript Setting
(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil))






;;=========================================================================
;;auto add setting
;;=========================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(emmet-mode zenburn-theme auto-complete counsel swiper which-key use-package try ace-window)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 102 :width normal))))
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
