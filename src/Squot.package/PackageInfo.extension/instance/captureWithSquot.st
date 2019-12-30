*Squot-trackable
captureWithSquot
	| environment mcEnvironment snapshot |
	environment := self class squotEnvironmentInMetadata: SquotCurrentMetadata value.
	mcEnvironment := self workingCopy environment.
	(mcEnvironment ~= environment and: [environment = Smalltalk globals]) ifTrue:
		[Warning signal: 'Capturing ', self asString, ' in Environment ', mcEnvironment asString.
		environment := mcEnvironment].
	snapshot := environment beCurrentDuring:
		[(MCPackage named: self packageName) snapshot].
	^ self squotShadowFactory
		forPackageNamed: self packageName
		withSnapshot: snapshot