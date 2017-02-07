Squot repository
createNewVersion: aSnapshot with: aBlock
	"Build a new version with aSnapshot as its snapshot and supply the new version or a
	builder object for it to aBlock, during which additional properties can be set up.
	When aBlock returns here, store the new version permanently."
	^ SquitVersionBuilder new
		repository: self;
		snapshot: aSnapshot;
		in: aBlock;
		buildVersion.