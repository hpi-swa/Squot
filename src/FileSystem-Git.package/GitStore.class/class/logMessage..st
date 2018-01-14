internal
logMessage: aString
	"Add a message to the internal log."
	"
	LogMessages removeAll.
	LogMessages size.
	"
	| maxLogSize |
	maxLogSize := 5000 "if each entry measures 200B, this would be up to 1MB".
	(LogMutex ifNil: [LogMutex := Mutex new]) critical:
		[LogMessages ifNil: [LogMessages := LinkedList new].
		LogMessages size >= maxLogSize ifTrue: [LogMessages removeFirst].
		LogMessages add:
			(GitStoreLogMessage newFrom: DateAndTime now printString, String cr, aString)]