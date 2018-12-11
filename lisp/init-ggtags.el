;;TODO init ggtags mode
(when (maybe-require-package 'ggtags)
  (setenv "GTAGSTHROUGH" "true")
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'php-mode)
                (ggtags-mode 1))))


  )
(provide 'init-ggtags)
