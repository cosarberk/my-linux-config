;;; my-treemacs.el --- File tree sidebar -*- lexical-binding: t -*-

(use-package treemacs
  :demand t  ;; Hemen yükle, defer etme
  :config
  (setq treemacs-width 30
        treemacs-position 'left
        treemacs-show-hidden-files t
        treemacs-follow-after-init t
        treemacs-expand-after-init t)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (add-hook 'treemacs-mode-hook (lambda () (display-line-numbers-mode -1)))
  :bind
  (("C-b" . treemacs)
   ("C-S-b" . treemacs-select-window)
   ("C-S-o" . treemacs-select-directory)))

;; Nerd icons teması
(use-package treemacs-nerd-icons
  :after treemacs
  :demand t
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package treemacs-projectile
  :after (treemacs projectile))

;; Başlangıçta treemacs'ı aç
(add-hook 'emacs-startup-hook #'treemacs)

(provide 'my-treemacs) 
;;; my-treemacs.el ends here
