tests
testBreadthFirst
	| entries |
	entries := FSCollectVisitor breadthFirst: self root.
	self 
		assertEntries: entries
		are: #(
				'/alpha'
				'/alpha/beta'
				'/alpha/epsilon'
				'/alpha/beta/delta'
				'/alpha/beta/gamma'
				'/alpha/epsilon/zeta'
			)