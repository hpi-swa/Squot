testing
testArraySwap
	| a b original target |
	a := 'foo' copy.
	b := 'bar' copy.
	original := {a. b}.
	target := {b. a}.
	self patch: original to: target.
	self assert: target equals: original.
	self assert: original first == b.
	self assert: original second == a.