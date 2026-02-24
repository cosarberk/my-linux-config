;;; snippets.el --- Code snippets -*- lexical-binding: t -*-

(use-package yasnippet
  :hook (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all))

(use-package yasnippet-snippets
  :after yasnippet)

(provide 'snippets)
;;; snippets.el ends here
