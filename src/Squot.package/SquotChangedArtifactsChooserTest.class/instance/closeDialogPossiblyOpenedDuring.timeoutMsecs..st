utilities
closeDialogPossiblyOpenedDuring: aBlock timeoutMsecs: millisecondsInteger
	| semaphore previousWorldMorphs worldMorphs dialog |
	semaphore := Semaphore new.
	previousWorldMorphs := Set withAll: self currentWorld submorphs.
	[aBlock value. semaphore signal] fork.
	semaphore waitTimeoutMSecs: millisecondsInteger.
	worldMorphs := self currentWorld submorphs.
	(dialog := (worldMorphs first: (3 min: worldMorphs size))
		detect: [:each | (previousWorldMorphs includes: each) not
					and: [each isKindOf: DialogWindow]] ifNone: [])
		ifNotNil: [dialog closeDialog].