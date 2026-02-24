;;; init.el --- Main configuration -*- lexical-binding: t -*-

;; Load path
(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "modules/ui" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "modules/editor" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "modules/completion" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "modules/tools" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "modules/lang" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "modules/org" user-emacs-directory))

;; ================================
;; CORE - Her zaman yükle
;; ================================
(require 'core-packages)
(require 'core-ui)
(require 'core-keybinds)

;; ================================
;; MODULES - Toggle et (comment ile kapat)
;; ================================

;; UI
(require 'theme)
(require 'modeline)
(require 'my-icons)
(require 'tabs)
(require 'my-treemacs)
(require 'dashboard)
(require 'minimap)

;; Editor
(require 'basics)
(require 'snippets)

;; Completion
(require 'vertico)
(require 'corfu)
(require 'lsp)
;; (require 'ai)  ;; Codeium kapalı
(require 'claude-ghost)  ;; Claude ghost text

;; Tools
(require 'projectile)
(require 'magit)
(require 'terminal)

;; Languages
(require 'python)
(require 'web)
(require 'rust)
(require 'markdown)

;; Org
(require 'org-config)

;; ================================
;; GC threshold normale döndür
;; ================================
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 16777216
                  gc-cons-percentage 0.1)))

(provide 'init)
;;; init.el ends here
