running
tearDown
	[classFactory cleanUp]
		ensure:
			[changesFile
				useStandardChangesFile;
				delete].