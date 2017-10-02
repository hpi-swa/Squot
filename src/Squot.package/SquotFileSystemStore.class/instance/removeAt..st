patching
removeAt: path
	self removeFilesFrom: path.
	self shouldStoreMetadata ifTrue:
		[self tableOfContents
			removeAt: path;
			fileOut].