tests
testEncodingWithLatin1
	| commit commitDataAsSqueakString latin1CommitData |
	repository configI18nCommitEncoding: 'latin1'.
	commitDataAsSqueakString := 'tree 0000000000000000000000000000000000000000
parent 0000000000000000000000000000000000000000
author Björn Thaddäus <björn.thaddäus@ü.de> 1495318660 +0200
committer Björn Thaddäus <björn.thaddäus@ü.de> 1495318660 +0200

message with German umlauts and special characters:
ÄÖÜäöüß
' withLineEndings: String lf.
	latin1CommitData := Latin1TextConverter new encodeString: commitDataAsSqueakString.
	commit := GitCommit in: repository.
	commit loadFrom: latin1CommitData asByteArray readStream.
	self assert: 'Björn Thaddäus' equals: commit author name.
	self assert: 'Björn Thaddäus' equals: commit committer name.
	self assert: 'message with German umlauts and special characters:
ÄÖÜäöüß
' equals: commit message withSqueakLineEndings.