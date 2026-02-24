;;; markdown.el --- Markdown editing with live preview -*- lexical-binding: t -*-

;; Markdown mode
(use-package markdown-mode
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  ;; cmark-gfm - GitHub'ın resmi parser'ı (offline, hızlı)
  (setq markdown-command "cmark-gfm -e table -e strikethrough -e autolink -e tasklist -e tagfilter")
  ;; Preview penceresi sağda açılsın
  (setq markdown-split-window-direction 'right)
  ;; Fontify kod bloklarını
  (setq markdown-fontify-code-blocks-natively t)
  ;; Header scaling
  (setq markdown-header-scaling t)
  :config
  ;; Live preview için inline CSS (offline)
  (setq markdown-css-paths nil)
  (setq markdown-xhtml-header-content
        "<style>
         body { box-sizing: border-box; min-width: 200px; max-width: 980px; margin: 0 auto; padding: 45px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif; font-size: 16px; line-height: 1.5; color: #24292f; }
         h1, h2, h3, h4, h5, h6 { margin-top: 24px; margin-bottom: 16px; font-weight: 600; line-height: 1.25; }
         h1 { font-size: 2em; border-bottom: 1px solid #d0d7de; padding-bottom: .3em; }
         h2 { font-size: 1.5em; border-bottom: 1px solid #d0d7de; padding-bottom: .3em; }
         code { background-color: #f6f8fa; padding: .2em .4em; border-radius: 6px; font-size: 85%; }
         pre { background-color: #f6f8fa; padding: 16px; border-radius: 6px; overflow: auto; }
         pre code { background: none; padding: 0; }
         blockquote { padding: 0 1em; color: #57606a; border-left: .25em solid #d0d7de; margin: 0; }
         table { border-collapse: collapse; width: 100%; }
         th, td { border: 1px solid #d0d7de; padding: 6px 13px; }
         tr:nth-child(2n) { background-color: #f6f8fa; }
         a { color: #0969da; text-decoration: none; }
         img { max-width: 100%; }
         ul.task-list { list-style: none; padding-left: 0; }
         .task-list-item input { margin-right: 8px; }
         @media (prefers-color-scheme: dark) { body { background-color: #0d1117; color: #c9d1d9; } h1, h2 { border-color: #30363d; } code, pre { background-color: #161b22; } blockquote { color: #8b949e; border-color: #30363d; } th, td { border-color: #30363d; } tr:nth-child(2n) { background-color: #161b22; } a { color: #58a6ff; } }
         </style>"))

;; Grip mode - GitHub tarzı preview (isteğe bağlı)
;; Not: grip kurulu olmalı (pip install grip)
;; (use-package grip-mode
;;   :hook (markdown-mode . grip-mode))

;; Markdown'da yazdıkça anlık preview için kısayol
(defun my/markdown-live-preview-split ()
  "Markdown dosyasını yan yana live preview ile aç."
  (interactive)
  (unless (derived-mode-p 'markdown-mode)
    (markdown-mode))
  (markdown-live-preview-mode 1)
  ;; Pencere düzenini ayarla - edit solda, preview sağda
  (when (get-buffer "*eww*")
    (let ((preview-window (get-buffer-window "*eww*")))
      (when preview-window
        (select-window preview-window)
        (balance-windows)))))

;; Keybinding
(with-eval-after-load 'markdown-mode
  (define-key markdown-mode-map (kbd "C-c C-v") #'my/markdown-live-preview-split))

(provide 'markdown)
;;; markdown.el ends here
