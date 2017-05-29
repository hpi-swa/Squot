Squot repository
createNewVersionFromPatch: aPatch with: aBlock
	"Build a new version with aPatch applied to the first parent version and supply the
	new version or a builder object for it to aBlock, during which additional properties
	can be set up. When aBlock returns here, store the new version permanently."
	^ SquitVersionBuilder new
		repository: self;
		patch: aPatch;
		in: aBlock;
		buildVersion.