(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("ELPA" . "http://tromey.com/elpa/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(custom-safe-themes
   (quote
    ("e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" default)))
 '(package-selected-packages
   (quote
    (smooth-scroll helm-ag dart-mode sass-mode helm-emmet dracula-theme helm-etags-plus ace-window mark-multiple ng2-mode blank-mode tide expand-region ggtags flycheck-yamllint yaml-mode helm spaceline-all-the-icons spaceline powerline material-theme highlight-chars coffee-mode web-mode emmet-mode parinfer clojure-mode-extra-font-locking cider magit company-tern indium helm-projectile projectile use-package web-beautify xref-js2 json-mode rainbow-mode js-doc js2-refactor auto-complete ac-js2 desktop+ string-inflection multiple-cursors sublime-themes smex all-the-icons neotree)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq exec-path (append exec-path '("/usr/local/bin/")))
(setenv "PATH" (concat (getenv "PATH") "/usr/local/bin/node"))
;; (setq exec-path (append exec-path '("/usr/local/bin/node")))


(load "~/.emacs.d/config/bindings.el")
(load "~/.emacs.d/config/customize.el")
(load "~/.emacs.d/config/desktop.el")
(load "~/.emacs.d/config/ibuffer.el")
(load "~/.emacs.d/config/js.el")
(load "~/.emacs.d/config/ts.el")
(load "~/.emacs.d/config/dart.el")
(load "~/.emacs.d/config/project.el")
(load "~/.emacs.d/config/helm.el")
(load "~/.emacs.d/config/web.el")
;; (load "~/.emacs.d/config/json.el")


;; Autosave
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq create-lockfiles nil)


;; NeoTree
(global-set-key [f8] 'neotree-toggle)
(setq doom-neotree-enable-file-icons t)
(setq neo-theme (if (display-graphic-\p) 'icons 'arrow))
(setq neo-smart-open t)

;; YAS
;;https://github.com/AndreaCrotti/yasnippet-snippets
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/")
(yas-global-mode t)



(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "M-k") 'company-select-next)
     (define-key company-active-map (kbd "M-i") 'company-select-previous-or-abort)
     (add-to-list 'company-backends 'company-tern)
     (setq company-dabbrev-downcase 0)
     (setq company-idle-delay 0)))


(add-hook 'before-save-hook 'delete-trailing-whitespace)
