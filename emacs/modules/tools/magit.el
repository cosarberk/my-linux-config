;;; magit.el --- Git integration -*- lexical-binding: t -*-

(use-package magit
  :bind
  (("C-x g" . magit-status)
   ("C-x G" . magit-dispatch)))

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.5))

(use-package git-timemachine)

(provide 'magit)
;;; magit.el ends here
