tests
testArrayOfDifferentlyTypedObjects
	| diff |
	diff := self diff: {1} against: {nil}.
	self assert: diff squotHasChanges;
		assert: diff startDiff squotHasChanges.
	diff := self diff: {nil} against: {1}.
	self assert: diff squotHasChanges;
		assert: diff startDiff squotHasChanges.
	diff := self diff: {'foo'} against: {{1}}.
	self assert: diff squotHasChanges;
		assert: diff startDiff squotHasChanges.
	diff := self diff: {{1}} against: {'foo'}.
	self assert: diff squotHasChanges;
		assert: diff startDiff squotHasChanges.