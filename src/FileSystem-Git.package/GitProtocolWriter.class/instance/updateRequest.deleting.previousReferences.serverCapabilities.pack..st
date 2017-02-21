commands receive-pack
updateRequest: updateAssociations deleting: deleteRefs previousReferences: previousRefs serverCapabilities: capabilities pack: aPackFile
	serverCapabilities := capabilities.
	self
		writeUpdateReferences: updateAssociations
		deleteReferences: deleteRefs
		previousReferences: previousRefs;
		flushPacket.
	updateAssociations ifNotEmpty: [self writePackFile: aPackFile].