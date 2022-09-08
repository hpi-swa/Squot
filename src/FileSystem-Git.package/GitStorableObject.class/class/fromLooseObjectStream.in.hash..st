initialize-release
fromLooseObjectStream: aStream in: aGitRepository hash: aHash
	| code length limitedStream object |
	code := (aStream upTo: Character space asInteger) asString.
	length := (aStream upTo: 0) asString asInteger.
	limitedStream := ReadStream on: (aStream next: length).
	object := (self forType: code) in: aGitRepository hash: aHash size: length.
	^object loadFrom: limitedStream