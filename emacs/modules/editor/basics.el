;;; basics.el --- Basic editor features -*- lexical-binding: t -*-

;; Auto pair
(use-package smartparens
  :hook (prog-mode . smartparens-mode)
  :config
  (require 'smartparens-config))

;; Undo tree
(use-package undo-tree
  :config
  (global-undo-tree-mode 1)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/var/undo")))
  (setq undo-tree-auto-save-history nil))

;; Multiple cursors
(use-package multiple-cursors
  :bind
  (("C-d" . mc/mark-next-like-this)
   ("C-S-d" . mc/mark-all-like-this)
   ("C-M-d" . mc/mark-previous-like-this)))

;; Expand region
(use-package expand-region
  :bind
  (("C-=" . er/expand-region)))

;; Super-save - agresif otomatik kaydetme
(use-package super-save
  :config
  (setq super-save-auto-save-when-idle t)
  (setq super-save-idle-duration 0.5)
  (setq super-save-remote-files nil)
  (super-save-mode 1))

(provide 'basics)
;;; basics.el ends here
