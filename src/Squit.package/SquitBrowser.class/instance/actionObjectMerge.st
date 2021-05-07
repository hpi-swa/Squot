actions on objects
actionObjectMerge
	self withUnitOfWork:
	[self projectSelection
		mergeArtifactInteractively: self objectSelection artifact
		from: self commitSelection
		ifCanceled: [^ self]].