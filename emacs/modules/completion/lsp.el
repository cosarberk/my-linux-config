;;; lsp.el --- LSP configuration -*- lexical-binding: t -*-

(use-package eglot
  :hook ((python-mode . eglot-ensure)
         (python-ts-mode . eglot-ensure)
         (js-mode . eglot-ensure)
         (js-ts-mode . eglot-ensure)
         (typescript-mode . eglot-ensure)
         (typescript-ts-mode . eglot-ensure)
         (tsx-ts-mode . eglot-ensure)
         (rust-mode . eglot-ensure)
         (rust-ts-mode . eglot-ensure)
         (go-mode . eglot-ensure)
         (go-ts-mode . eglot-ensure)
         (c-mode . eglot-ensure)
         (c-ts-mode . eglot-ensure)
         (c++-mode . eglot-ensure)
         (c++-ts-mode . eglot-ensure))
  :config
  (setq eglot-autoshutdown t
        eglot-events-buffer-size 0)
  ;; TSX için typescript-language-server (languageId otomatik doğru gider)
  (add-to-list 'eglot-server-programs
               '(tsx-ts-mode . ("typescript-language-server" "--stdio"))))

;; Flycheck
(use-package flycheck
  :init
  (global-flycheck-mode 1))

;; Eglot hatalarını flycheck'e yönlendir (minimap flycheck ile çalışıyor)
(use-package flycheck-eglot
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode 1))

;; Eldoc - sağ üstte göster
(use-package eldoc-box
  :hook (eglot-managed-mode . eldoc-box-hover-mode)
  :config
  (setq eldoc-box-position-function #'eldoc-box--default-at-point-position-function)
  (setq eldoc-box-clear-with-C-g t)
  ;; Sağ üst köşeye taşı
  (defun my/eldoc-box-position (width height)
    (let* ((frame-w (frame-pixel-width))
           (x (- frame-w width 20))
           (y 20))
      (cons x y)))
  (setq eldoc-box-position-function #'my/eldoc-box-position))

(provide 'lsp)
;;; lsp.el ends here
