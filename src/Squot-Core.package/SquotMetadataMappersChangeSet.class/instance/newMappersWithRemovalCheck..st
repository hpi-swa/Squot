accessing
newMappersWithRemovalCheck: aBlock
	| removedMappers |
	removedMappers := self potentiallyRemovedMappers select: [:each |
							aBlock value: (self mapperChangeSets at: each)].
	^ self allMappers copyWithoutAll: removedMappers