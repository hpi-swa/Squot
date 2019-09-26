testing
testNestedArray
	| original target instance patched |
	instance := 'foo' copy.
	original := {1. 2. {instance. 'bar'}. 4}.
	target := {1. 2. {instance. 'bla'}. 4}.
	self assert: target equals: (patched := self patch: original to: target).