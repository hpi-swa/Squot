public-accessing
newUnitOfWork
	| objectStores refStores |
	objectStores := OrderedCollection new: 2.
	objectStores add: (GitLooseObjectStore baseDir: self baseDir).
	(GitPackedObjectStore hasPacks: self) ifTrue:
		[objectStores add: (GitPackedObjectStore packsDir: self packsDir)].
	refStores := OrderedCollection new: 2.
	refStores add: (GitLooseRefStore baseDir: self baseDir).
	(GitPackedRefStore existsIn: self) ifTrue:
		[refStores add: (GitPackedRefStore on: self)].
	^ GitUnitOfWork new
		repository: self;
		refStores: refStores;
		objectStores: objectStores;
		yourself
		