testing
testTypeChange
	| original target |
	original := {1. 'foo'. #bar. nil}.
	target := {'foo'. 2. 'bar'. Object new}.
	self patch: original to: target.
	self assert: target allButLast equals: original allButLast.
	self assert: original last class == Object.