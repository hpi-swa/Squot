private
guessSerializerForArtifact: anArtifact in: aFileOrDirectory
	(aFileOrDirectory basename endsWith: '.package')
		ifTrue: [anArtifact storeInfo
			at: #serializer put: PackageInfo new squotPreferredSerializer name;
			at: #objectClassName ifAbsentPut: [PackageInfo name]].
	^ anArtifact storeInfo at: #serializer ifAbsent: []