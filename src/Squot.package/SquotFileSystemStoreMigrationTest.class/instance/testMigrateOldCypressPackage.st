tests
testMigrateOldCypressPackage
	| originalPackageSnapshot project packageArtifact packageSnapshot |
	"given"
	originalPackageSnapshot := MCSnapshot empty asSquotArtifactForPackage: (PackageInfo new packageName: 'TestPackage').
	(fileStore storeForArtifact: originalPackageSnapshot artifact) putArtifact: originalPackageSnapshot.
	(fileStore metadataFor: originalPackageSnapshot artifact) metadataFile writeStreamDo:
		[:stream |
		stream nextPutAll:
'SquotTrackedObjectMetadata {
	#objectClassName : #PackageInfo,
	#serializer : #SquotCypressCodeSerializer
}'].
	fileStore tableOfContentsReference writeStreamDo:
		[:stream |
		stream nextPutAll:
'OrderedDictionary {
	''TestPackage.package'' : #SquotCypressCodeSerializer
}'].
	"when"
	fileStore := fileStore class inDirectory: fileStore directory. "Initialize freshly"
	project := fileStore readProject.
	packageArtifact := project artifacts detect: [:each | (each storeInfo firstReferenceOfType: 'package' ifNone: []) notNil] ifNone: [self fail: 'Old package not found'].
	packageSnapshot := (fileStore storeForArtifact: packageArtifact) readArtifact: packageArtifact.
	"then"
	self assert: 'TestPackage' equals: packageSnapshot shadowOfTrackedObject packageName;
		assert: packageSnapshot shadowOfTrackedObject asMCSnapshot = originalPackageSnapshot shadowOfTrackedObject asMCSnapshot.