printing
summary
	| message commitHash author committer parents timeStamp |
	message := self item message.
	commitHash := self item shortId.
	parents := self item parents collect: [:each | each shortId].
	author := (self item metadata at: #author), ' <', (self item metadata at: #authorEmail), '>'.
	committer := (self item metadata at: #committer), ' <', (self item metadata at: #committerEmail), '>'.
	timeStamp := self item metadata at: #timestamp.
	^ message withBlanksTrimmed, String cr, String cr,
		'Commit: ', commitHash, ', Parents: ', parents asCommaString, String cr,
		'Author: ', author, String cr,
		'Committer: ', committer, String cr,
		'Date: ', timeStamp, String cr