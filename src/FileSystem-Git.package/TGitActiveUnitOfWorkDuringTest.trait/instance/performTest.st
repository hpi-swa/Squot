private
performTest
	^ self repository withUnitOfWork: [super performTest]