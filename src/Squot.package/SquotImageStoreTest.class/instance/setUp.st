running
setUp
	classFactory := ClassFactoryForTestCase new.
	createdClasses := OrderedCollection new.
	testEnvironment := self class environment.
	imageStore := SquotImageStore new
		environment: testEnvironment;
		yourself.
	changeLogSuppressor := SUnitChangeLogSuppressor new.