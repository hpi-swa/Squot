as yet unclassified
referenceToMetadataFileForFile: aFileReference
	| undottedBasename |
	undottedBasename := aFileReference basename, self metadataFileName.
	^ aFileReference parent / ({'.', undottedBasename. undottedBasename}
		detect: [:each | (aFileReference parent / each) isFile]
		ifNone: ['.', undottedBasename])