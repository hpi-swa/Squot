private
performTest
	^ squitRepository withUnitOfWork: [super performTest]