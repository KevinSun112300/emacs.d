;;; package --- Summary
;;; Commentary:
;; package install eclim and company-emacs-eclim first
;;; Code:

(require-package 'mvn)


(defun mvn-run-class-my ()
  "Execute a mvn exec:java goal for current file buffer."
  (interactive "")

  (let* ((package (save-excursion
                    (goto-char (point-min))
                    (when (re-search-forward "^\\s *package\\s +\\(.*\\);" (point-max) t)
                      (match-string 1)))
                  )
         (className (file-name-sans-extension
                     (file-name-nondirectory (buffer-file-name))))
         )
    (if package
        (mvn (concat "exec:java -Dexec.mainClass=" package "." className))
      (message "can not read package from this buffer"))
    ))

;;eclim
;; (defun my-java-mode-hook ()
;;   "Init for eclim."

;;   (setq help-at-pt-display-when-idle t)
;;   (setq help-at-pt-timer-delay 0.1)
;;   (help-at-pt-set-timer)

;;   )
;; (when (maybe-require-package 'eclim)
;;   (when  (maybe-require-package 'company-emacs-eclim)
;;     (global-eclim-mode)
;;     (global-company-mode)

;;     (company-emacs-eclim-setup)
;;     (custom-set-variables
;;      '(eclim-eclipse-dirs '("/home/sunkehui/eclipse/java-2018-09/eclipse"))
;;      '(eclim-executable "~/.p2/pool/plugins/org.eclim_2.8.0/bin/eclim")
;;      )



;;     (add-hook 'java-mode-hook 'my-java-mode-hook)
;;     )

;;   )






;;meghanada
(when (maybe-require-package 'meghanada)

  (add-hook 'java-mode-hook
            (lambda ()
              ;; meghanada-mode on
              (meghanada-mode t)
              (flycheck-mode +1)
              (setq c-basic-offset 2)
              ;; use code format
              ;;(add-hook 'before-save-hook 'meghanada-code-beautify-before-save)
              ))
  (cond
   ((eq system-type 'windows-nt)
    (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
    (setq meghanada-maven-path "mvn.cmd"))
   (t
    (setq meghanada-java-path "java")
    (setq meghanada-maven-path "mvn")))


  )










(provide 'init-java)
