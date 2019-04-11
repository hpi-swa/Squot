tests
testPushImageRegression
"Pushing an image used to throw an error due to a wrong file stream format"
	<timeout: 60>
	self 
		createDummyImage;
		transferMessaged: 'Created dummy image'.
	self 
		assert: self dummyImageContents asByteArray
		equals: (self otherReference resolve: self dummyImage) readStream binary contents.