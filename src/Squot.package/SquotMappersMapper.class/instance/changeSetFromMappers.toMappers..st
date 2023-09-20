changes-creation
changeSetFromMappers: aCollection toMappers: anotherCollection
	(aCollection sameElements: anotherCollection) ifTrue: [
		^ SquotEmptyChangeSet withMapper: self].
	^ SquotMappersChangeSet
		withMapper: self
		old: aCollection
		new: anotherCollection