;;; vertico.el --- Minibuffer completion -*- lexical-binding: t -*-

(use-package vertico
  :init
  (vertico-mode 1)
  :config
  (setq vertico-cycle t
        vertico-count 15))

(use-package orderless
  :config
  (setq completion-styles '(orderless basic)))

(use-package marginalia
  :init
  (marginalia-mode 1))

(use-package consult
  :bind
  (("C-s" . consult-line)
   ("C-S-f" . consult-ripgrep)
   ("C-x b" . consult-buffer)
   ("C-x p f" . consult-find)))

(use-package embark
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)))

(use-package embark-consult
  :after (embark consult))

(provide 'vertico)
;;; vertico.el ends here
