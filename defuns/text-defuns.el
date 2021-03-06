(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )

(defun uniq-lines (beg end)
  "Unique lines in region.
Called from a program, there are two arguments:
BEG and END (region to sort)."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (not (eobp))
        (kill-line 1)
        (yank)
        (let ((next-line (point)))
          (while
              (re-search-forward
               (format "^%s" (regexp-quote (car kill-ring))) nil t)
            (replace-match "" nil nil))
          (goto-char next-line))))))

(defun region-or-line ()
  (if (use-region-p)
      (list (region-beginning) (region-end))
    (list (line-beginning-position) (line-beginning-position 2))))

(defun keelerm/kill-ring-save (beg end)
  (interactive (region-or-line))
  (kill-ring-save beg end))

(defun keelerm/kill-region (beg end)
  (interactive (region-or-line))
  (kill-region beg end))
