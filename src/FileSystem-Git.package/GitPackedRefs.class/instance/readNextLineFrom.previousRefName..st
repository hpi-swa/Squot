reading and writing
readNextLineFrom: aStream previousRefName: previousName
	| line hexHash refName ref |
	aStream peek = $#
		ifTrue: [aStream upTo: Character lf.
				^ previousName].
	line := aStream upTo: Character lf.
	hexHash := line copyUpTo: Character space.
	refName := line copyAfter: Character space.
	(hexHash first = $^ and: [refName isEmpty]) ifTrue:
		["peeled ref"
		peeledRefsDictionary add: "overwrite"
			(GitReference name: previousName target: hexHash allButFirst).
		^ previousName].
	ref := GitReference name: refName target: hexHash.
	refsDictionary add: ref.
	peeledRefsDictionary add: ref copy.
	"copy because otherwise peeled ref overwrite will affect non-peeled refs dictionary"
	^ refName