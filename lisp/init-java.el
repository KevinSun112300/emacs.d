;;; Commentary:
;; package install eclim and company-emacs-eclim first
;;; Code:


(defun my-java-mode-hook ()
  (eclim-mode t)
  (custom-set-variables '(eclim-executable "~/.p2/pool/plugins/org.eclim_2.8.0/bin/eclim"))
  (company-emacs-eclim-setup)
  (setq help-at-pt-display-when-idle t)
  (setq help-at-pt-timer-delay 0.1)
  (help-at-pt-set-timer)
  (company-mode t)
  )
(when (maybe-require-package 'eclim)
  (when  (maybe-require-package 'company-emacs-eclim)
    (add-hook 'java-mode-hook 'my-java-mode-hook)
    )

  )

(provide 'init-java)
