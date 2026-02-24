;;; ai.el --- AI code completion with ghost text -*- lexical-binding: t -*-

;; Codeium paketini yükle
(use-package codeium
  :straight '(:type git :host github :repo "Exafunction/codeium.el")
  :demand t
  :config
  (setq codeium/metadata/api_key "sk-ws-01-tBpdhs-ys9jiQpO-o-nhA7MC6uAoQFHml2wUBFZ1cwvD1OiMIMGmj6f7K9rWwfFm-8G5fal56HNcJ33ti1L9GTK4vOpEKA"))

;; Company mode - SADECE ghost text için (popup yok)
(use-package company
  :config
  ;; Sadece preview (ghost text), popup yok
  (setq company-frontends '(company-preview-frontend))
  (setq company-minimum-prefix-length 2
        company-idle-delay 0.3
        ;; Sadece codeium backend
        company-backends '((company-capf :with company-yasnippet))))

;; Codeium minor mode
(define-minor-mode my/codeium-ghost-mode
  "Ghost text mode for Codeium AI completions."
  :lighter " Ghost"
  :global nil
  (if my/codeium-ghost-mode
      (progn
        ;; Codeium'u SONA ekle, eglot'u silme
        (add-to-list 'completion-at-point-functions #'codeium-completion-at-point t)
        ;; Company'yi aç (sadece ghost için)
        (company-mode 1))
    (progn
      (setq completion-at-point-functions
            (remove #'codeium-completion-at-point completion-at-point-functions))
      (company-mode -1))))

;; TAB ile ghost text kabul
(defun my/accept-ghost-or-indent ()
  "Accept company preview or indent."
  (interactive)
  (if (company-preview-common--active-p)
      (company-complete-selection)
    (indent-for-tab-command)))

;; Ghost şimdilik kapalı - manuel açmak için: M-x my/codeium-ghost-mode
;; (add-hook 'prog-mode-hook #'my/codeium-ghost-mode)

;; TAB tuşu
(with-eval-after-load 'company
  (define-key company-mode-map (kbd "TAB") #'my/accept-ghost-or-indent)
  (define-key company-mode-map (kbd "<tab>") #'my/accept-ghost-or-indent))

(provide 'ai)
;;; ai.el ends here
