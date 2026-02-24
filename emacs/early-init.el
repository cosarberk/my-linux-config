;;; early-init.el --- Early initialization -*- lexical-binding: t -*-

;; Garbage collection - başlangıçta yüksek tut, sonra düşür
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Native comp uyarılarını sustur
(setq native-comp-async-report-warnings-errors 'silent)

;; Package.el devre dışı (straight.el kullanacağız)
(setq package-enable-at-startup nil)

;; UI elementlerini erken kapat (hız için)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Frame boyutu
(push '(width . 120) default-frame-alist)
(push '(height . 40) default-frame-alist)

;; Startup mesajlarını kapat
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(provide 'early-init)
;;; early-init.el ends here
