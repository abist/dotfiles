(setq c0-root "/afs/andrew.cmu.edu/course/15/122/") ; by-setup-c0
(load (concat c0-root "c0-mode/c0.el")) ; by-setup-c0
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
;; these emacs settings for SML mode are added by a script written for
;; 15-150 in Sp 2012.

;; they are largely portable, except that they refer to a copy of the
;; sml-mode elisp files in the 150 AFS volume. so if you ever want to use
;; this off of AFS, you should change where that points to and install them
;; locally.

;; this points to AFS
(add-to-list 'load-path
             "/afs/andrew.cmu.edu/course/15/150/bin/elisp/sml-mode")
(autoload 'sml-mode "sml-mode" "Major mode for editing SML." t)
(autoload 'run-sml "sml-proc" "Run an inferior SML process." t)

;; this points to where SML happens to live on unix.andrew.cmu.edu
(setq sml-program-name "/usr/local/bin/sml")

(add-to-list 'auto-mode-alist '("\\.\\(sml\\|sig\\)\\'" . sml-mode))
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

(line-number-mode 1)

(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
(require 'color-theme-solarized)
(color-theme-solarized)

(if (fboundp 'pc-selection-mode)
        (pc-selection-mode)
      (require 'pc-select))

(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour


(defun my-sml-mode-hook () "Local defaults for SML mode"
  (setq sml-indent-level 2)             ; conserve on horizontal space
  (setq words-include-escape t)         ; \ loses word break status
  (setq indent-tabs-mode nil))          ; never ever indent with tabs
(add-hook 'sml-mode-hook 'my-sml-mode-hook)

;; General non-SML-specific settings that are appropriate follow - feel
;; free to comment these out if you don't like them.

;; Turns on syntax highlighting for all files for which emacs knows how to
;; highlight.
(global-font-lock-mode t)

;; Makes the space between the "mark" and the "point" be highlighted -
;; essentially, emacs' notion of the "currently selected text". This is
;; probably what you expect if you're coming from another text editor.
(transient-mark-mode t)

;; Removes trailing whitespace from your lines before saving
;; files. Trailing whitespace is the devil.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Makes sure your files end in a newline before saving them. Terminating
;; newlines are a Good Idea.
(setq require-final-newline t)

(put 'upcase-region 'disabled nil)

(put 'downcase-region 'disabled nil)
