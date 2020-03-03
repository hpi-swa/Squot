private
performTest
	^ repository repository withUnitOfWork: [super performTest]