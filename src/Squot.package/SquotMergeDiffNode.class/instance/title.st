accessing
title
	| willBeLoaded |
	willBeLoaded :=
		artifactDiff isNil
			or: [artifactDiff isConflict not "so it is a merge with something already loaded"]
			or: [artifactDiff isConflict
				and: [artifactDiff isResolved not "so something might be loaded yet"
						or: [artifactDiff resolution willBeLoaded]]].
	^ willBeLoaded
		ifTrue: [title]
		ifFalse: ['( ', title, ' )']