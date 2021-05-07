private
assertConsistentLoadOrder
	self assert: loadOrder asSet size = loadOrder size description: 'duplicates in load order';
		assert: (loadOrder select: [:each | store includesObjectAt: each]) = store loadOrder
		description: 'different order in store'.