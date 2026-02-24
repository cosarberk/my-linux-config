;;; python.el --- Python support -*- lexical-binding: t -*-

(use-package python-mode
  :mode "\\.py\\'"
  :config
  (setq python-indent-offset 4))

(use-package pyvenv
  :hook (python-mode . pyvenv-mode))

(provide 'python)
;;; python.el ends here
