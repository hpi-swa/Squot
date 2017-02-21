Squot repository
createNewVersion: aSnapshot with: aBlock
	"Build a new version with aSnapshot as its snapshot and supply the new version or a
	builder object for it to aBlock, during which additional properties can be set up.
	When aBlock returns here, store the new version permanently."
	| version |
	version := SquotInMemoryVersion new
		repository: self;
		snapshot: aSnapshot;
		in: aBlock;
		yourself.
	version parents: version parents asArray. "ideally, freeze it"
	version metadata at: #author ifAbsentPut: [SquotAuthorRequest signal].
	version metadata at: #committer ifAbsentPut: [SquotCommitterRequest signal].
	version metadata at: #timestamp ifAbsentPut: [TimeStamp now].
	versions add: version.
	^ version