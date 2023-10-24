ui
saveTexts: aCollection notifying: requestors
	| newDefinition newOperation |
	self operation isRemoval ifTrue: [^ self inform: 'Cannot edit a removal'].
	self isInEditMode ifFalse: [^ self inform: 'Please enter edit mode first'].
	newDefinition := self toDefinition
						squotCopyWithSources: aCollection
						notifying: requestors
						ifFail: [:message | ^ self inform: 'Error: ', message asString].
	newOperation := self operation isModification
						ifTrue: [MCModification of: self fromDefinition to: newDefinition]
						ifFalse: [MCAddition of: newDefinition].
	self
		operation: newOperation;
		isInEditMode: false;
		markAsEdited.