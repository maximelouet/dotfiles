(set-language-environment "UTF-8")
(setq emacs-lisp-dir "~/.emacs.d/"
      my-elmode-dir (concat emacs-lisp-dir "elmodes/"))
(setq load-path
      (append load-path (list my-elmode-dir)))

(load "std.el")
(load "std_comment.el")


;; Saumon

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(column-number-mode t)
(line-number-mode t)
(size-indication-mode t)
(global-linum-mode 1)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

(setq ring-bell-function 'ignore)


(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)
