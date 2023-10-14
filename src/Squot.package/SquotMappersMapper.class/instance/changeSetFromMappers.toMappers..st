changes-creation
changeSetFromMappers: aCollection toMappers: anotherCollection
	(aCollection asSet = anotherCollection asSet) ifTrue: [
		^ SquotEmptyChangeSet withMapper: self].
	^ SquotMappersChangeSet
		withMapper: self
		old: aCollection
		new: anotherCollection