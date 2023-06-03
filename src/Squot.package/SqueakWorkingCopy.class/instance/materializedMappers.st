accessing
materializedMappers
	^ self mappers select: [:mapper | mapper isMaterialized]