testing
includesObjectAt: path
	^ (workingCopy project includesArtifactWithId: path)
		or: [workingCopy project artifacts
				anySatisfy: [:each | (each storeInfo at: 'path') = path]]