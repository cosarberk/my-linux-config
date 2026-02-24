;;; claude-ghost.el --- AI ghost text completion -*- lexical-binding: t -*-

;; gptel - Gemini backend
(use-package gptel
  :config
  ;; Google Gemini API
  (setq gptel-model 'gemini-2.5-flash)
  (setq gptel-backend
        (gptel-make-gemini "Gemini"
          :stream t
          :key "AIzaSyBL1jfbQc2Dfbgm9z9g-EtSNrj3kSFVHuA")))

;; gptel-autocomplete - Ghost text
(use-package gptel-autocomplete
  :straight (:host github :repo "JDNdeveloper/gptel-autocomplete")
  :after gptel
  :config
  (setq gptel-autocomplete-auto-trigger t)
  (setq gptel-autocomplete-trigger-delay 0.5)
  (setq gptel-autocomplete-temperature 0.1))

;; Kendi minor mode'umuzu yazalım
(defvar claude-ghost-timer nil "Timer for Claude ghost completion.")

(defun claude-ghost-trigger ()
  "Trigger Claude ghost completion after idle."
  (when claude-ghost-timer
    (cancel-timer claude-ghost-timer))
  (setq claude-ghost-timer
        (run-with-idle-timer 0.8 nil #'gptel-complete)))

;; TAB ile ghost kabul et veya normal indent
(defun my/ghost-tab ()
  "Accept ghost completion or indent."
  (interactive)
  (if (and (bound-and-true-p gptel--completion-overlay)
           (overlayp gptel--completion-overlay))
      (gptel-accept-completion)
    (indent-for-tab-command)))

(define-minor-mode claude-ghost-mode
  "Minor mode for Claude ghost text completion."
  :lighter " AI"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "TAB") #'my/ghost-tab)
            (define-key map (kbd "<tab>") #'my/ghost-tab)
            (define-key map (kbd "C-<return>") #'gptel-accept-completion)
            (define-key map (kbd "C-g") #'gptel-clear-completion)
            map)
  (if claude-ghost-mode
      (add-hook 'post-self-insert-hook #'claude-ghost-trigger nil t)
    (remove-hook 'post-self-insert-hook #'claude-ghost-trigger t)
    (when claude-ghost-timer
      (cancel-timer claude-ghost-timer))))

;; Prog-mode'da otomatik aç
(add-hook 'prog-mode-hook #'claude-ghost-mode)

(provide 'claude-ghost)
;;; claude-ghost.el ends here
