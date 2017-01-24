tests
testRestoreClass
	| storedClass snapshot targetStore environment restoredClass |
	snapshot := self snapshotClass: (storedClass := self class) at: 'test.class'.
	self flag: #metamodel.
	targetStore := SquotPurStore new.
	targetStore environment: (environment := Environment withName: thisContext printString).
	createdEnvironments add: environment.
	environment import: self class environment.
	environment importSelf.
	targetStore restoreToSnapshot: snapshot.
	self shouldnt: [restoredClass := environment at: storedClass name] raise: KeyNotFound.
	self assert: (restoredClass isKindOf: Class).
	createdClasses add: restoredClass.