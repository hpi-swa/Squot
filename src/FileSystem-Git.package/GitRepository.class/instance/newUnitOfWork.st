public-accessing
newUnitOfWork
	| objectStores refStores |
	objectStores := OrderedCollection new: 2.
	objectStores add: (GitLooseObjectStore on: self).
	(GitPackedObjectStore hasPacks: self) ifTrue: [objectStores add: (GitPackedObjectStore on: self)].
	refStores := OrderedCollection new: 2.
	refStores add: (GitLooseRefStore on: self).
	(GitPackedRefStore existsIn: self) ifTrue: [refStores add: (GitPackedRefStore on: self)].
	^ GitUnitOfWork new
		repository: self;
		refStores: refStores;
		objectStores: objectStores;
		yourself
		