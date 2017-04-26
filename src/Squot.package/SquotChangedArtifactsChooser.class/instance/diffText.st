ui diff tree
diffText
	^ selectedNode
		ifNil: ['']
		ifNotNil: [selectedNode asStringOrText]