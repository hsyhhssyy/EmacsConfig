;; This is EMACS configuration file
;; To let emacs find this file, in Windows:
;; Just put .emacs.d (The SVN root folder, rename it please) folder under %emac_dir% and set
;; HKEY_LOCAL_MACHINE\SOFTWARE\GNU\Emacs\HOME=%emacs_dir%
;; In linux, put .emacs.d under HOME

;;Uncomment the following line to byte compile every necessary files (usually after re-install)
;;(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

;;-------------����Debugģʽ��Ӱ�������ٶ�-----------
(setq debug-on-error t)

;;-----------custom-set-variables �������----------------
(custom-set-variables
;;�������Ի����ͳ�ʼ��Ļ
 '(current-language-environment "Chinese-GB")
 '(inhibit-startup-screen t)
;;����Elim��Ҫ�Ļ�������
 '(eclimd-wait-for-process nil)
;; '(eclim-executable "C:/Program Files (x86)\eclipse")
)

;;������������������
;; Setting English Font
(set-face-attribute
'default nil :font "Source Code Pro")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "΢���ź�" :size 14)))

;;----��� Marmalade �� package-archives
;; ������Marmalade������������ʱע�ͣ� ---
;;----��� Melpa �� package-archives ---
(require 'package)
;;(add-to-list 'package-archives 
;;    '("marmalade" .
;;      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;----------����auto-complete-----------
(require 'auto-complete-config)
(ac-config-default)
;;��auto-complete�������Զ����mode��
(add-to-list 'ac-modes 'csharp-mode)
(add-to-list 'ac-modes 'lua-mode)

;;---------Emacs Eclim---��Eclipse�ԽӵĲ��----
;;---------ע����Ҫ��װEclim�������ˣ�����ʹ��----
;;����eclimģʽ
(require 'eclim)
(global-eclim-mode) 
(require 'eclimd)
;;���eclipseλ�������⣬����path�£���Ҫ�������ڿ�ͷ��custom-set-variables��
;;(custom-set-variables
;; '(eclim-eclipse-dirs '("~/opt/eclipse")))
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)
;;��auto-complete�Խ�
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)


;;---------Smex,һ����M-x����ǿ���-----
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

;;---------���ô���-----------
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

;;---------Windows Only---����Windows------------------

;;-----powershell.el (elpa)����������Windows Powershell--
(autoload 'powershell "powershell" "Start a interactive shell of PowerShell." t)
;;--powershell-mode.el (elpa)��ΪPowershell�ű��ļ��ṩmode֧��-
(autoload 'powershell-mode "powershell-mode" "A editing mode for Microsoft PowerShell." t)
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode)) 
;; PowerShell script


;;---------Unix Like Only---����Unix��ϵͳ------------------

