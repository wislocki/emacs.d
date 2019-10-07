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
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (dockerfile-mode rainbow-mode rainbow-delimiters markdown-mode magit avy deft use-package)))
 '(tool-bar-mode nil)
 '(user-full-name "Daniel Wislocki")
 '(user-initials "dmw")
 '(user-mail-address "daniel.wislocki@gmail.com"))

(package-initialize)

;;; Libraries

(use-package thingatpt)

;;; Packages

(use-package apropospriate-theme
  :ensure t
  :config
  (load-theme 'apropospriate-dark t))

(use-package avy
  :ensure t
  :bind* ("C-." . avy-goto-char-timer)
  :config
  (avy-setup-default))

(use-package deft
  :ensure t
  :bind (("C-z d" . deft)
	 ("C-z r" . deft-refresh))
  :commands (deft)
  :init (setq deft-directory "~/Dropbox/notes"
	      deft-extensions '("org" "md" "txt" "tex" "latex")))

(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile[a-zA-Z.-]*\\'")

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


(defun efls/deft-open-other ()
 (interactive)
 (deft-open-file-other-window t))

(defun efls/deft-open-preview ()
 (interactive)
 (deft-open-file-other-window))

(with-eval-after-load 'deft
  (define-key deft-mode-map
    (kbd "<tab>") 'efls/deft-open-preview)
  (define-key deft-mode-map
    (kbd "<C-return>") 'efls/deft-open-other))

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

;;   "dF" '(zd-avy-file-search-ace-window :wk "avy file other window")

;;; Key bindings

(global-set-key [f1] 'Info-goto-emacs-command-node)

(global-set-key [f6] 'find-file-other-frame)

(global-set-key [f9] 'zd-new-file)
