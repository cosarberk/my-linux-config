;;; core-keybinds.el --- Global keybindings -*- lexical-binding: t -*-

;; Which-key - kısayolları göster
(use-package which-key
  :config
  (which-key-mode 1)
  (setq which-key-idle-delay 0.3))

;; CUA mode - kapalı (Emacs tuşları korunsun)
;; (cua-mode 1)

;; Copy/Paste - Ctrl+Shift ile
(global-set-key (kbd "C-S-c") 'kill-ring-save)   ;; kopyala
(global-set-key (kbd "C-S-x") 'kill-region)       ;; kes
(global-set-key (kbd "C-S-v") 'yank)              ;; yapıştır

;; Temel kısayollar
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-s") 'write-file)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'undo-redo)
;; (global-set-key (kbd "C-a") 'mark-whole-buffer)  ;; kapalı - C-a satır başı olsun
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-h") 'query-replace)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-l") 'goto-line)

;; Buffer/Window
(global-set-key (kbd "C-w") 'kill-current-buffer)
;; Tab gezme centaur-tabs'ta tanımlı (M-S-left/right)

;; Pencereler arası gezme (C-yön tuşları)
(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<down>") 'windmove-down)

;; Pencere boyutlandırma (C-S-yön tuşları)
(global-set-key (kbd "C-S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-S-<up>") 'shrink-window)
(global-set-key (kbd "C-S-<down>") 'enlarge-window)

;; Satır taşıma
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

;; Satır çoğaltma
(defun duplicate-line ()
  (interactive)
  (let ((line (thing-at-point 'line t)))
    (end-of-line)
    (newline)
    (insert line)
    (forward-line -1)))

(global-set-key (kbd "C-S-d") 'duplicate-line)

(provide 'core-keybinds)
;;; core-keybinds.el ends here
