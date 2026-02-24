;;; minimap.el --- Code minimap -*- lexical-binding: t -*-

(use-package minimap
  :config
  (setq minimap-window-location 'right
        minimap-width-fraction 0.1
        minimap-minimum-width 15
        minimap-major-modes '(prog-mode text-mode))

  ;; Active region şeffaf yap
  (custom-set-faces
   '(minimap-active-region-background
     ((t (:background nil :extend t)))))

  ;; Flycheck/Flymake error renkleri (sadece minimap için)
  (defface minimap-flycheck-error
    '((t (:background "#f85149")))
    "Minimap error face")
  (defface minimap-flycheck-warning
    '((t (:background "#d29922")))
    "Minimap warning face")
  (defface minimap-flycheck-info
    '((t (:background "#58a6ff")))
    "Minimap info face")

  ;; Overlay sync'i override et - flycheck overlay'lerine renk ekle
  (defun my/minimap-sync-overlays-advice (orig-fun &rest args)
    (apply orig-fun args)
    (when (and minimap-mode (minimap-active-current-buffer-p))
      (with-current-buffer minimap-active-buffer
        (dolist (ov (overlays-in (point-min) (point-max)))
          (when (or (overlay-get ov 'flycheck-overlay)
                    (overlay-get ov 'flymake-overlay))
            (let* ((cat (overlay-get ov 'category))
                   (face (cond
                          ((memq cat '(flycheck-error-overlay flymake-error)) 'minimap-flycheck-error)
                          ((memq cat '(flycheck-warning-overlay flymake-warning)) 'minimap-flycheck-warning)
                          ((memq cat '(flycheck-info-overlay flymake-note)) 'minimap-flycheck-info))))
              (when face
                (with-current-buffer minimap-buffer-name
                  (let ((mov (make-overlay (overlay-start ov) (overlay-end ov))))
                    (overlay-put mov 'face face)
                    (overlay-put mov 'priority 10))))))))))

  (advice-add 'minimap-sync-overlays :around #'my/minimap-sync-overlays-advice)

  ;; Otomatik aç
  (minimap-mode 1)

  :bind
  (("C-M-m" . minimap-mode)))

(provide 'minimap)
;;; minimap.el ends here
