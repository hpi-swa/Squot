comparing
squotMergeWith: incomingProjectSnapshot basedOn: baseProjectSnapshot
	^ SquotProjectMergeFactory new
		merge: incomingProjectSnapshot
		into: self
		basedOn: baseProjectSnapshot