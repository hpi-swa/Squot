adding and removing
add: anObject at: path
	| tempArtifact validatedPath |
	(tempArtifact := SquotArtifact new)
		path: path;
		initializeDefaultStoreInfoFor: anObject;
		content: (store capture: anObject withMetadata: tempArtifact storeInfo);
		yourself. "use to validate the path"
	validatedPath := self validatePath: path for: tempArtifact.
	store add: anObject at: validatedPath.
	self appendToLoadOrder: validatedPath.
	^ store artifactAt: validatedPath