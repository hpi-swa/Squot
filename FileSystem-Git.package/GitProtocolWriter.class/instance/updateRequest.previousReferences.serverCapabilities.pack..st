commands receive-pack
updateRequest: newRefs previousReferences: previousRefs serverCapabilities: capabilities pack: aPackFile
	serverCapabilities := capabilities.
	self
		writeUpdateReferences: newRefs previousReferences: previousRefs;
		flushPacket.
	(newRefs values anySatisfy: #notNil) ifTrue: [self writePackFile: aPackFile].