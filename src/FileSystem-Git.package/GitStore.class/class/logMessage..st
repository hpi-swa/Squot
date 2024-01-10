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
		LogMessageCount ifNil: [LogMessageCount := LogMessages size].
		LogMessageCount >= maxLogSize
			ifTrue: [LogMessages removeFirst]
			ifFalse: [LogMessageCount := LogMessageCount + 1].
		LogMessages add: DateAndTime now printString, String cr, aString]