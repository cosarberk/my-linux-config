;;; projectile.el --- Project management -*- lexical-binding: t -*-

(use-package projectile
  :init
  (projectile-mode 1)
  :config
  (setq projectile-project-search-path '("~/Projects" "~/Work"))
  :bind-keymap
  ("C-c p" . projectile-command-map))

;; Eglot için proje algılama - package.json olan yer proje kökü
(defun my/project-find-root (dir)
  (when-let ((root (locate-dominating-file dir "package.json")))
    (cons 'transient root)))

(add-to-list 'project-find-functions #'my/project-find-root)

(provide 'projectile)
;;; projectile.el ends here
