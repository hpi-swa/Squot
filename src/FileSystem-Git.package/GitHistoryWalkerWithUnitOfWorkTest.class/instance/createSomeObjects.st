helpers
createSomeObjects
	^ repository withUnitOfWork: [super createSomeObjects]