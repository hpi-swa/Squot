utilities
configFileContents
	^ (repository baseDir / 'config' readStreamDo: [:stream | stream ascii; contents]) withBlanksTrimmed withSqueakLineEndings