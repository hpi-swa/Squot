initialize-release
initializeWithReference
	fanoutTable := self readStreamDo: [:stream |
		stream
			position: self fanoutTableStart;
			next: self fanoutTableSize].