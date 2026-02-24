;;; theme.el --- Syntax theme only -*- lexical-binding: t -*-

;; ============ ESKİ TEMA (modus-vivendi) ============
;; (use-package modus-themes
;;   :config
;;   (setq modus-themes-org-blocks 'tinted-background)
;;   (load-theme 'modus-vivendi t)
;;   (set-face-background 'line-number nil)
;;   (set-face-background 'line-number-current-line nil))

;; ============ AKTİF TEMA (GitHub Dark) ============
(use-package autothemer)  ;; bağımlılık

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'github-dark t)
(set-face-background 'line-number nil)
(set-face-background 'line-number-current-line nil)

;; Rainbow delimiters - parantez renkleri
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Indent guides
(use-package indent-bars
  :straight (:host github :repo "jdtsmith/indent-bars")
  :hook (prog-mode . indent-bars-mode)
  :config
  (setq indent-bars-color '(highlight :face-bg t :blend 0.2)))

;; Centaur-tabs - VSCode benzeri tab bar
(use-package centaur-tabs
  :demand t
  :config
  (centaur-tabs-mode 1)
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-height 28)
  (setq centaur-tabs-set-bar 'under)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-modified-marker "●")
  ;; Sadece dosya buffer'larını göster
  (defun my/centaur-tabs-hide-tab (buffer)
    (let ((name (buffer-name buffer)))
      (or (string-prefix-p "*" name)
          (string-prefix-p " " name)
          (not (buffer-file-name buffer)))))
  (setq centaur-tabs-hide-tab-function #'my/centaur-tabs-hide-tab)
  ;; Dosya olmayan buffer'larda centaur-tabs kapalı olsun
  (setq centaur-tabs-buffer-list-function
        (lambda ()
          (seq-filter (lambda (b)
                        (and (buffer-file-name b)
                             (not (string-prefix-p " " (buffer-name b)))))
                      (buffer-list))))
  :bind
  (("M-S-<right>" . centaur-tabs-forward)
   ("M-S-<left>" . centaur-tabs-backward)))

(provide 'theme)
;;; theme.el ends here

