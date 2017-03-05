tests
testRestorePackage
	| sampleClass packageInfo snapshot restoredClass |
	sampleClass := classFactory newClass.
	packageInfo := self newPackageInfoFor: classFactory packageName.
	self assert: packageInfo extensionMethods isEmpty description: 'Prerequisite'.
	snapshot := self snapshotPackage: packageInfo at: 'src'.
	changeLogSuppressor suppressChangeNotificationsDuring: [imageStore restoreToSnapshot: snapshot].
	self assert: (self shouldnt: [imageStore objectAt: 'src/', packageInfo packageName, '.package'] raise: KeyNotFound) = packageInfo.
	self shouldnt: [restoredClass := testEnvironment at: sampleClass name] raise: KeyNotFound.
	self assert: (restoredClass isKindOf: Class).
	self assert: (testEnvironment info packages packageNames includes: packageInfo packageName).