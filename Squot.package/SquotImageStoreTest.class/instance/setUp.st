initialize-release
setUp
	classFactory := ClassFactoryForTestCase new.
	createdClasses := OrderedCollection new.
	testEnvironment := self createTestEnvironment.
	imageStore := SquotImageStore new
		environment: testEnvironment;
		yourself.
	changeLogSuppressor := SUnitChangeLogSuppressor new.