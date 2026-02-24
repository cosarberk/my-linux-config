;;; core-packages.el --- Package management -*- lexical-binding: t -*-

;; straight.el bootstrap
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; use-package entegrasyonu
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
(setq use-package-always-ensure t)

;; no-littering - dosyaları düzenli tut
(use-package no-littering
  :config
  (setq no-littering-etc-directory (expand-file-name "etc/" user-emacs-directory))
  (setq no-littering-var-directory (expand-file-name "var/" user-emacs-directory)))

;; BACKUP DOSYALARI TAMAMEN KAPAT
(setq make-backup-files nil)           ; ~ dosyaları yok
(setq auto-save-default nil)           ; #file# dosyaları yok
(setq create-lockfiles nil)            ; .#file dosyaları yok

(provide 'core-packages)
;;; core-packages.el ends here
