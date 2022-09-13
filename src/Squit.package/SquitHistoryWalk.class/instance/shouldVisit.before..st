adapting
shouldVisit: markedVersion1 before: markedVersion2
	"Visit later committed versions first. If both were committed at the same time, try to determine whether one of them is the parent of the other, then visit the descendant first."
	| ts1 ts2 |
	ts1 := markedVersion1 object commit committer timeStamp.
	ts2 := markedVersion2 object commit committer timeStamp.
	ts1 ~= ts2 ifTrue: [^ ts1 > ts2].
	(markedVersion1 object commit parents includes: markedVersion2 object commit)
		ifTrue: [^ true].
	(markedVersion2 object commit parents includes: markedVersion1 object commit)
		ifTrue: [^ false].
	^ true "This may not be correct, but to make a correct decision we would have to search deeper in the ancestry. This is avoided for performance reasons for now."