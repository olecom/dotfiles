; olecom's ~/.emacs

; Time-stamp: <Tue Oct 24 12:53:16 UTC 2006 olecom@flower.upol.cz>

;; quick help on modes:
; * glasses-mode: more readable code view
; * follow-mode: 2 window 1 buffer link
; * M-x toggle-truncate-lines
; * M-x delete-trailing-whitespace:
; * M-x highlight-changes-mode:
; * M-x hl-line-mode:
; * M-x show-paren-mode: show delimeters (braces) on-fly
; * C-x C-q' (`vc-toggle-read-only').

; ? planner-el
; apel emacs-goodies-el develock-el ispell python-mode python2.4-ipython

;; some keys to remember
;`C-c C-t'
;     Toggle the auto-newline and hungry-delete features, both at once
;     (`c-toggle-auto-hungry-state').
;`C-M-\'
;     Indent several lines to the same column (`indent-region').
; `M-i'
;      Indent from point to the next prespecified tab stop column
;      (`tab-to-tab-stop').

; generic-x library: misc. fontlocks

;; my locale things (do not break time stamp generation on English)
(setq system-time-locale "C")

;; time stamp
(load-library "time-stamp")
(add-hook 'write-file-hooks 'time-stamp)
;; like shell's date
(setq time-stamp-format "%3a %3b %2d %02H:%02M:%02S %Z %:y %u@%s")

