;;; terminal.el --- Terminal emulator -*- lexical-binding: t -*-

(use-package vterm
  :config
  (setq vterm-max-scrollback 10000)
  :bind
  (("C-`" . vterm-toggle)))

(use-package vterm-toggle
  :after vterm)

(provide 'terminal)
;;; terminal.el ends here
