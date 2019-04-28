running
setUp
	classFactory := ClassFactoryForTestCase new.
	createdClasses := OrderedCollection new.
	testEnvironment := self createTestEnvironment.
	imageStore := SquotImageStore new
		environment: testEnvironment;
		yourself.
	imageStore removeAt: SquotFilesArtifact path.
	changeLogSuppressor := SUnitChangeLogSuppressor new.