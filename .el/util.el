(provide 'util)

(defun timestamp()
  (interactive)
  (insert (current-time-string) " icheishvili"))

(defun ilia-scan-delimeter(delimeter length direction)
  (cond ((string-equal direction "back")
	 (previous-line))
	((string-equal direction "forward")
	 (next-line)))

  (let ((current ""))
    (ilia-first-non-white)
    (if (< (+ length (point)) (point-max))
	(if (> (+ length (point)) (point-min))
	    (setq current (buffer-substring (point-at-bol) (+ length (point))))))
    (if (string-equal delimeter current)
	t nil)))

(defun ilia-first-non-white()
  (beginning-of-line)
  (if (not (string-match "[^[:space:]]" (thing-at-point 'char)))
      (re-search-forward "[^[:space:]]" nil t)))

(defun ilia-last-non-white()
  (end-of-line)
  (re-search-backward "[^[:space:]]" nil t))

(defun ilia-line-length()
  (ilia-first-non-white)
  (let ((beginning (point)))
    (ilia-last-non-white)
    (- (point) beginning)))
