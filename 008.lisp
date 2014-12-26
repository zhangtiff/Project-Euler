(defun greatest-product (n digits) 
	(let 
		((max '0) 
		(current '1)
		(numzeroes '0)
		(divisor '1)
		(digit '0)
		(last-digit '0)
		(size (expt 10 digits)))
	(loop for i from 1 to digits
		do (setq digit (mod (floor n divisor) 10))
		do (if (= digit 0) 
			(setq numzeroes (+ numzeroes 1)) 
			(setq current (* current digit)))
		do (if (and 
					(= numzeroes 0) 
					(> current max))
				(setq max current))
		do (setq divisor (* divisor 10)))
	(loop while (> (floor n divisor) size) 
		do (setq last-digit (mod (floor n (floor divisor size)) 10))
		do (setq digit (mod (floor n divisor) 10))
		do (if (= last-digit 0) (decf numzeroes) (setq current (/ current last-digit)))
		do (if (= digit 0) (incf numzeroes) (setq current (* current digit)))
		do (if (and 
					(= numzeroes 0) 
					(> current max))
				(setq max current))
		do (setq divisor (* divisor 10)))
	max))