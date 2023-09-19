accessing
mappers
	^ self workingCopy mappers select: [:mapper | mapper isKindOf: SquotTonelMapper]