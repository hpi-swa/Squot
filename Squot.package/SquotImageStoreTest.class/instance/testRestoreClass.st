tests
testRestoreClass
	| storedClass snapshot restoredClass |
	snapshot := self snapshotClass: (storedClass := self class) at: 'src'.
	imageStore restoreToSnapshot: snapshot.
	self assert: ((restoredClass := imageStore objectAt: 'src/', storedClass package name, '.package/', storedClass name, '.class') isKindOf: Class).
	self assert: restoredClass
		equals: (self shouldnt: [testEnvironment at: storedClass name] raise: KeyNotFound).