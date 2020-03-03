remote-tracking historian
remoteName
	^ (self gitRepository fetchSpecOfTrackingBranch: self expandedName)
		ifNotNil: [:fetchSpec | fetchSpec remoteName]