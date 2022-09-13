ui diff tree
annotation
	^ selectedNode
		ifNotNil: [[selectedNode annotations] ifError: [:ex | ex]]