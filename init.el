;; This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
						 ("ELPA" . "http://tromey.com/elpa/")
						 ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
		
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(indium string-inflection multiple-cursors sublime-themes smex all-the-icons neotree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(load "~/.emacs.d/config/bindings.el")		


(set-default 'truncate-lines t)
(setq debug-on-error t)

;; Autosave
(setq backup-inhibited t)
(setq auto-save-default nil)

;; tabs
(defun my-insert-tab-char ()
  "Insert a tab char. (ASCII 9, \t)"
  (interactive)
  (insert "\t"))

(global-set-key (kbd "TAB") 'my-insert-tab-char)
(setq-default tab-width 4)
(setq tab-width 4)


;; Toolbar
(menu-bar-mode -1)
(tool-bar-mode -1)


;; Parenthesis
(require 'paren)
(setq show-paren-style 'expression)
(show-paren-mode 2)
;;(set-face-background 'show-paren-match-face "lightgreen")

;; Linum
(setq linum-format "%d")
(global-linum-mode 1)
	

;;ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; bs
(require 'bs)
(setq bs-configurations
	  '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))

(global-set-key (kbd "<f2>") 'bs-show)

;;Multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;;(global-set-key (kbd "C-c m c") 'mc/edit-lines)		


(require 'string-inflection)
(global-set-key (kbd "C-c i") 'string-inflection-cycle)
(global-set-key (kbd "C-c C") 'string-inflection-camelcase)        ;; Force to CamelCase
(global-set-key (kbd "C-c L") 'string-inflection-lower-camelcase)  ;; Force to lowerCamelCase
(global-set-key (kbd "C-c J") 'string-inflection-java-style-cycle) ;; Cycle through Java styles

;;smex
(global-set-key (kbd "M-x") 'smex)


;; Theme
(load-theme 'brin t)

;; NeoTree
(require 'neotree)
(require 'all-the-icons)
(global-set-key [f8] 'neotree-toggle)
(setq-default neo-smart-open t)
(setq doom-neotree-enable-file-icons t)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))




