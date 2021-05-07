converting
snapshot
	^ SquotArtifact new
		path: path;
		content: self content;
		storeInfo: self storeInfo;
		yourself.