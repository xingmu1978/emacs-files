(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
(package-initialize)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/baoliang/.emacs.d/elpa/auto-complete-20150618.1949/dict")
(ac-config-default)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(desktop-save-mode 1)
;;copy region or whole line
(global-set-key "\M-w"
		(lambda ()
		  (interactive)
		  (if mark-active
		      (kill-ring-save (region-beginning) (region-end))
		    (progn
		      (kill-ring-save (line-beginning-position) (line-end-position))
		      (message "copied line")))))
;; kill region or whole line
(global-set-key "\C-w"
		(lambda ()
		  (interactive)
		  (if mark-active
		      (kill-region (region-beginning) (region-end))
		    (progn
		      (kill-region (line-beginning-position) (line-end-position))
		      (message "killed line")))))
