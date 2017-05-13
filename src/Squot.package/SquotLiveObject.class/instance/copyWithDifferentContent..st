copying
copyWithDifferentContent: newContent
	^ SquotArtifact new
		path: path;
		storeInfo: storeInfo copy;
		content: newContent;
		yourself