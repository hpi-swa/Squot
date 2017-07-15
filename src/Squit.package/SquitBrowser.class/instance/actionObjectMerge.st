actions on objects
actionObjectMerge
	self projectSelection
		mergeArtifactInteractively: self objectSelection artifact
		from: self commitSelection
		ifCanceled: [].