as yet unclassified
formatTimeStamp: aTimeStamp
	^ Time humanWordsForSecondsAgo: (TimeStamp now - aTimeStamp) asSeconds