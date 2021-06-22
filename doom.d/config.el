;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Lemon"
      user-mail-address "mauro.limarg@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Source Code Pro Medium" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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

;; projectile
(setq projectile-project-search-path '("~/code/"))

;; Maps
;; lsp-ui-peek configuration for easy access to symbol refs and impls
(map! :leader :n "lr" #'lsp-ui-peek-find-references)
(map! :leader :n "li" #'lsp-ui-peek-find-implementation)
(map! :leader :n "gd" #'lsp-find-definition)
(map! :leader :n "gi" #'lsp-find-declaration)
;; Switch between headers and source files
;; look at https://www.emacswiki.org/emacs/FindOtherFile
(map! :leader :n "s'" #'ff-find-other-file)

;; lsp-ui-imenu buffer configuration ;;

;; modeline config
(setq lsp-ui-imenu--custom-mode-line-format "M-RET to focus symbol")

;; this hook is for refresh the imenu on changing buffers
;; TODO: if we have more than one window it doesn't work :(
(add-hook 'lsp-on-change-hook #'lsp-ui-imenu--refresh)
(add-hook 'lsp-after-open-hook #'lsp-ui-imenu--refresh)

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

; C-v <paste> ; C-c <copy> ; C-x <cut> support for highlighted text
(cua-mode t)

; Prevent xref prompt if there is some symbol at POINT
(setq xref-prompt-for-identifier nil)

;; this package will use .clang-format file if is present in
;; the project root
(use-package! clang-format+)
(add-hook 'c-mode-common-hook #'clang-format+-mode)

;; PLAYGROUND ;;
