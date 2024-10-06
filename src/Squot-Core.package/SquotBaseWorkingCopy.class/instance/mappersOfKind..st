accessing
mappersOfKind: aMapperClass
	^ self mappers select: [:each | each isKindOf: aMapperClass]