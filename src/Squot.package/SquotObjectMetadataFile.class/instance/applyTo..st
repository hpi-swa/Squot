reading
applyTo: anArtifact
	self isPresent
		ifTrue: [anArtifact updateStoreInfo: self metadata]
		ifFalse: [SquotNoMetadataFileFound signal
					ifNotNil: [:storeInfo |
								storeInfo ifEmpty: [^ self errorNotFound: anArtifact path].
								anArtifact updateStoreInfo: storeInfo.
								^ anArtifact storeInfo]
					ifNil: [^ self errorNotFound: anArtifact path]]