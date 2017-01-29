initialize-release
setUp
	createdClasses := OrderedCollection new.
	testEnvironment := self createTestEnvironment.
	imageStore := SquotImageStore new
		environment: testEnvironment;
		yourself.