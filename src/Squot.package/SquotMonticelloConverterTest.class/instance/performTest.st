private
performTest
	^ self suppressProgressDisplayDuring: [repository withUnitOfWork: [super performTest]]