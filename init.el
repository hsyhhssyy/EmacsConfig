;; This is EMACS configuration file
;; To let emacs find this file, in Windows:
;; Just put .emacs.d (The SVN root folder, rename it please) folder under %emac_dir% and set
;; HKEY_LOCAL_MACHINE\SOFTWARE\GNU\Emacs\HOME=%emacs_dir%
;; In linux, put .emacs.d under HOME

;;Uncomment the following line to byte compile every necessary files (usually after re-install)
;;(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "Chinese-GB")
 '(inhibit-startup-screen t))

;;中文与外文字体设置
;; Setting English Font
(set-face-attribute
'default nil :font "Source Code Pro")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "微软雅黑" :size 14)))

;;----添加 Marmalade 到 package-archives  ---
;;----添加 MELPA 到 package-archives ---
(require 'package)
;;(add-to-list 'package-archives 
;;    '("marmalade" .
;;      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;----------启动auto-complete-----------
(require 'auto-complete-config)
(ac-config-default)
(require 'ac-etags)

;;---------Smex,一个对M-x的增强插件-----
(autoload 'smex "smex"
  "Smex is a M-x enhancement for Emacs, it provides a convenient interface to
your recently and most frequently used commands.")
(global-set-key (kbd "M-x") 'smex)
(defadvice smex (around space-inserts-hyphen activate compile)
        (let ((ido-cannot-complete-command 
               `(lambda ()
                  (interactive)
                  (if (string= " " (this-command-keys))
                      (insert ?-)
                    (funcall ,ido-cannot-complete-command)))))
          ad-do-it))

;;---------设置代理-----------
(defvar reuters-http-proxy "10.40.14.56:80") 
 ;;;###autoload 
 (defun hsy-toggle-proxy (force) 
   "Toggle proxy. With prefix, set proxy on." 
   (interactive "P") 
   (if (or force 
           (not (getenv "http_proxy"))) 
       (progn 
         (setenv "http_proxy" reuters-http-proxy) 
         (message "proxy set to %s" (getenv "http_proxy"))) 
     (setenv "http_proxy" nil) 
     (message "proxy off"))) 

;;---------Windows Only---仅限Windows------------------

;;-----powershell.el (elpa)，可以启动Windows Powershell--
(autoload 'powershell "powershell" "Start a interactive shell of PowerShell." t)
;;--powershell-mode.el (elpa)，为Powershell脚本文件提供mode支持-
(autoload 'powershell-mode "powershell-mode" "A editing mode for Microsoft PowerShell." t)
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode)) 
;; PowerShell script


;;---------Unix Like Only---仅限Unix类系统------------------
