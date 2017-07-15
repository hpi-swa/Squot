tests
testAllReferences
	| allReferences |
	allReferences := Array streamContents: [:stream |
		repository allReferencesDo: [:each | stream nextPut: each]].
	self assert: #('HEAD' 'refs/heads/master' 'refs/heads/branch1' 'refs/heads/feature/x') sorted
		equals: allReferences sorted