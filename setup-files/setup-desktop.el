;; Time-stamp: <2017-08-13 11:23:12 csraghunandan>

;; desktop: save the current emacs session
(use-package desktop
  :init
  (setq desktop-dirname (concat user-emacs-directory "desktop")
        desktop-base-file-name "emacs.desktop"
        desktop-base-lock-name "lock"
        desktop-path (list desktop-dirname)
        desktop-save t
        desktop-load-locked-desktop nil)
  (desktop-save-mode 0)

  ;; https://github.com/purcell/emacs.d/blob/master/lisp/init-sessions.el
  ;; Save a bunch of variables to the desktop file.
  ;; For lists, specify the length of the maximal saved data too.
  (setq desktop-globals-to-save
        (append '((comint-input-ring . 50)
                  desktop-missing-file-warning
                  (dired-regexp-history . 20)
                  (extended-command-history . 30)
                  (face-name-history . 20)
                  (file-name-history . 100)
                  (magit-read-rev-history . 50)
                  (minibuffer-history . 50)
                  (org-refile-history . 50)
                  (org-tags-history . 50)
                  (query-replace-history . 60)
                  (read-expression-history . 60)
                  (regexp-history . 60)
                  (regexp-search-ring . 20)
                  register-alist
                  (search-ring . 20)
                  (shell-command-history . 50)
                  ivy-views
                  ;; tags-file-name
                  ;; tags-table-list
                  )))

  (>=e "25.0"
      nil
    ;; 'Fix' the frameset error at startup
    ;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=17352
    (setq desktop-restore-frames nil))

  ;; http://emacs.stackexchange.com/a/20036/115
  (defun rag/bury-star-buffers ()
    "Bury all star buffers."
    (mapc (lambda (buf)
            (when (string-match-p "\\`\\*.*\\*\\'" (buffer-name buf))
              (bury-buffer buf)))
          (buffer-list)))
  (add-hook 'desktop-after-read-hook #'rag/bury-star-buffers)

  (defun rag/restore-last-saved-desktop ()
    "Enable `desktop-save-mode' and restore the last saved desktop."
    (interactive)
    (desktop-save-mode 1)
    (desktop-read))

  :bind (("<S-f2>" . desktop-save-in-desktop-dir)
         ("<C-f2>" . rag/restore-last-saved-desktop)))

(provide 'setup-desktop)
