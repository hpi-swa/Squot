events
onRollbackDo: aBlock
	rollbackCallbacks ifNil: [rollbackCallbacks := OrderedCollection new].
	rollbackCallbacks add: aBlock.