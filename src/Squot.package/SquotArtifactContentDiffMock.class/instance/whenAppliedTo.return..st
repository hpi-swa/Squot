configuring
whenAppliedTo: otherContentOrMock return: aBlock
	| previousBlock |
	previousBlock := applyBlock ifNil: [self defaultApplyBlock].
	applyBlock :=
		[:this :target |
		target = otherContentOrMock
			ifTrue: [aBlock value]
			ifFalse: [previousBlock cull: this cull: target]].