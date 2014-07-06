;;;; my font-lock styles and keywords

;;;; Time-stamp: <Sun Feb 12 15:07:13 EET 2006>
;;;; luzer:      <olecom@deen.dov.local>

(defface font-lock-syntax-face
  '((t (:foreground "magenta"))) "Commas, periods, etc.")
(defface font-lock-par-face
  '((t (:foreground "dodger blue" :weight bold))) "Brackes.")
(defface font-lock-fuck-face
  '((t (:foreground "orange red"))) "Assigment/changing (of lvalue).")
(defface font-lock-num-face
  '((t (:foreground "SeaGreen1"))) "Numbers.")

;
; Riastradh from <emacs@irc.freenode.net> helped with all kinds of LISP beauty.
;

(let ((big-fat-warning "\\(FIXME\\|XXX+\\|!!+\\)")
      (nice-note "\\(TODO\\|Note\\|NOTE\\)"))
  (dolist (mode '(c-mode c++-mode python-mode makefile-mode nxml-mode awk-mode
		  outline-mode emacs-lisp-mode text-mode html-mode))
    (font-lock-add-keywords mode `((,big-fat-warning 1 font-lock-warning-face t)
				   (,nice-note 1 font-lock-doc-face t)) nil)))

(let ((custom-c-faces
       '(;; custom defined faces using custom font-locks
	 ; Note: "-" minus(hyphen) inside of the set is last,
	 ;	     what is important to match it
	 ("\\([a-z0-9A-Z._>-]+\\)[ \t<>]*[><^|+&*/-]?=[^=]"
	  (1 'font-lock-fuck-face))
	 ; fucking like this: `dat_buf[i] = 0xFF;'
	 ("\\([a-z0-9A-Z._>-]+\\)\\[.+]\\([ \t<>]*[><^|+&-]?=[^=]\\)"
	  (1 'font-lock-fuck-face))
	 ; match fucking via ++ and -- with and without round brackets
	 ("\\(\\+\\+\\|--\\)+(*\\([a-z0-9A-Z._>-]+\\)"
	  (2 'font-lock-fuck-face))
	 ("\\([a-z0-9A-Z._>-]+\\)\\(\\[.+]\\)?)*\\(\\+\\+\\|--\\)+"
	  (1 'font-lock-fuck-face))
	 ; Note: one "'"; this may be not everywhere font-lockable already
	 ("\\([;,.]\\|->\\)"
	  (1 'font-lock-syntax-face t))
	 ; Note: first `]' in set to match itself
	 ("\\([][)(}{]\\)" . ''font-lock-par-face)
	 ; bin-dec
	 ("\\<[0-9]+\\>" . ''font-lock-num-face)
	 ; hex
	 ("\\<0x[0-9a-fA-F]+\\>" . ''font-lock-num-face)
	 ;; standard font-locks
	 ; asm keyword
	 ("\\<asm\\>" . font-lock-keyword-face)
	 ; Note: "-" minus(hyphen)
	 ("[|<>?:!~&^%*/+=-]" . font-lock-keyword-face))))
  (dolist (c-like-mode '(c-mode c++-mode))
    (font-lock-add-keywords c-like-mode custom-c-faces nil)))

;; some keywords for javascript
(font-lock-add-keywords
 'c-mode
 '(("\\<\\(new\\|delete\\|var\\|function\\|null\\|this\\|with\\|true\\|false\\|alert\\|try\\|catch\\|=\\)\\>" . font-lock-keyword-face)) nil)
