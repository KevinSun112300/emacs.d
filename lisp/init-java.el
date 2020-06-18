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
(defun mvn-create-project-my (groupId artifacId archetypeArtifactId dir)
  "Create a maven project.  GROUPID ARTIFACID ARCHETYPEARTIFACTID DIR."
  (interactive (list
                (read-string "groupId:")
                (read-string "artifacId:")
                (completing-read "archetypeArtifactId:" '(
                                                          "maven-archetype-simple"
                                                          "maven-archetype-quickstart"
                                                          "maven-archetype-webapp")
                                 )
                (read-directory-name "project root dir:")
                ))
  (message (concat "going to create maven project with\n groupId: " groupId
                   "\nartifacId: "  artifacId
                   "\narchetypeArtifactId: " archetypeArtifactId))
  (let ((default-directory dir))
    (compile (concat "mvn " "archetype:generate -DgroupId="
                     groupId
                     " -DartifactId=" artifacId
                     " -DarchetypeArtifactId=" archetypeArtifactId
                     " -DinteractiveMode=false")  ))
  )

(defun mvn-unit-test-on-functionname ()
  "run mvn test on the function name of the test class,you must put the point on the funcion name ."
  (interactive)
  (save-excursion (let* ((bufferfilename (buffer-file-name))
                         (classname (car (split-string (car (last (split-string buffer-file-name  "/"))) "\\.")))
                         (function-name-begin (progn (skip-chars-backward "-_A-Za-z0-9") (point)))
                         (function-name-end (progn (skip-chars-forward "-_A-Za-z0-9") (point)))
                         (function-name (buffer-substring function-name-begin function-name-end)))
                    (mvn (concat  "test " "-Dtest=" classname "#" function-name)  )))

  )

(when (maybe-require-package 'gradle-mode)
  (maybe-require-package 'flycheck-gradle)

  )

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
