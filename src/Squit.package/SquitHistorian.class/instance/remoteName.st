remote-tracking historian
remoteName
	^ (self git fetchSpecOfTrackingBranch: self expandedName)
		ifNotNil: [:fetchSpec | fetchSpec remoteName]