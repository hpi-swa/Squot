ui
operationText: aText
	| newDefinition newOperation |
	self operation isRemoval ifTrue: [^ self inform: 'cannot edit a removal'].
	self isInEditMode ifFalse: [^ self inform: 'please enter edit mode first'].
	newDefinition := self toDefinition squotCopyWithSource: aText asString.
	newOperation := self operation isModification
						ifTrue: [MCModification of: self fromDefinition to: newDefinition]
						ifFalse: [MCAddition of: newDefinition].
	self operation: newOperation.
	self isInEditMode: false.