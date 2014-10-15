(add-to-list 'load-path "~/.emacs.d")
;(add-to-list 'load-path "~/.emacs.d/evil");
;(add-to-list 'load-path "~/.emacs.d/evil-leader");
;(add-to-list 'load-path "~/.emacs.d/evil-matchit");
;(add-to-list 'load-path "~/.emacs.d/evil-nerd-commenter");
(add-to-list 'load-path "~/.emacs.d/php-mode-1.5.0");
;(add-to-list 'load-path "~/.emacs.d/web-mode");
;(load "~/.emacs.d/nxhtml/autostart.el")
(require 'evil)
(require 'php-mode)
(evil-mode 1)
(global-set-key (kbd "C-c t e m") 'evil-mode)
;(require 'evil-leader)
;(require 'evil-matchit)
;(global-evil-matchit-mode 1)

;(setcdr evil-insert-state-map nil)
;(define-key evil-insert-state-map
;              (read-kbd-macro evil-toggle-key) 'evil-emacs-state)

(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(highlight-tabs)
(highlight-trailing-whitespace)

;(require 'web-mode)
;(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;(local-set-key (kbd "RET") 'newline-and-indent)
(add-hook 'local-write-file-hooks
            (lambda ()
               (delete-trailing-whitespace)
               nil))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))
; esc quits

;(define-key evil-normal-state-map [escape] 'keyboard-quit)
;(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
   ;(defun evil-toggle-input-method ()
           ;"when toggle on input method, switch to evil-insert-state if possible.
         ;when toggle off input method, switch to evil-normal-state if current state is evil-insert-state"
               ;(interactive)
                     ;(if (not current-input-method)
                                 ;(if (not (string= evil-state "insert"))
                                                 ;(evil-insert-state))
                                         ;(if (string= evil-state "insert")
                                                       ;(evil-normal-state)
                                                                   ;))
                           ;(toggle-input-method))
    ;(defun evil-switch-to-normal-state-method ()
      ;"switch to evil normal state"

    (global-set-key (kbd "M-]") 'evil-normal-state)

; (evilnc-default-hotkeys)
;(require 'evil-matchit)
;(global-evil-leader-mode)
;(evil-leader/set-key
;  "e" 'find-file
;  "b" 'switch-to-buffer
;  "k" 'kill-buffer)

(setq show-paren-mode t)
