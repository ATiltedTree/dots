;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq
      user-full-name "Tilmann Meyer"
      user-mail-address "allescrafterx@gmail.com"

      ;; Tell treemacs to be cool
      doom-themes-treemacs-theme "doom-colors"
      +treemacs-git-mode 'deferred

      ;; Setup our font
      doom-font (font-spec :family "Fira Code" :size 13)

      ;; Setup our nord
      doom-theme 'doom-nord

      ;; This determines the style of line numbers in effect. If set to `nil', line
      ;; numbers are disabled. For relative line numbers, set this to `relative'.
      display-line-numbers t)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
