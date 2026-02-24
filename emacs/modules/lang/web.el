;;; web.el --- Web development -*- lexical-binding: t -*-

;; Tree-sitter grammar'larını otomatik indir
(use-package treesit-auto
  :config
  (setq treesit-auto-install 'prompt)
  (treesit-auto-add-to-auto-mode-alist '(typescript tsx html css))
  (global-treesit-auto-mode 1))

;; Tree-sitter modları
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-ts-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-ts-mode))

;; typescript-mode artık gerekli değil - typescript-ts-mode kullanılıyor

(use-package json-mode
  :mode "\\.json\\'")

(use-package yaml-mode
  :mode "\\.ya?ml\\'")

(provide 'web)
;;; web.el ends here
