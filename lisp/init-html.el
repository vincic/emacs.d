;;(require-package 'tidy)
;; this config from https://github.com/fxbois/web-mode/issues/872
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  :mode
  (("\\.erb\\'" . web-mode)
   ("\\.js\\'" . web-mode)
   ("\\.jsx$" . web-mode)
   ("\\.json\\'" . web-mode)
   ("\\.css\\'" . web-mode)
   ;; TODO: Fix flycheck in order to use web-mode with .scss files
   ;; ("\\.scss\\'" . web-mode)
   ("\\.less\\'" . web-mode)
   ("\\.html\\'" . web-mode)
   ("\\.tpl\\'" . web-mode)
   ("\\.hbs\\'" . web-mode))
  :custom
  ;; Some from https://github.com/fxbois/web-mode/issues/872#issue-219357898
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-script-padding 2)
  (web-mode-attr-indent-offset 2)
  (web-mode-enable-css-colorization t)
  (web-mode-enable-auto-quoting nil)
  (web-mode-enable-current-element-highlight t)

  ;; Indent inline JS/CSS within HTML
  ;; https://stackoverflow.com/a/36725155/3516664
  (web-mode-script-padding 2)
  (web-mode-style-padding 2)
  (web-mode-block-padding 2)
  (web-mode-comment-formats
   '(("java"       . "/*")
     ("javascript" . "//")
     ("php"        . "/*")
     ))
  :config
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-quotes" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
  (add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))

  ;;(define-key (current-local-map) (kbd "M-'") 'web-mode-comment-or-uncomment)

  (defun web-mode-tab-stop (width)
    "Set all web-mode tab stops to WIDTH in current buffer.

Inspired by https://www.emacswiki.org/emacs/TabStopList
and https://emacs.stackexchange.com/a/25046

This updates `tab-stop-list', but not `tab-width'."
    (interactive "new web-mode tab stop: ")
    (setq web-mode-markup-indent-offset width)
    (setq web-mode-css-indent-offset width)
    (setq web-mode-code-indent-offset width)))

(global-set-key (kbd "C-c C-r") 'mc/mark-sgml-tag-pair)

(provide 'init-html)
