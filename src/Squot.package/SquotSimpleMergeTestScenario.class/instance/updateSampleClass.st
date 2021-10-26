setUp
updateSampleClass
	| newClass |
	sampleClass isString ifTrue:
		[newClass := (PackageInfo
							squotEnvironmentOf: (workingCopy artifactAt: packagePath))
							classNamed: sampleClass.
		newClass ifNil: [(NotFound object: sampleClass) signal: 'Sample class not found (vanished or not recreated)'].
		sampleClass := newClass].