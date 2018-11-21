initialize-release
parseString: aString
	| startIndex colonIndex |
	aString ifEmpty: [self error: 'Invalid refspec: must not be empty.'].
	destructiveUpdatesAllowed := aString first = $+.
	startIndex := destructiveUpdatesAllowed ifTrue: [2] ifFalse: [1].
	colonIndex := aString indexOf: $: startingAt: startIndex.
	colonIndex == 0 ifTrue: [self error: 'Invalid refspec: must contain a colon'].
	leftRefPattern := aString copyFrom: startIndex to: colonIndex - 1.
	rightRefPattern := aString allButFirst: colonIndex.