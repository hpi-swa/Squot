tests
testRestorePackage
	| sampleClass packageInfo snapshot restoredClass |
	self suppressChangeNotificationsDuring: [sampleClass := classFactory newClass].
	packageInfo := self newPackageInfoFor: classFactory packageName.
	self assert: packageInfo extensionMethods isEmpty description: 'Prerequisite'.
	snapshot := self snapshotPackage: packageInfo at: 'src'.
	self assert: snapshot artifacts size = 1. "if this fails, change the test to detect the correct artifact"
	self suppressChangeNotificationsDuring: [imageStore restoreToSnapshot: snapshot].
	self assert: (self shouldnt: [imageStore objectAt: snapshot artifacts anyOne path] raise: KeyNotFound) = packageInfo.
	self shouldnt: [restoredClass := testEnvironment at: sampleClass name] raise: KeyNotFound.
	self assert: (restoredClass isKindOf: Class).
	self assert: (testEnvironment info packages packageNames includes: packageInfo packageName).