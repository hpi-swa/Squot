formatting
formatTimeStamp: aTimeStamp
	^ Time humanWordsForSecondsAgo: (TimeStamp now - aTimeStamp) asSeconds