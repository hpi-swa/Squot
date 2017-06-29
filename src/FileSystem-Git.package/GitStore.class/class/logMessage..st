internal
logMessage: aString
	"Add a message to the internal log."
	"
	LogMessages removeAll.
	LogMessages size.
	"
	| maxLogSize |
	maxLogSize := 1000 "if each entry measured 1KB, this would be up to 1MB".
	(LogMutex ifNil: [LogMutex := Mutex new]) critical:
		[LogMessages ifNil: [LogMessages := LinkedList new].
		LogMessages size >= maxLogSize ifTrue: [LogMessages removeFirst].
		LogMessages add: DateAndTime now printString, String cr, aString]