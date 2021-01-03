Squot repository
createNewVersionFromPatch: aPatch with: aBlock
	"Build a new version with aPatch applied to the first parent version and supply the
	new version or a builder object for it to aBlock, during which additional properties
	can be set up. When aBlock returns here, store the new version permanently.
	Answer the new version. Ideally the version object will have a snapshot with all patched artifacts already included (i. e. they need not be read again later)."
	self shouldBeImplemented