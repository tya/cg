(setq load-path
      (append '("/usr/share/emacs/site-lisp/")
	      '("~/.el/rails/")
	      load-path))

(load "~/.el/color-theme.el")
(load "~/.el/nxml/autostart.el")
(load "~/.el/php/php-mode.el")
(load "~/.el/regex-tool.el")
(load "~/.el/util.el")
(load "~/.el/php/php-util.el")

;;------------------------------------------------------------------
;; This HACK loads nxml mode so that nxml-mode-map is defined by the
;; time that xml util tries to bind keys to it
;;------------------------------------------------------------------
(nxml-mode)
(load "~/.el/xml/xml-util.el")
(load "~/.el/blockify.el")

(require 'psvn)
(ispell-change-dictionary "american")

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode -1)
(global-font-lock-mode 1)
(show-paren-mode 1)
(transient-mark-mode nil)

;------------------------------------------------------------------------------
;--- SHELL --------------------------------------------------------------------
;------------------------------------------------------------------------------

(message "customizing shell")
(setq comint-password-prompt-regexp "\\(\\([Oo]ld \\|[Nn]ew \\|'s \\|login \\|Kerberos \\|CVS \\|UNIX \\| SMB \\|[Ee]nter \\|^\\)[Pp]assword\\( (again)\\)?\\|pass phrase\\|\\(Enter\\|Repeat\\) passphrase\\)\\( for [^:]+\\)?:\\s *\\'");
(setq comint-highlight-prompt nil)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

(put 'downcase-region 'disabled nil)
(put 'upcase-region   'disabled nil)

(setq sh-shell-file "/bin/sh")
(setq make-backup-files nil)

(put 'narrow-to-region 'disabled nil)

;;==========================APPEARANCE=================================

(add-hook 'php-mode-user-hook
	  (lambda ()
	      (setq indent-tabs-mode t)
	      (setq tab-width 4)
	      (set-face-foreground font-lock-comment-face "RoyalBlue1")
	      (set-face-foreground font-lock-string-face "Cyan")
	      (set-face-foreground 'highlight "Black")
	      (set-face-foreground 'region "Black")
	      (set-face-foreground 'secondary-selection "Black")
	      (set-face-background 'region "Blue")
	      (c-set-offset 'case-label '+)
	      (c-set-style "stroustrup")))

;; Disable beeping and instead make the bell visual
(setq visible-bell t)

(defun ilia-emacs-frames (monitor)
  "Sets up my emacs frames to just the way I like them."
  (interactive "nMonitor: ")
  (if (eq 1 monitor)
      (ilia-build-two-frames 0 101)
    (ilia-build-two-frames 1685 155)))

(defun ilia-build-two-frames (left height)
  "Builds two frames depending on the params given."
  (let ((initial (selected-frame)))
    (let ((first (make-frame)))
      (set-frame-position first left 0)
      (set-frame-height first height)
      (set-frame-width first 80)
      (let ((second (make-frame)))
	(set-frame-position second (+ left 505) 0)
	(set-frame-height second height)
	(set-frame-width second 80)))
    (delete-frame initial)))

(defun ty-emacs-frames (monitor)
  "Sets up my emacs frames to just the way I like them."
  (ty-build-one-frames 100 80))

(defun ty-build-one-frames (left height)
  "Builds two frames depending on the params given."
  (let ((initial (selected-frame)))
    (let ((first (make-frame)))
      (set-frame-position first left 0)
      (set-frame-height first height)
      (set-frame-width first 240))
    (delete-frame initial)))

(defun ty-build-two-frames (left height)
  "Builds two frames depending on the params given."
  (let ((initial (selected-frame)))
    (let ((first (make-frame)))
      (set-frame-position first left 0)
      (set-frame-height first height)
      (set-frame-width first 100)
      (let ((second (make-frame)))
	(set-frame-position second (+ left 505) 0)
	(set-frame-height second height)
	(set-frame-width second 100)))
    (delete-frame initial)))

(ty-emacs-frames 1)

(add-to-list 'auto-mode-alist '("\\.xml_schema\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.xsd\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.atom\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.rss\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.rdf\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.rdfs\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.rdfa\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.rng\\'" . nxml-mode))

(load "~/.el/regex-tool.el")

(defun phpcode-format ()
  "Formats PHP code the way we like it here at Beatport"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "[[:space:]]*(" "(")
    (goto-char (point-min))
    (replace-regexp "([[:space:]]*)" "()")
    (goto-char (point-min))
    (replace-regexp ")[[:space:]]*" ")")
    (goto-char (point-min))
    (replace-regexp ")[[:space:]]*{" ")

{")
    (goto-char (point-min))
    (replace-regexp "(\\([^:space:)]\\)" "( \\1")
    (goto-char (point-min))
    (replace-regexp "\\([^(:space:]\\))" "\\1 )")
    (set-mark-command (point-min))
    (indent-region (point-min) (point-max))
    ))

(global-set-key "\C-x\-" 'ilia-cc-block)

;;-----------------------------------------
;; some nice keys to moving between buffers
;;-----------------------------------------
(global-set-key [?\C-<] 'bs-cycle-next)     ; Control + < gives next buffer 
(global-set-key [?\C->] 'bs-cycle-previous) ; Control + > gives prev buffer
(global-set-key [?\C-.] 'bs-cycle-next)     ; Control + . gives next buffer
(global-set-key [?\C-,] 'bs-cycle-previous) ; Control + , gives prev buffer

;;=========================GROUP CUSTOMIZATION=========================

(custom-set-variables
 '(regex-tool-backend (quote perl))
 '(mumamo-chunk-coloring (quote submode-colored)))
(custom-set-faces)

