printing
summary
	| message commitHash author committer parents timeStamp |
	message := self version message.
	commitHash := self version shortId.
	parents := self version parents collect: [:each | each shortId].
	author := (self version metadata at: #author), ' <', (self version metadata at: #authorEmail), '>'.
	committer := (self version metadata at: #committer), ' <', (self version metadata at: #committerEmail), '>'.
	timeStamp := self version metadata at: #timestamp.
	^ message, String cr,
		'Commit: ', commitHash, ', Parents: ', parents asCommaString, String cr,
		'Author: ', author, String cr,
		'Commiter:  ', committer, String cr,
		'Date: ', timeStamp, String cr