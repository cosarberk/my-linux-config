;;; org-config.el --- Org mode config -*- lexical-binding: t -*-

(use-package org
  :config
  (setq org-directory "~/Org"
        org-default-notes-file "~/Org/notes.org"
        org-startup-indented t
        org-hide-leading-stars t
        org-pretty-entities t))

(use-package org-modern
  :hook (org-mode . org-modern-mode))

(provide 'org-config)
;;; org-config.el ends here
