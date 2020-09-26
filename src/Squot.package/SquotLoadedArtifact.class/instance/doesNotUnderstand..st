delegating
doesNotUnderstand: aMessage
	"Forward other messages to the stored artifact."
	| answer |
	answer := aMessage sendTo: storeArtifact.
	answer == storeArtifact ifTrue: [^ self]. "Keep me as 'self' receiver"
	^ answer