*SquotTonel-tests
testMigrateOldTonelPackage
	| originalPackageSnapshot project packageArtifact packageSnapshot |
	"given"
	originalPackageSnapshot := MCSnapshot empty asSquotArtifactForPackage: (PackageInfo new packageName: 'TestPackage').
	originalPackageSnapshot artifact storeInfo references first value at: 'content-type' put: 'application/x.smalltalk.tonel.v0'.
	(fileStore storeForArtifact: originalPackageSnapshot artifact) putArtifact: originalPackageSnapshot.
	(fileStore metadataFor: originalPackageSnapshot artifact) metadataFile writeStreamDo:
		[:stream |
		stream nextPutAll:
'SquotTrackedObjectMetadata {
	#objectClassName : #PackageInfo,
	#serializer : #SquotTonelSerializer
}'].
	fileStore tableOfContentsReference writeStreamDo:
		[:stream |
		stream nextPutAll:
'OrderedDictionary {
	''TestPackage.package'' : #SquotTonelSerializer
}'].
	"when"
	fileStore := fileStore class inDirectory: fileStore directory. "Initialize freshly"
	project := fileStore readProject.
	packageArtifact := project artifacts detect: [:each | (each storeInfo firstReferenceOfType: 'package' ifNone: []) notNil] ifNone: [self fail: 'Old package not found'].
	packageSnapshot := (fileStore storeForArtifact: packageArtifact) readArtifact: packageArtifact.
	"then"
	self assert: 'TestPackage' equals: packageSnapshot shadowOfTrackedObject packageName;
		assert: packageSnapshot shadowOfTrackedObject asMCSnapshot = originalPackageSnapshot shadowOfTrackedObject asMCSnapshot.