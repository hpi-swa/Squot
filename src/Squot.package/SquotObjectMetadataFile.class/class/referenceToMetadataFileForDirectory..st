as yet unclassified
referenceToMetadataFileForDirectory: aDirectory
	^ aDirectory / ({self metadataFileName. '_squot-contents'}
		detect: [:each | (aDirectory / each) exists]
		ifNone: [self metadataFileName])