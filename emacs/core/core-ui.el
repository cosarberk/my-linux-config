;;; core-ui.el --- Core UI settings -*- lexical-binding: t -*-

;; Font
(set-face-attribute 'default nil
                    :family "JetBrainsMono Nerd Font"
                    :height 110)

;; Line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type t)  ;; normal satır numaraları (relative değil)

;; Highlight current line
(global-hl-line-mode 1)

;; Parantez eşleştirme
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Seçimi highlight et
(transient-mark-mode 1)

;; Satır ve sütun numarası modeline
(line-number-mode 1)
(column-number-mode 1)

;; Word wrap
(global-visual-line-mode 1)

;; Tab genişliği
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; Scroll ayarları
(setq scroll-margin 3
      scroll-conservatively 101
      scroll-preserve-screen-position t)

;; Bell kapalı
(setq ring-bell-function 'ignore)

;; Yes/no yerine y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; UTF-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

;; Sistem clipboard entegrasyonu
(setq select-enable-clipboard t)
(setq select-enable-primary t)

;; Sistem teması kullan (GTK)
(setq frame-background-mode 'dark)

(provide 'core-ui)
;;; core-ui.el ends here


;; Otomatik window split yapmasın
(setq split-height-threshold nil)
(setq split-width-threshold nil)

;; Warning/Messages buffer açılmasın
(setq warning-minimum-level :error)
(add-hook 'after-init-hook (lambda ()
  (when (get-buffer "*Warnings*") (kill-buffer "*Warnings*"))
  (when (get-buffer "*Messages*") (kill-buffer "*Messages*"))
  (when (get-buffer "*Async-native-compile-log*") (kill-buffer "*Async-native-compile-log*"))
  (when (get-buffer "*straight-process*") (kill-buffer "*straight-process*"))
  (when (get-buffer "*straight-byte-compilation*") (kill-buffer "*straight-byte-compilation*"))
  (delete-other-windows)))
