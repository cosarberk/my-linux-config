;;; modeline.el --- Modeline config -*- lexical-binding: t -*-

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-height 30
        doom-modeline-bar-width 4
        doom-modeline-icon t
        doom-modeline-major-mode-icon t
        doom-modeline-buffer-file-name-style 'truncate-upto-project
        doom-modeline-buffer-encoding nil
        doom-modeline-minor-modes nil))

(provide 'modeline)
;;; modeline.el ends here
