;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;; LISP INCLUDES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ----------------------------------
;; load path
;; ----------------------------------
;; add site-lisp dir to load path
(add-to-list 'load-path (expand-file-name "/usr/share/emacs/site-lisp/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/el/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install/"))

;; ----------------------------------
;; auto install
;; ----------------------------------
;; load auto install file
(load "~/.emacs.d/auto-install/auto-install.el")
(require 'auto-install)

;; ----------------------------------
;; load svn
;; ----------------------------------
(load "~/.eamcs.d/elisp/psvn.el")
(require 'psvn)

;; ----------------------------------
;; scrolling
;; ----------------------------------
;; load scrolling
(load "~/.emacs.d/elisp/smooth-scrolling.el")
(require 'smooth-scrolling)

;; ----------------------------------
;; load python
;; ----------------------------------
(load "~/.emacs.d/elisp/python-mode.el")
(require 'python)

;; ----------------------------------
;; load nxml
;; ----------------------------------
(load "~/.emacs.d/vendor/nxml-mode-20041004/rng-auto.el")
(require 'nxml-mode)

;; ----------------------------------
;; load Pymacs
;; ----------------------------------
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/Pymacs-0.23/"))
(load "~/.emacs.d/vendor/Pymacs-0.23/pymacs.el")
(require 'pymacs)

;; ----------------------------------
;; load yasnippet-bundle
;; ----------------------------------
;;(load "~/.emacs.d/vendor/yasnippet-bundle-0.5.10/yasnippet-bundle.el")
;;(require 'yasnippet-bundle)

;; ----------------------------------
;; load yasnippet
;; ----------------------------------
;;(load "~/.emacs.d/vendor/yasnippet-0.5.10/yasnippet.el")
;;(require 'yasnippet)

;; ----------------------------------
;; load auto-complete
;; ----------------------------------
(load "~/.emacs.d/auto-install/auto-complete.el")
(require 'auto-complete)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;; EMACS PREFERENCES ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ----------------------------------
;; remove annoying
;; ----------------------------------
;; will make the last line end in a carriage return.
(setq require-final-newline t)

;; allow you to type just "y" instead of "yes" when you exit.
;;(fset 'yes-or-no-p 'y-or-n-p)


;; ----------------------------------
;; general options
;; ----------------------------------
;; will make text-mode default.
(setq default-major-mode 'text-mode)

;; use american dictionary
(ispell-change-dictionary "american")

;; create spaces not tabs
;;(setq-default indent-tabs-mode nil)

;; Set case-sensitive search off
(setq-default case-fold-search t)

;; ignore case in completion
;;(setq completion-ignore-case t)

;; ignore binaries when listing files in browser
(setq completion-ignored-extensions '(".o" ".obj" ".exe" ".bmp" ".res" ".class" ".doc"))

;; change the default compile command
(setq compile-command "ant -e -Denv=stage -Dprofile=releasedeployer ")

;; get intermittent messages to stop typing
(type-break-mode)

;; Doing c/c++editing
;;(require 'cc-mode)
;;(setq c-basic-offset 3)
;;(c-set-offset 'substatement-open 0)
;;(setq perl-indent-level 3)
;;(setq cperl-indent-level 3)
;;(setq cperl-brace-offset -3)


;; -----------------------------------
;; movement
;; -----------------------------------
;; When cursor go off page...it scrolls 10 lines
;;(setq scroll-step 10)

;; Pgup/dn will return exactly to the starting point.
;;(setq scroll-preserve-screen-position 1)

;; disallow creation of new lines when you press the "arrow-down key" at end of the buffer.
(setq next-line-add-newlines nil)


;; -----------------------------------
;; appearance
;; -----------------------------------
;; If GNU emacs, set background and foreground
(cond
 ((string-match "GNU" (emacs-version))
  (set-background-color "Black")
  (set-foreground-color "green"))
 )

;; Disable beeping and instead make the bell visual
(setq visible-bell t)

;; turn off menu bar
(menu-bar-mode 0)

;; turn off tool bar
(tool-bar-mode 0)

;; make the display of date and time persistent.
(setq display-time-day-and-date t)
(display-time)

;; Display line numbers
(setq-default line-number-mode t)

;; Display column numbers
(setq-default column-number-mode t)

;; enable fontification (color) in all modes.
(global-font-lock-mode t t)

;; denotes our interest in maximum possible fontification.
(setq font-lock-maximum-decoration t)

;; trucate lines if they are too long.
;;(setq-default truncate-lines t)

;; trucate even when screen is split into multiple windows.
;;(setq-default truncate-partial-width-windows nil)

;; set split screen threshold
;;(setq split-width-threshold 50)

;; -----------------------------------
;; highlighting
;; -----------------------------------
;; Parenthesis Matching is in Viper
;; See M-X viper-mode in
;; Can also be accomplished with ESC ^F forward, and ESC ^B backwards.
(load-library "viper-cmd")

;; highlight matching parentheses next to cursor.
(require 'paren)
(show-paren-mode t)

;; highlight region between point and mark.
(transient-mark-mode t)

;; highlight during query.
(setq query-replace-highlight t)

;; highlight incremental search
(setq search-highlight t)


;; -----------------------------------
;; key bindings
;; -----------------------------------
;; setup my key definitions
(define-key esc-map    "g"    'goto-line)
(define-key ctl-x-map  "%"    'match-paren)
(define-key ctl-x-map  "q"    'query-replace)

;; program keys F1-F9, F11, F12 (for F10, see below)
(define-key global-map [f1] 'electric-buffer-list)           ;; F1
(define-key global-map [f2] 'viper-paren-match)              ;; F2
(define-key global-map [f3] 'set-mark-command)               ;; F3
(define-key global-map [f4] 'undo)                           ;; F4
(define-key global-map [f5] 'replace-string)                 ;; F5
(define-key global-map [f6] 'query-replace-regexp)           ;; F6
(define-key global-map [f7] 'bs-cycle-next)                  ;; F7
(define-key global-map [f8] 'bs-cycle-previous)              ;; F8
(define-key global-map [f9] 'next-error)                     ;; F9
(define-key global-map [f10] 'vc-toggle-read-only)           ;; F10
(define-key global-map [f11] 'refresh-buffer)                ;; F11 on top (sunos)
(define-key global-map [f12] 'indent-region)                 ;; F12

;; some nice keys to moving between buffers
(global-set-key [?\C-<] 'bs-cycle-next)     ; Control + < gives next buffer 
(global-set-key [?\C->] 'bs-cycle-previous) ; Control + > gives prev buffer
(global-set-key [?\C-.] 'bs-cycle-next)     ; Control + . gives next buffer
(global-set-key [?\C-,] 'bs-cycle-previous) ; Control + , gives prev buffer


;; -----------------------------------
;; backup files
;; -----------------------------------
;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
(defvar autosave-dir "~/bak/emacs_autosaves/")
(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
   (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))

;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir "~/bak/emacs_autosaves/")
(setq backup-directory-alist (list (cons "." backup-dir)))


;; ----------------------------------
;; shell
;; ----------------------------------
;; print message
(message "customizing shell")

;; ??
(setq comint-password-prompt-regexp "\\(\\([Oo]ld \\|[Nn]ew \\|'s \\|login \\|Kerberos \\|CVS \\|UNIX \\| SMB \\|[Ee]nter \\|^\\)[Pp]assword\\( (again)\\)?\\|pass phrase\\|\\(Enter\\|Repeat\\) passphrase\\)\\( for [^:]+\\)?:\\s *\\'");

;; ??
(setq comint-highlight-prompt nil)

;; ??
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; ??
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; ??
(put 'downcase-region 'disabled nil)

;; ??
(put 'upcase-region   'disabled nil)

;; set shell path
(setq sh-shell-file "/bin/sh")

;; do not make backup files
;;(setq make-backup-files nil)

;; ??
(put 'narrow-to-region 'disabled nil)


;; ----------------------------------
;; php
;; ----------------------------------
;; (add-hook 'php-mode-user-hook
;; 	  (lambda ()
;; 	      (setq indent-tabs-mode t)
;; 	      (setq tab-width 4)
;; 	      (set-face-foreground font-lock-comment-face "RoyalBlue1")
;; 	      (set-face-foreground font-lock-string-face "Cyan")
;; 	      (set-face-foreground 'highlight "Black")
;; 	      (set-face-foreground 'region "Black")
;; 	      (set-face-foreground 'secondary-selection "Black")
;; 	      (set-face-background 'region "Blue")
;; 	      (c-set-offset 'case-label '+)
;; 	      (c-set-style "stroustrup")))

;; (defun phpcode-format ()
;;   "Formats PHP code the way we like it here at Beatport"
;;   (interactive)
;;   (save-excursion
;;     (goto-char (point-min))
;;     (replace-regexp "[[:space:]]*(" "(")
;;     (goto-char (point-min))
;;     (replace-regexp "([[:space:]]*)" "()")
;;     (goto-char (point-min))
;;     (replace-regexp ")[[:space:]]*" ")")
;;     (goto-char (point-min))
;;     (replace-regexp ")[[:space:]]*{" ")

;; {")
;;     (goto-char (point-min))
;;     (replace-regexp "(\\([^:space:)]\\)" "( \\1")
;;     (goto-char (point-min))
;;     (replace-regexp "\\([^(:space:]\\))" "\\1 )")
;;     (set-mark-command (point-min))
;;     (indent-region (point-min) (point-max))
;;     ))


;; ----------------------------------
;; window size and placement
;; ----------------------------------
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

;;(ty-emacs-frames 1)


;; ----------------------------------
;; mode-extension mappings
;; ----------------------------------
(add-to-list 'auto-mode-alist '("\\.xml_schema\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.xsd\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.atom\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.rss\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.rdf\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.rdfs\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.rdfa\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.rng\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.properties\\'" . make-file-mode))
(add-to-list 'auto-mode-alist '("\\.template\\'" . rpm-spec-mode))


;; ----------------------------------
;; auto install
;; ----------------------------------
;; have auto install use this dir
(setq auto-install-directory "~/.emacs.d/vendor/auto-install/")

;; update the list of package names for auto install on startup
(auto-install-update-emacswiki-package-name t)

;; auto confirm auto installs
(setq auto-install-save-confirm nil)

;; This command `defalias'es `install-elisp',
;;     `install-elisp-from-emacswiki' and `install-elisp-from-gist' to
;;     `auto-install' ones.
;(auto-install-compatibility-setup)


;; ----------------------------------
;; auto-complete stuff
;; ----------------------------------
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
 
;; Initialize Pymacs                                                                                           
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

;; ;; Initialize Rope                                                                                             
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)
 
;; ;; Initialize Yasnippet                                                                                        
;; ;Don't map TAB to yasnippet                                                                                    
;; ;In fact, set it to something we'll never use because                                                          
;; ;we'll only ever trigger it indirectly.                                                                        
;; (setq yas/trigger-key (kbd "C-c <kp-multiply>"))
;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/snippets")
 
 
;; ;; ----------------------------------                                         
;; ;; Auto-completion Integration                                                                                   
;; ;;   1) Rope                                                                                                  
;; ;;   2) Yasnippet                                                                                             
;; ;;   all with AutoComplete.el                                                                                 
;; ;; ----------------------------------                                         
;; (defun prefix-list-elements (list prefix)
;;   (let (value)
;;     (nreverse
;;      (dolist (element list value)
;;       (setq value (cons (format "%s%s" prefix element) value))))))

;; (defvar ac-source-rope
;;   '((candidates
;;      . (lambda ()
;;          (prefix-list-elements (rope-completions) ac-target))))
;;   "Source for Rope")

;; (defun ac-python-find ()
;;   "Python `ac-find-function'."
;;   (require 'thingatpt)
;;   (let ((symbol (car-safe (bounds-of-thing-at-point 'symbol))))
;;     (if (null symbol)
;;         (if (string= "." (buffer-substring (- (point) 1) (point)))
;;             (point)
;;           nil)
;;       symbol)))

;; (defun ac-python-candidate ()
;;   "Python `ac-candidates-function'"
;;   (let (candidates)
;;     (dolist (source ac-sources)
;;       (if (symbolp source)
;;           (setq source (symbol-value source)))
;;       (let* ((ac-limit (or (cdr-safe (assq 'limit source)) ac-limit))
;;              (requires (cdr-safe (assq 'requires source)))
;;              cand)
;;         (if (or (null requires)
;;                 (>= (length ac-target) requires))
;;             (setq cand
;;                   (delq nil
;;                         (mapcar (lambda (candidate)
;;                                   (propertize candidate 'source source))
;;                                 (funcall (cdr (assq 'candidates source)))))))
;;         (if (and (> ac-limit 1)
;;                  (> (length cand) ac-limit))
;;             (setcdr (nthcdr (1- ac-limit) cand) nil))
;;         (setq candidates (append candidates cand))))
;;     (delete-dups candidates)))
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;                  (auto-complete-mode 1)
;;                  (set (make-local-variable 'ac-sources)
;;                       (append ac-sources '(ac-source-rope) '(ac-source-yasnippet)))
;;                  (set (make-local-variable 'ac-find-function) 'ac-python-find)
;;                  (set (make-local-variable 'ac-candidate-function) 'ac-python-candidate)
;;                  (set (make-local-variable 'ac-auto-start) nil)))
 
;; ;;Ryan's python specific tab completion                                                                        
;; (defun ryan-python-tab ()
;;   ; Try the following:                                                                                         
;;   ; 1) Do a yasnippet expansion                                                                                
;;   ; 2) Do a Rope code completion                                                                               
;;   ; 3) Do an indent                                                                                            
;;   (interactive)
;;   (if (eql (ac-start) 0)
;;       (indent-for-tab-command)))
 
;; (defadvice ac-start (before advice-turn-on-auto-start activate)
;;   (set (make-local-variable 'ac-auto-start) t))
;; (defadvice ac-cleanup (after advice-turn-off-auto-start activate)
;;   (set (make-local-variable 'ac-auto-start) nil))
 
;; (define-key python-mode-map "\t" 'ryan-python-tab)
;; ----------------------------------                                         
;; End Auto Completion                                                                                        
;; ----------------------------------
