;;; rust.el --- Rust support -*- lexical-binding: t -*-

(use-package rust-mode
  :mode "\\.rs\\'"
  :config
  (setq rust-format-on-save t))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(provide 'rust)
;;; rust.el ends here
