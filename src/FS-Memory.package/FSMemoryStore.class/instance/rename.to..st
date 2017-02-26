public
rename: sourcePath to: destinationPath
	| sourceEntry destinationParentEntry newName |
	
	sourceEntry := self nodeAt: sourcePath.
	newName := destinationPath basename.
	
	destinationParentEntry := self nodeAt: destinationPath parent.
	
	destinationParentEntry isDictionary
		ifFalse: [ Error signal: 'Copy destination has to be a directory' ].
	destinationParentEntry 
		at: newName
		ifPresent: [:existing | FSFileExists signal: 'Destination file exists already' ].
		
	destinationParentEntry 
		at: newName
		put: sourceEntry.
	
	
	(self nodeAt: sourcePath parent)
		removeKey: sourcePath basename 
	