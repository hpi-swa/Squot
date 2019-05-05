as yet unclassified
topNodes

	^ self diffs collect: [:each | each asDiffNode
		includeBlock: [each includeIn: self];
		excludeBlock: [each excludeIn: self];
		resetBlock: [each resetIn: self];
		yourself]