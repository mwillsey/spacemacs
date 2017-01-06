;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs-base
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     ;; system
     (shell :variables shell-default-shell 'eshell)
     osx

     ;; emacs
     emacs-lisp
     helm

     ;; evil
     (spacemacs-evil :packages (not evil-nerd-commenter
                                    evil-tutor
                                    vi-tilde-fringe))
     evil-commentary

     (spacemacs-org :packages (not org-bullets))
     org

     ;; tools
     git
     github
     vagrant

     ;; editing
     (spell-checking :variables spell-checking-enable-by-default nil)

     ;; tex
     bibtex
     latex

     semantic

     ;; other langs
     html
     racket
     python
     graphviz
     )
   dotspacemacs-additional-packages '(olivetti fill-column-indicator)
   dotspacemacs-frozen-packages '()
   dotspacemacs-install-packages 'used-but-keep-unused
   dotspacemacs-excluded-packages '()))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists '()
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(spacemacs-light
                         spacemacs-dark)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Inconsolata"
                               :size 13)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state t
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native t
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 100
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis t
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'trailing
   ))

;; things in here must be executed before spacemacs finishes loading
;; everything else should go in config.org
(defun dotspacemacs/user-init ()
  ;; spacemacs-theme stuff has to go before init
  (setq spacemacs-theme-org-agenda-height nil
        spacemacs-theme-org-height nil)
  ;; stop spacemacs from complaining about me setting my path
  (setq exec-path-from-shell-check-startup-files nil)
  (message "dotspacemacs/user-init complete"))

;; user/config just loads my own config though org-babel
(defun dotspacemacs/user-config ()
  (message "Loading org...")
  (require 'org)
  (message "Tangling emacs.org...")
  (org-babel-load-file "~/Dropbox/settings/emacs.org"))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (linum-relative evil-unimpaired evil-search-highlight-persist evil-lisp-state evil-indent-plus evil-iedit-state evil-args evil-anzu anzu highlight iedit smartparens emojify circe oauth2 websocket key-chord helm-bibtex org hydra pkg-info epl flx parsebib haml-mode gitignore-mode gh marshal logito pcache ht flyspell-correct with-editor evil goto-chg undo-tree diminish company rust-mode biblio biblio-core packed pythonic f dash s alert log4e gntp avy popup async package-build ivy bind-key auctex yasnippet helm helm-core magit magit-popup git-commit markdown-mode projectile request vagrant-tramp vagrant stickyfunc-enhance srefactor intero flycheck hlint-refactor hindent helm-hoogle helm-cscope xcscope haskell-snippets company-ghci company-ghc ghc haskell-mode cmm-mode yapfify xterm-color which-key web-mode use-package toml-mode toc-org tagedit sql-indent spacemacs-theme smeargle slim-mode slack shell-pop scss-mode sass-mode reveal-in-osx-finder racer quelpa pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements pdf-tools pcre2el pbcopy osx-trash osx-dictionary orgit org-ref org-projectile org-present org-pomodoro org-plus-contrib org-ehtml org-download olivetti ob-sml noflet multi-term mmm-mode minimal-theme markdown-toc magit-gitflow magit-gh-pulls macrostep live-py-mode less-css-mode launchctl hy-mode htmlize help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-ag gnuplot github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh-md flyspell-correct-helm fill-column-indicator exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-surround evil-numbers evil-mc evil-matchit evil-magit evil-exchange evil-escape evil-ediff evil-commentary eshell-z eshell-prompt-extras esh-help ensime emmet-mode elisp-slime-nav eclim disaster cython-mode cmake-mode clang-format cargo bind-map auto-dictionary auto-compile auctex-latexmk anaconda-mode ace-window ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
