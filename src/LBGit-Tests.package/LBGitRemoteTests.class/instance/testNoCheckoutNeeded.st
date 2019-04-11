tests
testNoCheckoutNeeded

	<timeout: 20>
	self assert: (self reference resolve: 'README.md') exists.