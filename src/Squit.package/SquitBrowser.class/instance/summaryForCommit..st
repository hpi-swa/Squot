ui
summaryForCommit: aSquitVersion
	| message commitHash author committer parents timeStamp |
	message := aSquitVersion message.
	commitHash := aSquitVersion shortId.
	parents := aSquitVersion parents collect: [:each | each shortId].
	author := (aSquitVersion metadata at: #author), ' <', (aSquitVersion metadata at: #authorEmail), '>'.
	committer := (aSquitVersion metadata at: #committer), ' <', (aSquitVersion metadata at: #committerEmail), '>'.
	timeStamp := aSquitVersion metadata at: #timestamp.
	timeStamp := timeStamp offsetSeconds = DateAndTime now offsetSeconds
		ifTrue: [timeStamp asString allButLast: 6 "('+xx:00' size)"]
		ifFalse: [timeStamp asString].
	^ message withBlanksTrimmed, String cr, String cr,
		'Commit: ', commitHash, ', Parents: ', parents asCommaString, String cr,
		'Author: ', author, String cr,
		'Committer: ', committer, String cr,
		'Date: ', timeStamp