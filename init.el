
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/usr/local/bin" exec-path))

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(setq site-lisp-dir (expand-file-name "site-lisp" dotfiles-dir))

(setq customizations (expand-file-name "customizations" dotfiles-dir))

(setq org-directory "~/Dropbox/OrgFiles/")

;; 
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
 ))

(setq defuns-dir (expand-file-name "defuns" dotfiles-dir))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" dotfiles-dir))
(if (file-exists-p custom-file)
    (load custom-file))

;; Write backup files to own directory
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path customizations)
;; el-get setup
(add-to-list 'load-path (expand-file-name "el-get/el-get/" dotfiles-dir))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)

;; el-get installations
(el-get-install 'yaml-mode)
(el-get-install 'yasnippet)
(el-get-install 'markdown-mode)

;; el-get setup
(add-to-list 'load-path (expand-file-name "el-get/el-get/" dotfiles-dir))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)

;; el-get installations
(el-get-install 'yaml-mode)
(el-get-install 'yasnippet)
(el-get-install 'markdown-mode)

(require 'setup-package)
(defun init--install-packages()
  (packages-install
   '(
     ace-jump-mode
     ace-jump-zap
     ace-window
     ack-and-a-half
     auctex
     auto-complete
     cider
     change-inner
     cl-lib
     clojure-mode
     ;; clojure-test-mode
     csharp-mode
     dired-details
     dirtree
     discover-my-major
     emms
     ensime
     exec-path-from-shell
     expand-region
     evil
     feature-mode
     floobits
     geeknote
     gist
     git-timemachine
     flycheck
     flx-ido
     git-gutter
     ggtags
     helm
     helm-css-scss
     helm-projectile
     ido-ubiquitous
     jade-mode
     js2-mode
     js2-refactor
     json-mode
     key-chord
     ledger-mode
     less-css-mode
     magit
     multiple-cursors
     neotree
     org
     org2blog
     org-journal
     paredit
     php-auto-yasnippets
     php-extras
     php-mode
     php-refactor-mode
     projectile
     projectile-rails
     puppet-mode
     sbt-mode
     scala-mode2
     scss-mode
     smartscan
     surround
     twittering-mode
     web-mode
     windresize
     zenburn-theme
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))


(when (memq window-system '(mac ns))
  (setq mac-command-modifier 'meta)
  (exec-path-from-shell-initialize))

(require 'helm)
(require 'appearance)
(require 'auto-complete)
(require 'emms-setup)
(emms-standard)
(emms-default-players)
(require 'ggtags)
(require 'behavior)
(require 'ido)
(require 'twittering-mode)
(require 'web-mode)
(require 'setup-org-journal)
(require 'key-bindings)
(require 'mode-mappings)
(require 'ack-and-a-half)
(require 'evil)
(require 'surround)
(require 'feature-mode)
(require 'dirtree)
(require 'windresize)
(require 'key-chord)
(require 'neotree)
(require 'ledger-mode)
(require 'gist)
(require 'vc-git)
;; (require 'elscreen)

(eval-after-load 'auto-complete '(require 'setup-auto-complete))
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'magit '(require 'setup-magit))
(eval-after-load 'js2-mode '(require 'setup-js2-mode))
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'csharp-mode '(require 'setup-csharp))
(eval-after-load 'twittering-mode '(require 'setup-twitter))
(eval-after-load 'org '(require 'setup-org-mode))
(eval-after-load 'yas '(require 'setup-yasnippet))
(eval-after-load 'php-mode '(require 'setup-php))
(eval-after-load 'org2blog-autoloads '(require 'setup-org2blog))
(eval-after-load 'helm-mode '(require 'setup-helm))
(eval-after-load 'scala-mode2 '(require 'setup-scala))
(eval-after-load 'scss-mode '(require 'setup-css))
(eval-after-load 'less-css-mode '(require 'setup-css))
(eval-after-load 'css-mode '(require 'setup-css))
(eval-after-load 'clojure-test-mode '(require 'setup-clojure-test))
(eval-after-load 'cider-mode '(require 'setup-cider))
(eval-after-load 'projectile '(require 'setup-projectile))
(eval-after-load 'ledger-mode '(require 'setup-ledger))

(setq user-full-name "Abby Malson")
(setq user-mail-address "august.malson@gmail.com")

;; Launch Emacs in daemon mode
(require 'server)
(unless (server-running-p)
  (server-start))

;; set default shell
(setq explicit-shell-file-name "/bin/bash")
(setq shell-file-name "bash")
(setq explicit-bash-args '("--noediting" "--login" "-i"))
(setenv "SHELL" (expand-file-name "~/bin/shell"))
(setenv "ESHELL" (expand-file-name "~/bin/eshell"))
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
(setenv "VISUAL" "emacsclient")
(setenv "EDITOR" "emacsclient --alternate-editor=emacs --no-wait +%1 %f")

;; Start Evil Mode
;; (evil-mode 1)

;; start evil tabs mode
;;(global-evil-tabs-mode t)
 ;; change mode-line color by evil state
   (lexical-let ((default-color (cons (face-background 'mode-line)
                                      (face-foreground 'mode-line))))
     (add-hook 'post-command-hook
       (lambda ()
         (let ((color (cond ((minibufferp) default-color)
                            ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                            ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                            ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                            (t default-color))))
           (set-face-background 'mode-line (car color))
           (set-face-foreground 'mode-line (cdr color))))))

;; This is not being set somehow ... grrrr
(setenv "TERM" "xterm-color")

;; Set Wordwrap
(global-visual-line-mode t)
;;; init.el ends here
