;; emacs configuration
(add-to-list 'load-path "~/.emacs.d/vendor")
(push "/usr/local/bin" exec-path)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 2)
(setq inhibit-startup-message t)
(setq-default fill-column 80)

(fset 'yes-or-no-p 'y-or-n-p)
(setq mac-command-modifier 'meta)
(setq mac-function-modifier 'super)

(global-linum-mode t)
(delete-selection-mode t)
;(scroll-bar-mode -1)
;(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(line-number-mode t)
(column-number-mode t)
;(set-fringe-style -1)
;(tooltip-mode -1)
(global-hl-line-mode t)

(set-frame-font "Anonymous Pro-15")

; window-number-mode
;(autoload 'window-number-mode "window-number"
;  "A global minor mode that enables selection of windows according to
;numbers with the C-x C-j prefix.  Another mode,
;`window-number-meta-mode' enables the use of the M- prefix."
;  t)
;
;(autoload 'window-number-meta-mode "window-number"
;  "A global minor mode that enables use of the M- prefix to select
;windows, use `window-number-mode' to display the window numbers in
;the mode-line."
;  t)

(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

; awesome ruby stuff
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("gemspec" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq ruby-deep-arglist t)
             (setq ruby-deep-indent-paren nil)
             (setq c-tab-always-indent nil)
             (set-newline-and-indent)
             (require 'inf-ruby)
             (require 'ruby-compilation)
             (linum-mode)))

(add-to-list 'load-path "~/.emacs.d/vendor/rspec-mode")
(require 'rspec-mode)

; rhtml goodness
(add-to-list 'load-path "~/.emacs.d/vendor/rhtml")
(autoload 'rhtml-mode "rhtml-mode" "Mode for editing rhtml / html.erb source files" t)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))

; HAML
(autoload 'haml-mode "haml-mode" "Mode for editing HAML source files" t)
(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))
(add-hook 'haml-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (set-newline-and-indent)))

; YAML
(autoload 'yaml-mode "yaml-mode" "Mode for editing YAML source files" t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (set-newline-and-indent)))

; CSS
(autoload 'css-mode "css-mode" "Mode for editing CSS source files" t)
(add-hook 'css-mode-hook '(lambda ()
                            (set-newline-and-indent)
                            (setq css-indent-level 2)
                            (setq css-indent-offset 2)))
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))


; SLIME awesomeness
;(add-to-list 'load-path "~/.emacs.d/vendor/slime")
;(setq inferior-lisp-program "/usr/local/bin/sbcl")
;(require 'slime)
;(slime-setup '(slime-fancy))

(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(defun coffee-custom ()
  "coffee-mode-hook"

  ;; CoffeeScript uses two spaces.
  (set (make-local-variable 'tab-width) 2)
  ;; If you don't have js2-mode
  (setq coffee-js-mode 'javascript-mode)
  ;; If you don't want your compiled files to be wrapped
  (setq coffee-args-compile '("-c" "--bare"))
  ;; *Messages* spam
  (setq coffee-debug-mode t)
  ;; Emacs key binding
  (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
  ;; via npm
  (setq coffee-command "/usr/local/bin/coffee")

  ;; Compile '.coffee' files on every save
  (and (file-exists-p (buffer-file-name))
       (file-exists-p (coffee-compiled-file-name))
       (coffee-cos-mode t)))

(add-hook 'coffee-mode-hook 'coffee-custom)

;(defun cucumber-mode-hook ()
;  (autoload 'feature-mode "feature-mode" nil t)
;  (add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode)))
;
;


(add-to-list 'load-path
             "~/.emacs.d/vendor/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet-0.6.1c/snippets")
(yas/load-directory "~/.emacs.d/custom-snippets")

;(add-to-list 'load-path "~/.emacs.d/vendor/magit")
;(require 'magit)
;(add-to-list 'load-path "~/.emacs.d/vendor/mo-git-blame")
;(autoload 'mo-git-blame-file "mo-git-blame" nil t)
;(autoload 'mo-git-blame-current "mo-git-blame" nil t)

(add-to-list 'load-path "~/.emacs.d/vendor/textmate")
(require 'textmate)

;; peepopen command+t
(require 'peepopen)
(setq ns-pop-up-frames nil)
(textmate-mode)

(require 'cheat)
(require 'gist)

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (set-newline-and-indent)
             (define-key emacs-lisp-mode-map "\C-c\C-c" 'slime-compile-defun)
             (define-key emacs-lisp-mode-map "\C-c\C-f" 'slime-compile-file)))

(defun is-rails-project ()
  (when (textmate-project-root)
    (file-exists-p (expand-file-name "config/environment.rb" (textmate-project-root)))))

; ack!
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

(add-to-list 'load-path "~/.emacs.d/vendor/markdown-mode")
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdt" . markdown-mode))
(setq markdown-command "/usr/local/bin/markdown")

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

; My keybindings
(global-set-key (kbd "M-l") 'goto-line)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x j") 'join-line)
(global-set-key (kbd "M-T") 'transpose-words)
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1)))

;(server-start)

;; TODO - ideas for functions that I want to write but don't know how yet
; kill-whole-word : should look up previous character for word boundary (\b)
;    and move back a word if it's not a boundary, then forward kill
;    http://www.appdesign.com/blog/2007/04/21/killing-the-whole-word-in-emacs/
; set the path properly (currently hacking markdown & ack)


(defun hoist-region ()
  (save-excursion
    (open-new-buffer-with-region (point) (mark))
    (add-save-hook-to-current-buffer '(replace-original-region-with-buffer-contents))))

(defun open-new-buffer-with-region (start end)
  (copy-to-buffer "chicken" start end)
  (pop-to-buffer "chicken"))

(defun add-save-hook-to-current-buffer (functions)
  (setq write-contents-functions functions))

(defun curl (url)
  (interactive "sURL: ")
  (let ((curl-string (format "curl -L '%s'" url)))
    (shell-command curl-string "*curl*")))
;  (switch-to-buffer "*curl*")
;  (insert (shell-command-to-string curl-string)))
