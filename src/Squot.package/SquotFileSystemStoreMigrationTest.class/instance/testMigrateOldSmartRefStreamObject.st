tests
testMigrateOldSmartRefStreamObject
	| valueHolderStore className originalSnapshot project artifact snapshot |
	"given"
	valueHolderStore := SquotValueHolderStore new.
	valueHolderStore
		contents: 'This is the test object';
		createArtifact.
	valueHolderStore artifact path: 'testobject.dat'.
	SquotSmartRefStreamFile setUpArtifactMetadata: valueHolderStore artifact storeInfo referenceNamed: valueHolderStore artifact storeInfo references first key.
	className := valueHolderStore contents class name.
	originalSnapshot := valueHolderStore readArtifact: valueHolderStore artifact.
	(fileStore storeForArtifact: originalSnapshot artifact) putArtifact: originalSnapshot.
	(fileStore metadataFor: originalSnapshot artifact) metadataFile writeStreamDo:
		[:stream |
		stream nextPutAll:
'SquotTrackedObjectMetadata {
	#objectClassName : #', className, ',
	#serializer : #SquotSmartRefStreamSerializer
}'].
	fileStore tableOfContentsReference writeStreamDo:
		[:stream |
		stream nextPutAll:
'OrderedDictionary {
	''testobject.dat'' : #SquotSmartRefStreamSerializer
}'].
	"when"
	fileStore := fileStore class inDirectory: fileStore directory. "Initialize freshly"
	project := fileStore readProject.
	artifact := project artifacts detect: [:each | (each storeInfo firstReferenceOfType: 'ValueHolder' ifNone: []) notNil] ifNone: [self fail: 'Old object not found'].
	snapshot := (fileStore storeForArtifact: artifact) readArtifact: artifact.
	"then"
	self assert: 'SmartRefStream' equals: (snapshot artifact storeInfo references anyOne at: 'codec-class');
		assert: (snapshot shadowOfTrackedObject value = 'This is the test object');
		assert: (snapshot shadowOfTrackedObject name = originalSnapshot shadowOfTrackedObject name).