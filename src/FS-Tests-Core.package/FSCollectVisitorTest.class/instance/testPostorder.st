tests
testPostorder
	| entries |
	entries := FSCollectVisitor postorder: self root.
	self 
		assertEntries: entries
		are: #(
				'/alpha/beta/delta'
				'/alpha/beta/gamma'
				'/alpha/beta'
				'/alpha/epsilon/zeta'
				'/alpha/epsilon'
				'/alpha'
			)