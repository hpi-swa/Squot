configuring
whenAppliedTo: anObject return: aBlock
	| previousBlock |
	previousBlock := applyBlock ifNil: [self defaultApplyBlock].
	mergeBlock :=
		[:other :this |
		other = anObject
			ifTrue: [aBlock value]
			ifFalse: [previousBlock cull: other cull: this]].