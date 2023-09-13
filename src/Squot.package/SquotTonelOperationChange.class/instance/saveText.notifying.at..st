ui
saveText: aText notifying: requestor at: aNumber
	| newDefinition newOperation |
	self operation isRemoval ifTrue: [^ self inform: 'cannot edit a removal'].
	self isInEditMode ifFalse: [^ self inform: 'please enter edit mode first'].
	newDefinition := self toDefinition
						squotCopyWithSources: (self sourcesWith: aText asString at: aNumber)
						notifying: requestor
						ifFail: [:message | ^ self inform: 'error: ', message asString].
	newOperation := self operation isModification
						ifTrue: [MCModification of: self fromDefinition to: newDefinition]
						ifFalse: [MCAddition of: newDefinition].
	self operation: newOperation.
	self isInEditMode: false.