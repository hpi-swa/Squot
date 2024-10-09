changes-creation
changeSetFromMappers: aCollection removing: anotherCollection changeSets: aDictionary
	"always create, regardless of potential emptiness, to allow version bumps of mappers during serialization"
	^ GSMetadataMappersChangeSet
		withMapper: self
		old: (aCollection select: #isTracked)
		potentiallyRemoved: (anotherCollection select: #isTracked)
		changeSets: aDictionary