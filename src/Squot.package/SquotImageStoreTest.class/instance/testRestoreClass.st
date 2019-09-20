tests
testRestoreClass
	| storedClass snapshot restoredClass |
	snapshot := self snapshotClass: (storedClass := self class) at: 'src'.
	changeLogSuppressor suppressChangeNotificationsDuring:
		[SquotChangeSetTestCleanup removeNewChangeSetsNamedLike: self class name
			after: [imageStore restoreToSnapshot: snapshot]].
	self assert: snapshot artifacts size = 1. "if this fails, change the test do detect the correct artifact"
	self assert: ((restoredClass := imageStore objectAt: snapshot artifacts anyOne path) isKindOf: Class).
	self assert: restoredClass
		equals: (self shouldnt: [testEnvironment at: storedClass name] raise: KeyNotFound).