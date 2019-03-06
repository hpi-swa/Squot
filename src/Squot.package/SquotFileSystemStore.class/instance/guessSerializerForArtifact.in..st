private
guessSerializerForArtifact: anArtifact in: aFileOrDirectory
	self isThisEverCalled.
	self deprecated.
	(aFileOrDirectory basename endsWith: '.package')
		ifTrue: [anArtifact storeInfo
			serializer: PackageInfo basicNew squotShadowFactory basicNew squotPreferredSerializer;
			objectClass: PackageInfo].
	^ anArtifact storeInfo at: #serializer ifAbsent: []