private
guessSerializerForArtifact: anArtifact in: aFileOrDirectory
	(aFileOrDirectory basename endsWith: '.package')
		ifTrue: [anArtifact storeInfo
			serializer: PackageInfo basicNew squotShadowFactory basicNew squotPreferredSerializer;
			objectClass: PackageInfo].
	^ anArtifact storeInfo at: #serializer ifAbsent: []