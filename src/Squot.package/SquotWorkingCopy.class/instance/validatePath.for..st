adding and removing
validatePath: path for: anArtifact
	| storePath repositoryPath |
	storePath := store validatePath: path for: anArtifact.
	repositoryPath := repository validatePath: storePath for: anArtifact.
	repositoryPath ~= storePath ifTrue:
		[(store validatePath: repositoryPath for: anArtifact) ~= repositoryPath ifTrue:
			[self error: 'Incompatible store and repository. Not yet implemeneted.']].
	^ repositoryPath