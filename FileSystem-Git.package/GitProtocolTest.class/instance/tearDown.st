running
tearDown
	modifiedDefaultStamp ifTrue: [GitStamp defaultName: nil; defaultEmail: nil].
	"TODO: reset these to previous values instead"