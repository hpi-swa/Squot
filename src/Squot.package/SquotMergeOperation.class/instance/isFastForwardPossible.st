private
isFastForwardPossible
	self assert: baseVersion notNil;
		assert: mergeBases notNil.
	self workingVersion ifNil: [^ false].
	^ mergeBases includes: self workingVersion