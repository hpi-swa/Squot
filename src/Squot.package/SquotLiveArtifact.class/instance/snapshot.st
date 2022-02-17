converting
snapshot
	^ SquotArtifact new
		id: self id;
		path: path;
		content: self content;
		storeInfo: self storeInfo;
		yourself.