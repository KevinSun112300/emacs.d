;;; package --- Summary
;;; Commentary:
;; package install eclim and company-emacs-eclim first
;;; Code:

(require-package 'yasnippet)


;;; global mode open
(yas-global-mode 1)

;;; if you do not want global mode add this code to you prog-mode-hook
;; (yas-reload-all)
;; (add-hook 'prog-mode-hook #'yas-minor-mode)

;;; yas-snippet-dirs point to snippets dir

;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/snippets"                 ;; personal snippets
;;         "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
;;         "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
;;         ))


;;; M-x yas-reload-all refrash snippets

;;; install snippets
(maybe-require-package 'java-snippets)


(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
