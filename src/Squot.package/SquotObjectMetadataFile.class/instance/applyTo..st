reading
applyTo: anArtifact
	self isPresent
		ifTrue: [anArtifact mergeStoreInfo: self metadata]
		ifFalse: [SquotNoMetadataFileFound signal
					ifNotNil: [:storeInfo |
								storeInfo ifEmpty: [^ self errorNotFound: anArtifact path].
								anArtifact mergeStoreInfo: storeInfo.
								^ anArtifact storeInfo]
					ifNil: [^ self errorNotFound: anArtifact path]]