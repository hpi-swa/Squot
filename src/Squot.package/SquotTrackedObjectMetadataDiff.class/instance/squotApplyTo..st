Squot-diff-patching
squotApplyTo: metadata
	| new |
	new := metadata veryDeepCopy.
	diffs keysAndValuesDo:
		[:path :diff | | object |
		object := new.
		path allButLast do:
			[:each |
			[object := each sendTo: object]
				on: MessageNotUnderstood do:
					[:e | e message selector == #sendTo:
						ifTrue:
							[each isString
								ifTrue: [object := thisContext object: object instVarAt: ((thisContext objectClass: object) instVarIndexFor: each ifAbsent: [self error: 'Variable not found!'])]
								ifFalse: [object := thisContext object: object basicAt: each].
							e return]
						ifFalse: [e pass]]].
		diff isAddition ifTrue:
			[([path last selector == #at:] on: MessageNotUnderstood do: [:e | e message selector == #selector ifTrue: [e return: false] ifFalse: [e pass]])
				ifTrue: [object at: path last argument put: diff addedObject]
				ifFalse: [self isThisEverCalled]].
		diff isModification ifTrue:
			[([path last selector == #at:] on: MessageNotUnderstood do: [:e | e message selector == #selector ifTrue: [e return: false] ifFalse: [e pass]])
				ifTrue: [object at: path last argument put: diff right]
				ifFalse: [path last isString
							ifTrue: [thisContext object: object instVarAt: ((thisContext objectClass: object) instVarIndexFor: path last ifAbsent: [self error: 'Variable not found!']) put: diff incoming]
							ifFalse: [thisContext object: object basicAt: path last put: diff incoming]]].
		diff isRemoval ifTrue:
			[([path last selector == #at:] on: MessageNotUnderstood do: [:e | e message selector == #selector ifTrue: [e return: false] ifFalse: [e pass]])
				ifTrue: [object removeKey: path last argument]
				ifFalse: [self isThisEverCalled]]].
	^ new