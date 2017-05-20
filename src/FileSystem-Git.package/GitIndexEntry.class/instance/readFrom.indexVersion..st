as yet unclassified
readFrom: aStream indexVersion: versionNumber
	| ctimeNanos ctimeSeconds moreFlags mtimeNanos mtimeSeconds shortNameLength startPosition |
	startPosition := aStream position.
	ctimeSeconds := (aStream next: 4) asInteger.
	ctimeNanos := (aStream next: 4) asInteger.
	mtimeSeconds := (aStream next: 4) asInteger.
	mtimeNanos := (aStream next: 4) asInteger.
	device := (aStream next: 4) asInteger.
	inode := (aStream next: 4) asInteger.
	mode := (aStream next: 4) asInteger.
	uid := (aStream next: 4) asInteger.
	gid := (aStream next: 4) asInteger.
	size := (aStream next: 4) asInteger.
	objectHash := (aStream next: 20).
	flags := aStream next: 2.
	versionNumber >= 3 ifTrue: [moreFlags := aStream next: 2].
	shortNameLength := flags second bitOr: ((flags first bitAnd: 2r00001111) bitShift: 8).
	shortNameLength = 16rFFF
		ifTrue: [path := aStream upTo: 0]
		ifFalse: [path := aStream next: shortNameLength].
	self assert: (path noneSatisfy: #isZero).
	self assert: ((aStream next: 8 - (aStream position - startPosition rem: 8)) allSatisfy: #isZero). "padding null terminator"