;; Author     : Songyang.Huo
;; Created    : Feburary 2014
;; Version    : 0.0.1
;; Keywords   : give auto-complete ability to show more in Quick Help

;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:
;;
;;
;; Features:


;;; auto-complete-extend.el starts here

(require 'auto-complete)

(defface ac-gtags-candidate-face
  '((t (:inherit ac-candidate-face :foreground "navy")))
  "Face for gtags candidate"
  :group 'auto-complete)

(defface ac-gtags-selection-face
  '((t (:inherit ac-selection-face :background "navy")))
  "Face for the gtags selected candidate."
  :group 'auto-complete)

(defun ac-gtags-candidate ()
  (ignore-errors
    (split-string (shell-command-to-string (format "global -ciq %s" ac-prefix)) "\n")))

(defun ac-gtags-dcoument (item)
  (ignore-errors
    (if (stringp item)
	 (replace-regexp-in-string "^[^[:blank:]]+[[:blank:]]+[[:digit:]]+[[:blank:]]+[^[:blank:]]+[[:blank:]]+" "" 
	 (shell-command-to-string (format "global -x %s" item))
	 )
    )
  )
)
;;;###autoload
  (defun auto-complete-extend ()
(interactive)
;;Load Start on quick help

;;-------if gtags available-------
(ac-define-source gtags
  '((candidates . ac-gtags-candidate)
    (candidate-face . ac-gtags-candidate-face)
    (selection-face . ac-gtags-selection-face)
    (requires . 3)
    (symbol . "s")
    (document . ac-gtags-dcoument)
    ))
)

(provide 'auto-complete-extend)
;;; auto-complete-extend.el ends here
