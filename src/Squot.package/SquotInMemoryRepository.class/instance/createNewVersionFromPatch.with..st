Squot repository
createNewVersionFromPatch: aPatch with: aBlock
	"Build a new version with aPatch applied to the first parent version and supply the
	new version or a builder object for it to aBlock, during which additional properties
	can be set up. When aBlock returns here, store the new version permanently."
	| version |
	version := SquotInMemoryVersion new
		repository: self;
		in: aBlock;
		yourself.
	version parents: version parents asArray. "ideally, freeze it"
	version snapshot: (version parentSnapshot applyPatch: aPatch) snapshot.
	version metadata
		at: #author ifAbsentPut: [SquotAuthorRequest signal];
		at: #committer ifAbsentPut: [SquotCommitterRequest signal];
		at: #timestamp ifAbsentPut: [TimeStamp now].
	versions add: version.
	^ version