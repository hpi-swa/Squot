accessing
title
	| willBeLoaded |
	willBeLoaded := artifactDiff isNil or: [artifactDiff willBeLoaded].
	^ willBeLoaded
		ifTrue: [title]
		ifFalse: ['( ', title, ' )']