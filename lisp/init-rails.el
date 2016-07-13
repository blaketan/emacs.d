(require-package 'rinari)
(after-load 'rinari
  (diminish 'rinari-minor-mode "Rin"))
(global-rinari-mode)

(require-package 'rbenv)
(global-rbenv-mode)

(require-package 'rspec-mode)

(defun update-rails-ctags ()
  (interactive)
  (let ((default-directory (or (rinari-root) default-directory)))
    (shell-command (concat "ctags -a -e -f " rinari-tags-file-name " --tag-relative -R app lib vendor test"))))

(when (maybe-require-package 'projectile-rails)
  (add-hook 'projectile-mode-hook 'projectile-rails-on)
  (after-load 'guide-key
    (add-to-list 'guide-key/guide-key-sequence "C-c r")))


(provide 'init-rails)
