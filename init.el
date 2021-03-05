;;; init.el -- The latest iteration of DW's .emacs / init.el file.

(global-unset-key (kbd "C-z"))

(add-to-list 'load-path (concat user-emacs-directory
  (convert-standard-filename "lisp")))

(require 'package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (yaml-mode company cider ace-window ivy counsel swiper dockerfile-mode rainbow-mode rainbow-delimiters markdown-mode magit avy deft use-package)))
 '(tool-bar-mode nil)
 '(user-full-name "Daniel Wislocki")
 '(user-initials "dmw")
 '(user-mail-address "daniel.wislocki@gmail.com"))

(package-initialize)

;;; Libraries

(use-package thingatpt)

;;; Packages

(use-package ace-window
  :ensure t
  :bind ("M-o" . ace-window))

(use-package apropospriate-theme
  :ensure t
  :config
  (load-theme 'apropospriate-dark t))

(use-package avy
  :ensure t
  :bind* ("C-." . avy-goto-char-timer)
  :config
  (avy-setup-default))

(use-package cider
  :ensure t)

(use-package company
  :ensure t
  :init
  (global-company-mode 1))

(use-package counsel
  :ensure t
  :after ivy)

(use-package deft
  :ensure t
  :bind (("C-z d" . deft)
	 ("C-z r" . deft-refresh))
  :commands (deft)
  :init (setq deft-directory "~/Dropbox/notes"
	      deft-extensions '("org" "md" "txt" "tex" "latex")))

(defun dmw/deft-open-other ()
 (interactive)
 (deft-open-file-other-window t))

(defun dmw/deft-open-preview ()
 (interactive)
 (deft-open-file-other-window))

(with-eval-after-load 'deft
  (define-key deft-mode-map
    (kbd "<tab>") 'dmw/deft-open-preview)
  (define-key deft-mode-map
    (kbd "<C-return>") 'dmw/deft-open-other))

(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile[a-zA-Z.-]*\\'")

(use-package ivy
  :ensure t)

(use-package magit
  :ensure t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package swiper
  :ensure t)

(use-package whitespace
  :diminish (global-whitespace-mode
             whitespace-mode
             whitespace-newline-mode)
  :init
  (setq whitespace-style '(face trailing space-before-tab empty))
  (global-whitespace-mode 1))

(use-package yaml-mode
  :ensure t)

(use-package zetteldeft
  :bind (("C-z C-s" . zd-deft-new-search)
	 ("C-z s" . zd-deft-search-at-point)
	 ("C-z C-f" . zd-find-file)
	 ("C-z C-t" . zd-tag-buffer)
	 ("C-z t" . zd-avy-tag-search)
	 ("C-z l" . zd-avy-link-search)
	 ("C-z C-w" . zd-file-rename)
	 ("C-z <return>" . zd-follow-link)
	 ("C-z C-n" . zd-new-file-and-link)
	 ("C-z n" . zd-new-file)
	 ("C-z C-i" . zd-find-file-full-title-insert)
	 ("C-z i" . zd-find-file-id-insert)
	 ("C-z g" . zd-search-current-id)))

;;; Key bindings

(global-set-key [f1] 'Info-goto-emacs-command-node)

(global-set-key [f6] 'find-file-other-frame)

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

;; (global-set-key (kbd "C-s") 'swiper-isearch)
;; (global-set-key (kbd "C-r") 'swiper-isearch-backward)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
