;;; package --- init c
;;; Commentary:
                                        ; init c and c++ realate package
;;; Code:
(when (maybe-require-package 'cmake-mode)
  )

;;; install and config rtags.
(defun setup-flycheck-rtags ()
  (interactive)
  (if (not (or (equal major-mode 'php-mode) (equal major-mode 'java-mode) ) )
      (progn
        (message "not php-mode or java-mode init rtag flycheck")
        (define-key c-mode-base-map (kbd "M-.")
          (function rtags-find-symbol-at-point))
        (define-key c-mode-base-map (kbd "M-,")
          (function rtags-find-references-at-point))

        (flycheck-select-checker 'rtags)
        ;; RTags creates more accurate overlays.
        (setq-local flycheck-highlighting-mode nil)
        (setq-local flycheck-check-syntax-automatically nil)
        )

    (message "php-mode or java-mode do nothing")
    )


  )

(when (maybe-require-package 'rtags)
  ;; make sure you have company-mode installed
  (require 'company)
  ;; disable prelude's use of C-c r, as this is the rtags keyboard prefix
  ;;(define-key prelude-mode-map (kbd "C-c r") nil)
  ;; install standard rtags keybindings. Do M-. on the symbol below to
  ;; jump to definition and see the keybindings.
  (rtags-enable-standard-keybindings)
  ;; comment this out if you don't have or don't use helm
  ;; (setq rtags-use-helm t)
  ;; company completion setup
  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics)
  (setq rtags-completions-enabled t)
  (push 'company-rtags company-backends)
  (global-company-mode)
  (define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))
  ;; use rtags flycheck mode -- clang warnings shown inline
  (require-package 'flycheck-rtags)
  ;; c-mode-common-hook is also called by c++-mode
  (add-hook 'c-mode-common-hook #'setup-flycheck-rtags)



  )







(provide 'init-c)
;;; init-c.el ends here
