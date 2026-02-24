;;; tabs.el --- Tab bar config -*- lexical-binding: t -*-

(use-package centaur-tabs
  :hook (after-init . centaur-tabs-mode)
  :config
  (setq centaur-tabs-style "bar"
        centaur-tabs-height 32
        centaur-tabs-set-icons t
        centaur-tabs-set-bar 'under
        centaur-tabs-set-modified-marker t
        centaur-tabs-modified-marker "●"
        centaur-tabs-gray-out-icons 'buffer)
  :bind
  (("C-<prior>" . centaur-tabs-backward)
   ("C-<next>" . centaur-tabs-forward)))

(provide 'tabs)
;;; tabs.el ends here
