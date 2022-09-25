Squot deserialization
fillContentOf: anArtifact from: aDirectory
	| classOfStoredObject isClass |
	self flag: 'magic constant PackageInfo'.
	classOfStoredObject := anArtifact storeInfo at: #objectClassName ifAbsent: ['PackageInfo'].
	isClass := classOfStoredObject endsWith: ' class'.
	isClass
		ifTrue: [anArtifact content: (self readClass: classOfStoredObject from: aDirectory)]
		ifFalse: [anArtifact content: (self readPackageFrom: aDirectory)].