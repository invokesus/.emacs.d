;; Time-stamp: <2018-03-12 22:48:34 csraghunandan>

;; selected: Keymap for when region is active
;; https://github.com/Kungsgeten/selected.el
(use-package selected
  :bind (:map selected-keymap
              ("w" . whole-line-or-region-kill-region)
              ("~" . hydra-change-case/body)
              ("c" . copy-region-as-kill)
              ("d" . duplicate-current-line-or-region)
              ("E" . eval-region)
              ("e" . er/expand-region)
              ("f" . fill-region)
              ("q" . vr/query-replace)
              (";" . comment-or-uncomment-region)
              ("s" . rag/kill-rectangle-replace-with-space)
              ("l" . align-hydra/body)
              ("t" . xah-title-case-region-or-line))
  :init
  (selected-global-mode))

(provide 'setup-selected)
