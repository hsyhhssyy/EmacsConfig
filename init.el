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

;;������������������
;; Setting English Font
(set-face-attribute
'default nil :font "Source Code Pro")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "΢���ź�" :size 14)))

;;----��� Marmalade �� package-archives  ---
;;----��� MELPA �� package-archives ---
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;----------����auto-complete-----------
(require 'auto-complete-config)
(ac-config-default)
(require 'ac-etags)
