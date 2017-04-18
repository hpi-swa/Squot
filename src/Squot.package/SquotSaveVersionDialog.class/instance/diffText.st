ui
diffText
	^ selectedDiffNode
		ifNil: ['']
		ifNotNil: [selectedDiffNode asStringOrText]