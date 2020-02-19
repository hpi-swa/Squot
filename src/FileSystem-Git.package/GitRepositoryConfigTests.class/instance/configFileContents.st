utilities
configFileContents
	^ (configFile readStreamDo: [:stream | stream ascii; contents]) withBlanksTrimmed withSqueakLineEndings