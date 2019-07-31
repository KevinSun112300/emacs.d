;;; package --- Summary
;;; Commentary:
;; package install eclim and company-emacs-eclim first
;;; Code:

(defun my-android-sdkmanager-list ()
  "sdkmanager list."
  (interactive "")
  (compile "sdkmanager --list --no_https ")

  )


(defun my-android-sdkmanager-install (packagename)
  "Execute a mvn exec:java goal for current file buffer."
  (interactive (list
                (read-string "package name :")))
  (compile (concat "sdkmanager --no_https \"" packagename "\"") )

  )

(defun my-android-aapt-genR ()
  "Execute aapt to generate R.java."
  (interactive "")
  (compile (concat "/opt/android-sdk-tools/build-tools/19.1.0/aapt"
                   " package"
                   " -f "
                   " -m "
                   " -J"
                   " ./src "
                   " -M "
                   "./AndroidManifest.xml"
                   " -S ./res"
                   " -I /opt/android-sdk-tools/platforms/android-19/android.jar") )

  )

(defun my-android-aapt-genapk ()
  "Execute aapt to package apk."
  (interactive "")
  (compile (concat "/opt/android-sdk-tools/build-tools/19.1.0/aapt"
                   " package"
                   " -f "
                   " -m "
                   " -F ./bin/hello.unaligned.apk"
                   " -M "
                   "./AndroidManifest.xml"
                   " -S ./res"
                   " -I /opt/android-sdk-tools/platforms/android-19/android.jar") )

  )

(defun my-android-project-compile ()
  "Compile project."
  (interactive "")
  (compile (concat "javac "
                   " -d obj"
                   " -classpath src "
                   " -bootclasspath "
                   " /opt/android-sdk-tools/platforms/android-19/android.jar"
                   " -source 1.7 -target 1.7"
                   " ./src/com/example/helloandroid/*.java") )

  )

(defun my-android-project-dex ()
  "dex project."
  (interactive "")
  (compile (concat "/opt/android-sdk-tools/build-tools/19.1.0/dx "
                   " --dex"
                   " --output=./bin/classes.dex"
                   " ./obj") )

  )


(provide 'init-android)
