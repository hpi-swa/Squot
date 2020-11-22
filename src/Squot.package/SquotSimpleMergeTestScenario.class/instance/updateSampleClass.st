setUp
updateSampleClass
	sampleClass isString ifTrue:
		[sampleClass := (PackageInfo
							squotEnvironmentOf: (workingCopy artifactAt: packagePath))
							classNamed: sampleClass].