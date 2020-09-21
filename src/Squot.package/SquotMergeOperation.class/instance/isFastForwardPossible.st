private
isFastForwardPossible
	self assert: baseVersion notNil;
		assert: mergeBases notNil.
	^ mergeBases includes: baseVersion