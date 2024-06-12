changes-creation
changeSetFromMappers: aCollection removing: anotherCollection changeSets: aDictionary
	(anotherCollection isEmpty and: [aCollection asSet = aDictionary keys asSet]) ifTrue: [
		^ SquotEmptyChangeSet withMapper: self].
	^ SquotMappersChangeSet
		withMapper: self
		old: aCollection
		potentiallyRemoved: anotherCollection
		changeSets: aDictionary