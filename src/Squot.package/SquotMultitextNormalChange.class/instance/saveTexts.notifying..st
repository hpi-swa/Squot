ui
saveTexts: aCollection notifying: requestors
	| newVersion |
	self isEditable ifFalse: [^ self inform: 'Cannot edit a removal'].
	self isInEditMode ifFalse: [^ self inform: 'Please enter edit mode first'].
	newVersion := self mapper
						copyOf: self to
						withSources: aCollection
						notifying: requestors
						ifFail: [:message | ^ self inform: 'Error: ', message asString].
	self
		to: newVersion;
		isInEditMode: false;
		markAsEdited.