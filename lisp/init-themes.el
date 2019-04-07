;;(require-package 'color-theme-sanityinc-solarized)
;;(require-package 'color-theme-sanityinc-tomorrow)

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(doom-tomorrow-night))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)


;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------
(defun light ()
  "Activate a light color theme."
  (interactive)
  (color-theme-sanityinc-solarized-light))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (color-theme-sanityinc-solarized-dark))


(use-package doom-themes
  :hook
  (after-init . (lambda () (load-theme 'doom-one t)))
  :config
  (defined-colors)
  :custom-face
  (hl-line                     ((t (:background "#21252b"))))
  (idle-highlight              ((t (:foreground "#ff8900"
                                                :background "#292c33"))))
  (ivy-minibuffer-match-face-1 ((t (:foreground "#92565c"))))
  (ivy-minibuffer-match-face-2 ((t (:foreground "#c678dd"))))
  (ivy-minibuffer-match-face-3 ((t (:foreground "#98be65"))))
  (ivy-minibuffer-match-face-4 ((t (:foreground "#ecbe7b"))))
  (sp-show-pair-match-face     ((t (:foreground "#ff8900"
                                                :background "#292c33"))))
  (whitespace-trailing         ((t (:background "#ff0000"))))
  (whitespace-tab              ((t (:background "#21252b")))))

(use-package doom-modeline
  :hook
  (after-init . doom-modeline-mode))

(provide 'init-themes)