;; Window System Startup Specific
(when window-system
  (setq inhibit-startup-message t)
  ;; setup better hacking environmentx
  (toggle-scroll-bar -1979)
  (tool-bar-mode -1981)

  ;;; workspace on "1400x1050" display
  ; first (initial frame), place it on top

  ;;;-> on x.org "terminus-20" alias isn't working, why ?
  ;;;-> got values from /etc/X11/fonts/X11R7/misc/xfonts-terminus.alias

  (add-to-list 'initial-frame-alist '(font . "-xos4-terminus-medium-r-normal--20-200-72-72-c-100-iso10646-1"))
  (modify-frame-parameters nil (x-parse-geometry "120x30+0+0"))

  ; third frame with speedbar, on top-right side, full hight
  (speedbar)
  (modify-frame-parameters (car (frames-on-display-list))
			   '((height . 72) (left . 1220) (top . 0)))

  ; create second frame, and place it on bottom, full width
  (add-to-list 'default-frame-alist '(font . "-xos4-terminus-medium-r-normal--14-140-72-72-c-80-iso10646-1"))
  (make-frame '((name . "-*- The second frame -*-")))
  (select-frame (car (frames-on-display-list)))
  (modify-frame-parameters nil (x-parse-geometry "172x34+0+540"))
  (toggle-scroll-bar -1979)
  (split-window-horizontally)

  ; deselect speedbar, select initial frame
  (select-frame (nth 2 (frames-on-display-list))))

;; no menu-bar, anyway
(menu-bar-mode -2005)

;;--------------------  custom faces  ----------------
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(default ((t (:stipple nil :background "black" :foreground "Green" :inverse-video nil :box nil :strike-through nil \.\.\.))))
 '(cursor ((t (:background "OrangeRed"))))
 '(develock-whitespace-face-1 ((t (:background "dark red"))))
 '(font-lock-builtin-face ((((class color) (background dark)) (:foreground "white" :weight bold))))
 '(font-lock-comment-face ((((class color) (background dark)) (:foreground "DarkGray"))))
 '(font-lock-doc-face ((t (:background unspecified :foreground "white" :weight bold))))
 '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "SpringGreen1" :weight bold))))
 '(font-lock-keyword-face ((((class color) (background dark)) (:foreground "yellow" :weight bold))))
 '(font-lock-string-face ((((class color) (background dark)) (:foreground "blue"))))
 '(font-lock-type-face ((((class color) (background dark)) (:foreground "gold1" :weight bold))))
 '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "green1" :weight bold))))
 '(font-lock-warning-face ((t (:foreground "Red" :weight bold))))
 '(highlight ((((class color) (background dark)) (:background "grey22"))))
 '(trailing-whitespace ((((class color) (background dark)) (:background "dark red"))))
 '(woman-bold-face ((t (:foreground "red" :weight bold))))
 '(woman-italic-face ((t (:foreground "green" :underline unspecified :weight bold)))))

;;                                                                           ;;
; ---------------------------- end of view setup -----------------------------;
;;                                                                           ;;

;; load path
(setq load-path
      (cons (expand-file-name "~/.emacs.d/lisp") load-path))

;; Cyrillic-Linux-console specific
;; (unless window-system
;;   ; XXX was: now with LANG=en_US i use utf-8 by default in my linux text console
;;   (set-terminal-coding-system 'utf-8))
(when window-system
  ;; koi8-r x-window selections
  (set-selection-coding-system 'koi8-r))

;; -- load and setup useful things --
(load "ole-faces.el")

;; -- custom variables --
(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(add-log-full-name "Oleg Verych" t)
 '(add-log-mailing-address "olecom@is.from.by" t)
 '(c-basic-offset (quote set-from-style))
 '(c-echo-syntactic-information-p t)
 '(c-style-variables-are-local-p nil)
 '(case-fold-search nil)
 '(current-language-environment "UTF-8")
 '(global-cwarn-mode t nil (cwarn))
 '(global-font-lock-mode t nil (font-lock))
 '(hl-line-face (quote highlight))
 '(line-number-mode t)
 '(nxml-slash-auto-complete-flag t)
 '(show-paren-delay 0.1)
 '(show-paren-mode t nil (paren))
 '(show-trailing-whitespace t)
 '(tab-always-indent nil)
 '(transient-mark-mode t)
 '(truncate-partial-width-windows nil)
 '(vc-diff-switches (quote ("-purN")))
 '(vc-initial-comment t)
 '(whitespace-auto-cleanup t)
 '(whitespace-global-mode t nil (whitespace))
 '(woman-use-own-frame nil))

;; my emacs is multilingual environment
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8-unix)

;; Cyrillic input method: like ordinary russian keyboard
(set-input-method "cyrillic-jcuken")
(setq default-input-method "cyrillic-jcuken")

;; -- navigation keys --
;; unset

(global-unset-key (kbd "C-M-<down>"))
(global-unset-key (kbd "C-M-<up>"))
(global-unset-key (kbd "C-<down>"))
(global-unset-key (kbd "C-<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<up>"))
(global-unset-key "\C-z") ;; suppress hiding of frame, my favorite screen(1) key

;; restore Emacs's auto fill info page center-a-line key
(global-set-key "\M-s" 'center-line)

(unless window-system
  (global-set-key [f12] 'next-multiframe-window))
;; pretty nice 2 key window switch
(when window-system
  (global-set-key [f12] 'next-multiframe-window)
  (global-set-key [S-iso-lefttab] 'next-multiframe-window))

;; Benjamin Rutt's Emacs C development tips
(global-set-key [f9] 'compile)

;; paragraphs
(global-set-key (kbd "C-M-<down>") 'forward-paragraph-nomark)
(global-set-key (kbd "C-M-<up>") 'backward-paragraph-nomark)

;; good scrolling
(require 'ole-scroll)
(global-set-key (kbd "<down>") 'next-one-line)
(global-set-key (kbd "<up>") 'previous-one-line)
(global-set-key (kbd "C-<down>") 'next-one-line-cc)
(global-set-key (kbd "C-<up>") 'previous-one-line-cc)

;; -- more informative view --
(setq column-number-mode t)
;; cursor will stretch on tab symbols
(setq x-stretch-cursor t)
;; enabling indent with tabs
;(setq indent-tabs-mode t)

;; C modes indent tunning
(setq c-default-style
      '((c++-mode . "linux") (c-mode . "linux") (other . "gnu")))

(server-start)

;; replace this with revive!
(desktop-load-default)
(desktop-read)

; enabling feature
(put 'downcase-region 'disabled nil)

; unified defaults for diff
(setq diff-switches '("-uprN"))

; olecom's ~/.emacs ends Xep Bam

(put 'upcase-region 'disabled nil)
