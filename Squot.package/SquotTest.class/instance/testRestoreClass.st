tests
testRestoreClass
	| storedClass snapshot targetStore environment restoredClass |
	snapshot := self snapshotClass: (storedClass := self class) at: 'test.class'.
	self flag: #metamodel.
	targetStore := SquotPurStore new.
	targetStore environment: (environment := self createTestEnvironment).
	targetStore restoreToSnapshot: snapshot.
	self assert: ((restoredClass := targetStore objectAt: 'test.class') isKindOf: Class).
	self assert: restoredClass
		equals: (self shouldnt: [environment at: storedClass name] raise: KeyNotFound).