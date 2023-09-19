instance creation
requestFSReference
	^ (UIManager default chooseDirectory: 'Repository location:') ifNotNil: #asFSReference.