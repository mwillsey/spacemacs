;;; packages.el --- Lean Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Max Willsey
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst lean-packages
  '(lean-mode
    (company-lean :requires company)
    (helm-lean :requires helm)
    ))

(defun lean/init-lean-mode ()
  (use-package lean-mode
    :defer t
    :mode ("\\.lean\\'" . lean-mode)
    :load-path lean-emacs-path
    :config
    (progn

      (spacemacs/declare-prefix-for-mode 'lean-mode "mc" "compile")
      (spacemacs/declare-prefix-for-mode 'lean-mode "mh" "documentation")
      (spacemacs/declare-prefix-for-mode 'lean-mode "mp" "process")
      (spacemacs/declare-prefix-for-mode 'lean-mode "mg" "tags")
      (spacemacs/declare-prefix-for-mode 'lean-mode "mT" "toggles")

      (spacemacs/set-leader-keys-for-major-mode 'lean-mode
       "cc" 'lean-std-exe
       "pr" 'lean-server-restart
       ;; "pf" 'lean-set-option
       "hh" 'lean-eldoc-documentation-function
       "ht" 'lean-show-type
       ;; "hg" 'lean-show-goal-at-pos
       "hk" 'quail-show-key
       ;; "hi" 'lean-show-id-keyword-info
       "f" 'lean-fill-placeholder
       ;; "gu" 'lean-generate-tags
       "gg" 'lean-find-definition
       ;; these aren't really ui toggles, they show/hide windows
       "?" 'lean-toggle-show-goal
       "e" 'lean-toggle-next-error
       "Tm" 'lean-message-boxes-toggle
       "SPC" 'lean-hole
       ))))

(defun lean/init-company-lean ()
  (use-package company-lean
    :defer t
    :init (spacemacs|add-company-backends
            :backends company-lean
            :modes lean-mode)))

(defun lean/init-helm-lean ()
  (use-package helm-lean
    :commands helm-lean-definitons
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'lean-mode
        "hd" 'helm-lean-definitions))))
