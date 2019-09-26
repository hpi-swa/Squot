configuring
whenMergedWithA: aClass return: aBlock
	| previousBlock |
	previousBlock := mergeBlock ifNil: [self defaultMergeBlock].
	mergeBlock :=
		[:other :this |
		(other isKindOf: aClass)
			ifTrue: [aBlock value: other]
			ifFalse: [previousBlock cull: other cull: this]].