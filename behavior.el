;; Full power!
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(delete-selection-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default fill-column 79)

(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(set-default 'truncate-lines t)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(setq twittering-use-master-password t)

;; Text mode hooks
(add-hook 'text-mode-hook 'flyspell-mode)

;; All programming modes
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'ggtags-mode)

(add-hook 'prog-mode-hook 'auto-complete-mode)

;; Lisp programming modes
(add-hook 'lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; PHP specific hooks
(add-hook 'php-mode-hook 'ggtags-mode)
(add-hook 'php-mode-hook 'turn-on-eldoc-mode)

(yas/global-mode)
(global-git-gutter-mode 1)

(helm-mode 1)

(provide 'behavior)
