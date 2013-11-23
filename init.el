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

(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

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

(require 'setup-package)
(defun init--install-packages()
  (packages-install
   '(
     ace-jump-mode
     ack
     auctex
     change-inner
     cl-lib
     csharp-mode
     dired-details
     emms
     exec-path-from-shell
     expand-region
     fiplr
     floobits
     gist
     git-gutter
     ggtags
     helm
     ido-ubiquitous
     jade-mode
     js2-mode
     less-css-mode
     magit
     molokai-theme
     multiple-cursors
     org
     org2blog
     org-journal
     php-auto-yasnippets
     php-mode
     project-explorer
     puppet-mode
     solarized-theme
     twittering-mode
     web-mode
     zenburn-theme
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

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

(when (memq window-system '(mac ns))
  (setq mac-command-modifier 'meta)
  (exec-path-from-shell-initialize))

(require 'appearance)
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
(require 'project-explorer)

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

(setq user-full-name "Matthew M. Keeler")
(setq user-mail-address "keelerm84@gmail.com")

;; Launch Emacs in daemon mode
(require 'server)
(unless (server-running-p)
  (server-start))
