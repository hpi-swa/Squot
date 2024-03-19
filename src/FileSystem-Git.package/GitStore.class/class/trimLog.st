internal
trimLog
	"Fix too large log list due to a bug in the tally optimization from November 28, 2021.
	Original code was added by Christoph Thiede (ct) in the package postscript."
	"GitStore trimLog"
	| maxLogSize count |
	LogMessages ifNil: [^ self].
	maxLogSize := 5000.
	(LogMutex ifNil: [LogMutex := Mutex new]) critical:
		[count := LogMessages size.
		LogMessages := (LogMessages asArray last: (count := count clampHigh: maxLogSize)) as: LinkedList. "forth and back conversion to avoid inefficient LinkedList(...)>>#last: (quadratic in older versions of Squeak)"
		LogMessageCount := count].