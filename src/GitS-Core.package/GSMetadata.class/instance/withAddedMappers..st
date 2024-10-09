untracked-mappers
withAddedMappers: aCollection
	aCollection ifEmpty: [^ self].
	^ self copy
		mappers: self mappers, aCollection;
		yourself