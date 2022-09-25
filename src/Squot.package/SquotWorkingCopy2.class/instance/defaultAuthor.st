ancestry
defaultAuthor
	repository extension: #authorInformation
		ifPresent: [:authorInformation | ^ authorInformation defaultAuthor]
		ifAbsent: [].
	^ Utilities authorInitials