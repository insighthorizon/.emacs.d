;; This is a comment line
;; Lines which are not comment are something like Scheme code which is run by emacs when you open emacs

;; Include access to packages we might wish to install
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")) )
(package-initialize)

;; hide the emacs menu with icons & hide the emacs toolbar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Get rid of the default emacs startup screen (it opens with split windows by default)
(setq inhibit-startup-screen t) ; this option is commented out, thus not used

;; Get larger font size, default is :height 100
(set-face-attribute 'default nil :height 120)

;; Org mode settings
(add-hook 'org-mode-hook 'visual-line-mode) ; always use the visual-line mode in org files
(setq org-hide-emphasis-markers t) ; hide the /*_+ chars around emphasized text
(setq org-log-done t) ; produce timestamp when a TODO is closed - try to close some TODOs to see that
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))) ; use nice bullets for headlines in org-mode

;; Set up the graphics theme
(setq zenburn-use-variable-pitch t) ; use variable-pitch fonts for some headings and titles
(setq zenburn-scale-org-headlines t) ; scale headings in org-mode
(setq zenburn-scale-outline-headlines t) ; scale headings in outline-mode
(load-theme 'zenburn t)

;; load the org-babel function for racket  
;; Load ob-racket.el https://github.com/togakangaroo/ob-racket
(add-to-list 'load-path "~/.emacs.d/babel/") ; note that this needs to be the path where we placed the ob-racket.el file
;; Enable Racket in Org-mode Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((racket . t)))
;; Prevent emacs from asking us if we really wish to evaluate the piece of code each time we use the C-c, C-c command.
(setq org-confirm-babel-evaluate nil)
;; Set path to the racket
;(setq org-babel-command:racket "/usr/racket/bin/racket") ; for linux only  - needed only in the case when non-standard path is used (like when installing older racket on linux)
(setq org-babel-command:racket "/Program Files/Racket/Racket.exe")   ; this is the windows version

;; org-mode latex fragments
(setq org-latex-create-formula-image-program 'dvisvgm)


;; The things down there were added by emacs automatically when we installed the packages like zenburn-theme and org-superstar
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit racket-mode zenburn-theme org-superstar)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

