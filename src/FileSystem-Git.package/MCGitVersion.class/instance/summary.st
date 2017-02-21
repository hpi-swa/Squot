accessing
summary
	^ String streamContents: [:s |
		s nextPutAll: info summaryHeader.
		"self dependencies isEmpty ifFalse: [
			s cr; nextPutAll: 'Dependencies: '.
			self dependencies
				do: [:ea | s nextPutAll: ea versionInfo name]
				separatedBy: [s nextPutAll: ', ']]".
		s cr; cr; nextPutAll: info message]