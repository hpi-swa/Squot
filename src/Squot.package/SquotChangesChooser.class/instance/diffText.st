ui diff tree
diffText
	^ selectedNode
		ifNil: ['']
		ifNotNil: [workingCopy repository withUnitOfWork: [selectedNode asStringOrText]]