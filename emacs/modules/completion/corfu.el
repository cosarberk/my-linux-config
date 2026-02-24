;;; corfu.el --- In-buffer completion -*- lexical-binding: t -*-

;; Corfu - LSP popup için (eglot önerileri)
(use-package corfu
  :init
  (global-corfu-mode 1)
  :config
  (setq corfu-auto t
        corfu-auto-delay 0.05
        corfu-auto-prefix 1
        corfu-cycle t
        corfu-preselect 'prompt
        corfu-count 15
        corfu-scroll-margin 3))

;; Cape - ek completion kaynakları
(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))

;; Corfu için iconlar
(use-package nerd-icons-corfu
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(provide 'corfu)
;;; corfu.el ends here
