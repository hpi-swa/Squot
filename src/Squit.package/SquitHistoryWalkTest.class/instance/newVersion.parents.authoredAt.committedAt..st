tests
newVersion: messageString parents: parentsCollection authoredAt: authorTimestampString committedAt: commitTimestampString
	| writer |
	writer := repository historianNamed: 'writer'.
	parentsCollection
		ifEmpty: [writer version: nil]
		ifNotEmpty: [writer version: parentsCollection first].
	^ writer createNewVersion: SquotSnapshot empty with: [:version |
		version
			message: messageString;
			parents: parentsCollection;
			authoringTimeStamp: (DateAndTime fromString: authorTimestampString);
			committingTimeStamp: (DateAndTime fromString: commitTimestampString)]