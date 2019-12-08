adding and removing
add: anObject at: path
	| tempArtifact repositoryPath |
	tempArtifact := SquotArtifact new
		path: path;
		initializeDefaultStoreInfoFor: anObject;
		content: (store capture: anObject);
		yourself. "use to validate the path"
	repositoryPath := self validatePath: path for: tempArtifact.
	^ store add: anObject at: repositoryPath