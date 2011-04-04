tests
testAll
	guide := FSBreadthFirstGuide for: self.
	guide show: (filesystem referenceTo: '/alpha').
	self assertVisitedIs: #(
			'alpha'
			'beta'
			'epsilon'
			'delta'
			'gamma'
			'zeta'
		)