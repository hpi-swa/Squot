ui
hasProjectSelection
	^ self projectSelection
		ifNil: [false]
		ifNotNil: [:project | repositoryExists := project repository exists]