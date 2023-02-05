;; Configure doom interface

;; full screen
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
 
;; disable line numbers
(setq display-line-numbers-type nil)
 
;; Hash Typing fix
(fset 'insertHash "#")
(global-set-key (kbd "M-3") 'insertHash)

;;(setq fancy-splash-image (concat doom-private-dir "emacs-e.png"))
(setq +doom-dashboard-ascii-banner-fn "Khalid's Emacs")

;; These change during day and night
(setq calendar-location-name "London")
(setq calendar-latitude 51.50)
(setq calendar-longitude -0.11)

(require 'theme-changer)
(change-theme 'doom-acario-light 'doom-dracula)

;; enable word-wrap (almost) everywhere
(+global-word-wrap-mode +1)

;; pretify symbols
(global-prettify-symbols-mode +1)

(setq confirm-kill-emacs nil) ; Disable exit confirmation.

;; Make the modeline font smaller

(setq doom-modeline-height 1)
(set-face-attribute 'mode-line nil :height 130)
(set-face-attribute 'mode-line-inactive nil :height 130)

;;;;;;;;;;;;;;;;;;;;;;;     Fonts and Writing set-up   ;;;;;;;;;;;;;;;;;

;; Set fonts
(setq doom-font (font-spec :family "Fira Code" :size 18 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 18))

;; line space
(setq-default line-spacing 0.5)

;; word count in modeline
(setq doom-modeline-enable-word-count t)

;; Markdown config
(use-package markdown-mode
  :ensure t
  :custom
  (markdown-enable-math t)
  (markdown-hide-urls t)
  :mode
  ("\\.md\\'" . markdown-mode)
  :hook
  (markdown-mode . centered-cursor-mode)
  (markdown-mode . focus-mode)
  (markdown-mode . writeroom-mode)
  :config
  ;; omitted a bunch of defun's
  )
;; Disable company in Org_mode and markdown-mode
(setq company-global-modes '(not org-mode markdown-mode))

;; configur writeroom-mode
(use-package writeroom-mode
  :bind (("<f9>" . writeroom-mode))
  :config
  (setq writeroom-width .85))

;; Quotes

(setq org-hide-block-startup t)

;;;;;;;;;;;;;;;;;;;;;;;     Set-up Org_mode   ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; https://github.com/ruivieira/.doom.d/blob/main/config.el
;; org-mode general configuration
(use-package! org-modern)
(after! org
  (add-hook 'org-mode-hook #'org-modern-mode))
  
;;;;;;;;;;;;;;;;;;;;;;;     Set-up Org_roam   ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(after! org
  (setq org-roam-index-file "~/Documents/b.work/emacs_notes/roam/index.org"))

(use-package org-roam
  :ensure t
  :init
  :custom
  (org-roam-directory "~/Documents/b.work/emacs_notes/roam")
  (org-roam-completion-everywhere t)
  :bind (
         :map org-mode-map
         ("C-M-i"    . completion-at-point))
  :config
  (org-roam-setup))

;; Org Agends
(setq org-agenda-files '("~/Documents/b.work/emacs_notes/tasks/tasks_2023.org"
                         "~/Documents/b.work/emacs_notes/tasks/birthdays.org"))

;; Bibliography configuration
(after! citar
  (setq! citar-bibliography '("~/Documents/b.work/emacs_work/references/My Library.bib"))
  (setq! citar-library-paths '("~/Documents/b.work/emacs_work/references/library"))
  (setq! citar-notes-paths '("~/Documents/b.work/emacs_work/references/notes")))
 (setq org-cite-csl-styles-dir "~/Zotero/styles")  ;; link with zotero csl files

;;;;;;;;;;;;;;;;;;;;;;    Citation solution     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;; use oackages

(use-package! focus)
(use-package! dirvish)
(use-package! format-all)
(use-package! org-roam-bibtex)
