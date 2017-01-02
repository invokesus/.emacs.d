;; Time-stamp: <2017-01-02 20:11:43 csraghunandan>

;; calc config
(use-package calc :defer t
  :bind (("C-x c" . calc)
          ("C-x ," . quick-calc))
  :config
  (setq calc-twos-complement-mode nil)
  ;; Calculator output value format
  (setq calc-float-format '(eng 4))) ; Engineering notation

(provide 'setup-calc)
