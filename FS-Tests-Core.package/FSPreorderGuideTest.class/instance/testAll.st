tests
testAll
	guide := FSPreorderGuide for: self.
	guide show: (filesystem referenceTo: '/alpha').
	self assertVisitedIs: #(
			'alpha'
			'beta'
			'delta'
			'gamma'
			'epsilon'
			'zeta'
		)