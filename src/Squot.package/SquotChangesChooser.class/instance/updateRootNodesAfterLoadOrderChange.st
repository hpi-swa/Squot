actions
updateRootNodesAfterLoadOrderChange
	rootNodes last content ~= editedPatch loadOrderMerge
		ifTrue: [rootNodes addAll: self createLoadOrderNodes].