toolbuilder
repositoryButtonText

	^ self selectedRepository
		ifNotNil: ['Edit Credentials']
		ifNil: ['Clone & Merge'] 