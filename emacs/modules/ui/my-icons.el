;;; icons.el --- Material icons -*- lexical-binding: t -*-

;; (use-package nerd-icons
;;   :if (display-graphic-p))

;; (use-package nerd-icons-dired
;;   :after nerd-icons
;;   :if (display-graphic-p)
;;   :hook (dired-mode . nerd-icons-dired-mode))

;; (use-package nerd-icons-completion
;;   :after (nerd-icons marginalia)
;;   :if (display-graphic-p)
;;   :config
;;   (nerd-icons-completion-mode 1))

;; (provide 'icons)
;;; icons.el ends here



;;; icons.el --- Material icons -*- lexical-binding: t -*-


(use-package all-the-icons
  :if (display-graphic-p))

(use-package nerd-icons)

(provide 'my-icons)
;;; icons.el ends here
