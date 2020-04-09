helpers
createSomeCommits
	^ repository withUnitOfWork: [super createSomeCommits]