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

;;;;;;;;;;;;;;;;;;;;;;;     Fonts and Writing set-up   ;;;;;;;;;;;;;;;;;

;; Set fonts
(setq doom-font (font-spec :family "Fira Code" :size 18 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 18))

;; line space
(setq-default line-spacing 0.5)

;; word count in modeline
(setq doom-modeline-enable-word-count t)

;; Disable company in org-mode
(setq company-global-modes '(not org-mode markdown-mode))

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

;; configur writeroom-mode
(use-package writeroom-mode
  :bind (("<f9>" . writeroom-mode))
  :config
  (setq writeroom-width .85))


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
