;;TODO init ggtags mode

(defun my-select-current-word ()
  "Select the word under cursor.
“word” here is considered any alphanumeric sequence with “_” or “-”."
  (interactive)
  (let (pt)
    (skip-chars-backward "-_A-Za-z0-9")
    (setq pt (point))
    (skip-chars-forward "-_A-Za-z0-9")
    (set-mark pt)))


(defun my-select-current-line ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position)))

(global-set-key (kbd "<f8>") 'my-select-current-word)

(setenv "GTAGSLIBPATH" "/home/sunkehui/workspace/svn/project_RecordPlatform/source/sms-project/sms-project/sms-live/sms-server-core:home/sunkehui/workspace/svn/project_RecordPlatform/source/sms-project/sms-project/sms-rtsp:/lib/modules/4.4.0-139-generic/build")


(setq my-jdb-sourcepath "/home/sunkehui/workspace/svn/project_RecordPlatform/source/sms-project/sms-project/sms-local-record/sms-local-boot/src/main/java:/home/sunkehui/workspace/svn/project_RecordPlatform/source/sms-project/sms-project/sms-live-httpflv/src:/home/sunkehui/workspace/svn/project_RecordPlatform/source/sms-project/sms-project/sms-live/sms-server-core/src")
(setq my-jdb-break "com.seaeagletech.sms.plugin.httpflv.HttpFlvServlet.doHandler")

(provide 'init-my)
