running
performTest
	^ repository withUnitOfWork: [self suppressProgressDisplayDuring: [super performTest]]