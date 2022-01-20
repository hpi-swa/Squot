tests
testPackagesAddedWithTonelPaths
	| newArtifact |
	workingCopy addLoadedPackageInfoNamed: (self class category copyUpTo: $-) at: 'src/', (self class category copyUpTo: $-) serializer: SquotTonelSerializer.
	"When another package is added without an explicit serializer, Tonel should be used again."
	workingCopy addPackageNamed: 'Kernel' at: 'src'.
	newArtifact := workingCopy artifacts detect: [:each | each object name = 'Kernel'].
	self assert: SquotTonelSerializer name equals: newArtifact storeInfo serializer.
	self assert: 'src/Kernel' equals: newArtifact path. "Path adjusted according to Tonel conventions."