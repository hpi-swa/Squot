copying
copyWithDifferentContent: newContent
	^ SquotArtifact new
		path: path;
		storeInfo: self storeInfo;
		content: newContent;
		yourself