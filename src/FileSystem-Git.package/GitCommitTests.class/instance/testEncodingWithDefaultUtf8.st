tests
testEncodingWithDefaultUtf8
	| commit commitDataAsSqueakString utf8CommitData |
	self assert: 'utf-8' equals: repository configI18nCommitEncoding.
	commitDataAsSqueakString := 'tree 0000000000000000000000000000000000000000
parent 0000000000000000000000000000000000000000
author Björn Thaddäus <björn.thaddäus@ü.de> 1495318660 +0200
committer Björn Thaddäus <björn.thaddäus@ü.de> 1495318660 +0200

message with German umlauts and special characters:
ÄÖÜäöüß
' withLineEndings: String lf.
	utf8CommitData := UTF8TextConverter encodeByteString: commitDataAsSqueakString.
	commit := GitCommit in: repository.
	commit loadFrom: utf8CommitData asByteArray readStream.
	self assert: 'Björn Thaddäus' equals: commit author name.
	self assert: 'Björn Thaddäus' equals: commit committer name.
	self assert: 'message with German umlauts and special characters:
ÄÖÜäöüß
' equals: commit message withSqueakLineEndings.