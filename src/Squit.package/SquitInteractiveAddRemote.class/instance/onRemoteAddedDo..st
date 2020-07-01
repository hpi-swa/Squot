events
onRemoteAddedDo: aBlock
	remoteAddedCallbacks ifNil: [remoteAddedCallbacks := OrderedCollection new].
	remoteAddedCallbacks add: aBlock.