merging
squotMergeWith: incomingObjectShadow basedOn: baseObjectShadow
	^ SquotObjectShadowMerge
		into: self
		merge: incomingObjectShadow
		basedOn: baseObjectShadow