(use-package recentf
  :custom
  (recentf-case-fold-search t)
  (recentf-max-saved-items 2000)
  (recentf-exclude '("/tmp/" "/ssh:"))
  (recentf-save-file "~/.emacs.d/var/recentf.el"))

(provide 'init-recentf)
;;; init-recentf.el ends here
