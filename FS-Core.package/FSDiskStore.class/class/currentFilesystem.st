current
currentFilesystem
	^ CurrentFS ifNil: [CurrentFS := FSFilesystem store: self activeClass createDefault]