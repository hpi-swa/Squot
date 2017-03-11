accessing
pathOf: aReference
	^ SquotPath fromPath: (aReference relativeTo: directory)