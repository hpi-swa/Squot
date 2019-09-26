configuring
whenComparedWith: aShadowGraphOrMock return: aBlock
	| previousBlock |
	previousBlock := diffBlock ifNil: [self defaultCompareBlock].
	diffBlock :=
		[:other :this |
		other = aShadowGraphOrMock
			ifTrue: [aBlock value]
			ifFalse: [previousBlock cull: other cull: this]].