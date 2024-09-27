changes-creation
mappersChangeSetFromMappers: aCollection removing: anotherCollection changeSets: aDictionary
	"always create, regardless of potential emptiness, to allow version bumps of mappers during serialization"
	^ SquotMetadataMappersChangeSet
		withMapper: self
		old: aCollection
		potentiallyRemoved: anotherCollection
		changeSets: aDictionary