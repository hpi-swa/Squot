testing
testCloseWhenGarbageCollected
	| fileId weak |
	fileId := handle instVarNamed: 'id'.
	self assert: handle isOpen.
	weak := WeakArray with: handle.
	handle := nil.
	self retryWithGC: [] until: [:x | weak first isNil]. "collect the handle"
	self assert: weak first isNil description: 'handle not garbage collected'.
	self assert: (FSFilePluginPrims new sizeOrNil: fileId) isNil description: 'fileId still open'.