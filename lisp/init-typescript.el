;; (maybe-require-package 'tide)
;; (maybe-require-package 'tss)
(maybe-require-package 'typescript-mode)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1)
  (local-set-key (kbd "<s-backspace>") 'tide-fix))

(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0.1)
;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;;(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; formats the buffer before saving
;;(add-hook 'before-save-hook 'tide-format-before-save)
;; format options
;;(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))

(use-package lsp-mode
  :custom
  (lsp-prefer-flymake nil)
  (lsp-auto-guess-root t)
  :bind
  (:map lsp-mode-map
        ("C-c C-r" . lsp-rename))
        ([remap typescript-find-symbol] . lsp-goto-implementation))

(use-package lsp-ui
  :commands
  (lsp-ui-mode)
  :custom
  (lsp-ui-doc-use-webkit nil)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-max-width 100)
  (lsp-ui-doc-max-height 100)
  (lsp-ui-sideline-enable nil)
  (lsp-ui-flycheck-enable t)
  :bind
  (:map lsp-ui-mode-map
        ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
        ([remap xref-find-references] . lsp-ui-peek-find-references)))

(use-package typescript-mode
  :hook
  (typescript-mode . lsp))

(use-package company-lsp :commands company-lsp)

(use-package projectile
  :bind
  (:map projectile-mode-map
        ("C-c p" . projectile-command-map)))

(provide 'init-typescript)
