;;; Commentary:
;; package install eclim and company-emacs-eclim first
;;; Code:

;;eclim
(defun my-java-mode-hook ()
  "Init for eclim."

  (setq help-at-pt-display-when-idle t)
  (setq help-at-pt-timer-delay 0.1)
  (help-at-pt-set-timer)

  )
(when (maybe-require-package 'eclim)
  (when  (maybe-require-package 'company-emacs-eclim)
    (global-eclim-mode)
    (global-company-mode)

    (company-emacs-eclim-setup)
    (custom-set-variables
     '(eclim-eclipse-dirs '("/home/sunkehui/eclipse/java-2018-09/eclipse"))
     '(eclim-executable "~/.p2/pool/plugins/org.eclim_2.8.0/bin/eclim")
     )



    (add-hook 'java-mode-hook 'my-java-mode-hook)
    )

  )


;;meghanada
;; (when (maybe-require-package 'meghanada)

;;   (add-hook 'java-mode-hook
;;             (lambda ()
;;               ;; meghanada-mode on
;;               (meghanada-mode t)
;;               (flycheck-mode +1)
;;               (setq c-basic-offset 2)
;;               ;; use code format
;;               ;;(add-hook 'before-save-hook 'meghanada-code-beautify-before-save)
;;               ))
;;   (cond
;;    ((eq system-type 'windows-nt)
;;     (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
;;     (setq meghanada-maven-path "mvn.cmd"))
;;    (t
;;     (setq meghanada-java-path "java")
;;     (setq meghanada-maven-path "mvn")))


;;   )









;; (when (require-package 'lsp-mode)
;;   (setq lsp-eldoc-render-all nil
;;         lsp-highlight-symbol-at-point nil)
;;   (when (require-package 'lsp-ui)
;;     (setq lsp-ui-sideline-update-mode 'point)

;;     )
;;   (when (require-package 'company-lsp)
;;     (setq company-lsp-cache-candidates t
;;           company-lsp-async t)

;;     )
;;   (when (require-package 'lsp-java)
;;     (require 'lsp-java)
;;     (add-hook 'java-mode-hook
;;               (lambda ()
;;                 (setq-local company-backends (list 'company-lsp))))

;;     (add-hook 'java-mode-hook 'lsp-java-enable)
;;     (add-hook 'java-mode-hook 'flycheck-mode)
;;     (add-hook 'java-mode-hook 'company-mode)
;;     (add-hook 'java-mode-hook 'lsp-ui-mode))


;;   )




(provide 'init-java)
