;;; core-custom-settings.el --- Spacemacs Core File
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
(require 'core-dotspacemacs)

(defvar spacemacs--custom-file (concat spacemacs-cache-directory
                                       ".custom-settings"))
(setq custom-file spacemacs--custom-file)

(defun spacemacs//initialize-custom-file ()
  "Initialize the custom file."
  (unless (file-exists-p spacemacs--custom-file)
    (with-temp-file spacemacs--custom-file
      (let ((standard-output (current-buffer)))
        (princ ";; -*- mode: emacs-lisp -*-\n")
        (princ ";; This file is where Emacs writes custom variables.
;; Do not alter this file, use Emacs customize interface instead.\n\n")))))

(spacemacs//initialize-custom-file)

(provide 'core-custom-settings)
