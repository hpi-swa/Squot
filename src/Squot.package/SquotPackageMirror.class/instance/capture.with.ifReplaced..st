capturing
capture: aPackageInfo with: aSquotObjectCapturer ifReplaced: aBlock
	| environment mcEnvironment snapshot |
	aSquotObjectCapturer flag: #unusedArgument.
	environment := self environmentInMetadata: SquotCurrentMetadata value.
	mcEnvironment := aPackageInfo workingCopy environment.
	(mcEnvironment ~= environment and: [environment = Smalltalk globals]) ifTrue:
		[Warning signal: 'Capturing ', self asString, ' in Environment ', mcEnvironment asString.
		environment := mcEnvironment].
	snapshot := environment beCurrentDuring:
		[(MCPackage named: aPackageInfo packageName) snapshot].
	^ SquotPackageShadow
		forPackageNamed: aPackageInfo packageName
		withSnapshot: snapshot
		tonelProperties: (SquotPackageInfoExtension of: aPackageInfo) tonelProperties