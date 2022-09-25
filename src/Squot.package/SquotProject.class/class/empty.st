instance creation
empty
	^ self new
		setId: UUID new
		metadata: Dictionary new
		artifacts: #();
		yourself