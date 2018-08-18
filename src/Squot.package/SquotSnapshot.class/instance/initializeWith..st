initialize-release
initializeWith: aCollectionOfArtifacts
	| paths |
	self initialize.
	paths := OrderedCollection new.
	aCollectionOfArtifacts
		do: [:each |
			artifacts at: each path put: each.
			paths add: each path].
	self loadOrder: paths asArray.