*Squot-trackable
squotAddTransientStoreInfoTo: aTrackableObjectMetadata
	| monticelloPackage |
	super squotAddTransientStoreInfoTo: aTrackableObjectMetadata.
	(monticelloPackage := self mcPackage) hasWorkingCopy
		ifTrue: [aTrackableObjectMetadata at: #environment
				put: (monticelloPackage workingCopy environment)]
		ifFalse: [ | newWorkingCopy |
			newWorkingCopy := monticelloPackage workingCopy.
			newWorkingCopy environment: Environment current.
			aTrackableObjectMetadata at: #environment put: newWorkingCopy environment].