(use-package flycheck
  :hook
  (prog-mode . flycheck-mode)
  :custom
  (flycheck-idle-change-delay 1.5)
  (flycheck-check-syntax-automatically '(idle-change mode-enabled))
  (flycheck-disabled-checkers '(emacs-lisp-checkdoc
                                rust-cargo
                                go-build
                                go-errcheck
                                go-gofmt
                                go-golint
                                go-megacheck
                                go-unconvert
                                go-vet
                                gometalinter
                                json-jsonlist
                                javascript-jshint)))

(use-package flycheck-posframe
  :hook
  (flycheck-mode . flycheck-posframe-mode))


(provide 'init-flycheck)
