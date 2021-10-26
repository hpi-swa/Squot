comparing
hash
	"Answer an integer value that is related to the identity of the receiver."

	^ self target hasSquotShadowName
		ifTrue: [self target name hash]
		ifFalse: [self target hash].