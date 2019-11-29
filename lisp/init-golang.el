(use-package go-projectile
  :custom
  (go-projectile-switch-gopath 'never)
  :config
  (mapc (lambda (tool)
          (add-to-list 'go-projectile-tools tool))
        '((golangci-lint   . "github.com/golangci/golangci-lint/cmd/golangci-lint")
          (bingo           . "github.com/saibing/bingo")
          (goreturns       . "github.com/sqs/goreturns")
          (dlv             . "github.com/go-delve/delve/cmd/dlv")))
  (go-projectile-tools-add-path))

(use-package gotest
  :requires
  (go-mode)
  :bind
  (:map go-mode-map
        ("C-c C-t r" . go-run)
        ("C-c C-t t" . go-test-current-test)
        ("C-c C-t f" . go-test-current-file)
        ("C-c C-t p" . go-test-current-project)
        ("C-c C-t c" . go-test-current-coverage)
        ("C-c C-b b" . go-test-current-benchmark)
        ("C-c C-b f" . go-test-current-file-benchmarks)
        ("C-c C-b p" . go-test-current-project-benchmarks))
  :custom
  (go-test-verbose t))

(defconst custom-go-style
  '((tab-width . 2)))

(use-package go-mode
  :config
  (c-add-style "custom-go-style" custom-go-style)
  :hook
  (go-mode . flycheck-mode)
  (go-mode . lsp)
  (before-save . gofmt-before-save)
  :custom
  (gofmt-command "goreturns"))

(provide 'init-golang)
