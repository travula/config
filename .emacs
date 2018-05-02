(let ((default-directory  "~/.emacs.d/elpa/"))
  (setq load-path
        (append
         (let ((load-path  (copy-sequence load-path))) ;; Shadow
           (append 
            (copy-sequence (normal-top-level-add-to-load-path '(".")))
            (normal-top-level-add-subdirs-to-load-path)))
         load-path)))


(setq org-src-preserve-indentation t)

(defvar org-babel-use-quick-and-dirty-noweb-expansion t
"Set to true to use regular expressions to expand noweb references.
This results in much faster noweb reference expansion but does
not properly allow code blocks to inherit the \":noweb-ref\"
header argument from buffer or subtree wide properties.")

(require 'cl)
;;; dired
;;; =====
;; for changing to the directory of the buffer in shell
(load "~/.emacs.d/custom/cd")
(load "~/.emacs.d/custom/dired-operations")
(load "~/.emacs.d/custom/incr-build")
(load "~/.emacs.d/custom/tangle-with-publish-dir")
(load "~/.emacs.d/custom/web-mode.el")

(require 'incr-build)
(setq dired-dwim-target t)
(setq dired-copy-preserve-time t)
(setq dired-recursive-copies 'top)

(define-key dired-mode-map "b" 'browse-url-of-dired-file)
(load "dired-x")
(define-key dired-mode-map "z" 'dired-remote-copy)
(define-key dired-mode-map "r" 'rsync-se-101)
(define-key dired-mode-map "\C-ca" 'dired-acroread-file)
(define-key dired-mode-map "\C-cd" 'cd-buffer-dir)
(setq-default fill-column 60)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-auto-fill)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wheatgrass))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

 (add-to-list 'default-frame-alist
                       '(font . "DejaVu Sans Mono-16"))

(set-face-attribute 'default t :font "DejaVu Sans Mono-16" )

(show-paren-mode 1)

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook   '(lambda () (setq-default js2-basic-offset 2)))
(add-hook 'js2-mode-hook   'auto-complete-mode)


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(defun dark ()
  (custom-set-variables
   '(custom-enabled-themes (quote (wheatgrass)))))

(defun light ()
  (custom-set-variables
 '(custom-enabled-themes (quote (whiteboard)))))
