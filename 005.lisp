(defun smallest-divisible (max) 
	(setq min (+ (floor max 2) 1))
	(setq primes (get-primes max))
	(setq num-primes (pairlis primes 
		(make-list (length primes) :initial-element '0)))
	(loop for x from min to max 
		do (setq i x)
		do (loop for p in primes 
			while (> i 1)
				do (setq count 0)
				do (loop while (eq 0 (mod i p))
					do (setq i (/ i p))
					do (setq count (+ count 1)))
				do (if (> count (cdr (assoc p num-primes))) 
					(rplacd (assoc p num-primes) count))
			))
	(setq product 1)
	(loop for p in primes
		do (setq product (* product (expt p (cdr (assoc p num-primes))))))
	product)

(defun get-primes (n)
	(if (< n 2) (return-from get-primes nil))
	(setq primes '(2))
	(setq i 3)
	(loop while (<= i n)
		do (if (eq (is-divisible i primes) nil) 
			(setq primes (append primes (list i))))
		do (setq i (+ i 2))
		)
	primes)

(defun is-divisible (n nums)
	(setq res nil)
	(loop for x in nums 
		while (eq res nil)
		do (if (= (mod n x) 0) 
			(setq res t))
		)
	res)