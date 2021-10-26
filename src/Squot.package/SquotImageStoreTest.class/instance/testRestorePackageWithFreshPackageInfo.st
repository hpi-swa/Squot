tests
testRestorePackageWithFreshPackageInfo
	| sampleClass className packageInfo packages snapshot restoredClass |
	self suppressChangeNotificationsDuring: [sampleClass := classFactory newClass].
	className := sampleClass name.
	packages := sampleClass environment info packages.
	packageInfo := self newPackageInfoFor: classFactory packageName.
	self assert: packageInfo extensionMethods isEmpty description: 'Prerequisite'.
	snapshot := self snapshotPackage: packageInfo at: 'src'.
	self assert: snapshot artifacts size = 1. "if this fails, change the test to detect the correct artifact"
	self suppressChangeNotificationsDuring:
		[imageStore removeAllObjects.
		packageInfo mcPackage unload].
	self deny: (imageStore objectRegistry anySatisfy: [:each | (each isKindOf: PackageInfo) and: [each packageName = packageInfo packageName]]).
	packages unregisterPackage: packageInfo.
	self assert: (packages packageNamed: packageInfo packageName ifAbsent: []) isNil.
	self suppressChangeNotificationsDuring: [imageStore restoreToSnapshot: snapshot].
	self assert: (self shouldnt: [imageStore objectAt: snapshot artifacts anyOne path] raise: KeyNotFound) = packageInfo.
	self shouldnt: [restoredClass := testEnvironment at: className] raise: KeyNotFound.
	self assert: (restoredClass isKindOf: Class).
	self assert: (testEnvironment info packages packageNames includes: packageInfo packageName).