;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

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

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

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
                                        ;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 13))

(setq text-scale-mode-step 1.1)

(setq evil-snipe-scope 'visible)

(after! cc-mode (set-ligatures! '(c++-mode) nil))

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(defun elcord--disable-elcord-if-no-frames (f)
  (ignore f)
  (when (let ((frames (delete f (visible-frame-list))))
          (or (null frames)
              (and (null (cdr frames))
                   (eq (car frames) terminal-frame))))
    (elcord-mode -1)))

(defun elcord--enable-on-frame-created (f)
  (ignore f)
  (elcord-mode +1))

(add-hook 'after-make-frame-functions 'elcord--enable-on-frame-created)

(defun my/elcord-mode-hook ()
  (if elcord-mode
      (add-hook 'delete-frame-functions 'elcord--disable-elcord-if-no-frames)
    (remove-hook 'delete-frame-functions 'elcord--disable-elcord-if-no-frames)))

(after! elcord (elcord-mode +1))
(add-hook! 'elcord-mode-hook 'my/elcord-mode-hook)

(after! ranger (ranger-override-dired-mode t))

(add-hook! 'dired-mode-hook 'centaur-tabs-local-mode)
(add-hook! 'ranger-mode-hook 'centaur-tabs-local-mode)

(defun my/display-set-relative ()
  (if (eq display-line-numbers t)
      (setq display-line-numbers 'relative)))     ; or 'visual

(defun my/display-set-absolute ()
  (if (eq display-line-numbers 'relative)
      (setq display-line-numbers t)))


(add-hook! 'evil-insert-state-entry-hook #'my/display-set-absolute)
(add-hook! 'evil-insert-state-exit-hook #'my/display-set-relative )

(map!  :desc "Kill buffer"
       :leader :nve "d"
       #'kill-current-buffer)
(map!  :desc "Other window"
       :leader :nve "w w"
       #'other-window)
(map!  :desc "Kill other windows"
       :leader :nve "w a"
       #'delete-other-windows)
(map!  :desc "Open dired (deer)"
       :leader :nve "f m"
       #'dired-jump)
(map!  :desc "Open ranger"
       :leader :nve "f M"
       #'ranger)

(defun my/vterm-split-right ()
  "Create a new vterm window to the right of the current one."
  (interactive)
  (let* ((ignore-window-parameters t)
         (dedicated-p (window-dedicated-p)))
    (split-window-horizontally)
    (other-window 1)
    (+vterm/here default-directory)))

(map!  :desc "Open vterm to the right"
       :leader :nve "o C-t"
       #'my/vterm-split-right)

(which-key-setup-minibuffer)
(setq which-key-idle-delay 0.4)
