tests
testAll
	guide := FSPostorderGuide for: self.
	guide show: (filesystem referenceTo: '/alpha').
	self assertVisitedIs: #(
			'delta'
			'gamma'
			'beta'
			'zeta'
			'epsilon'
			'alpha'
		)