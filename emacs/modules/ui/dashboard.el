;;; dashboard.el --- Welcome screen -*- lexical-binding: t -*-

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to Emacs"
        dashboard-startup-banner "~/.emacs.d/banner.jpeg"
        dashboard-center-content t
        dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-items '((recents . 10)
                          (projects . 5)
                          (bookmarks . 5))))

(provide 'dashboard)
;;; dashboard.el ends here
