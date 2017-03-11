private creating new versions
guessArtifactsFromFilesIn: aDirectoryReference
	self flag: #generalize. "this is specific to code, allow other handlers like plugins"
	^ (self packageDirectoriesIn: aDirectoryReference) gather:
		[:each | | cypressDeserializer packageInfo artifact |
		cypressDeserializer := SquotCypressCodeDeserializer new.
		packageInfo := cypressDeserializer packageIn: each.
		(store includes: packageInfo)
			ifTrue: [artifact := SquotArtifact new
						path: (SquotPath fromReference: each);
						initializeDefaultStoreInfoFor: packageInfo;
						yourself.
					cypressDeserializer fillContentOf: artifact from: each.
					Array with: artifact]
			ifFalse: [Array empty]]