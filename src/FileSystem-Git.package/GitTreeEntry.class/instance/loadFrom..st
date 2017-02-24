initialize-release
loadFrom: aStream
	| tmp mirrorIndex |
	self loadModeFrom: aStream.
	entryName := (aStream upTo: 0) asString.
	entryHash := LargePositiveInteger new: 20 neg: false.
	aStream next: 20 into: entryHash. "big endian"
	"swap byte order, because LargePositiveInteger is little endian"
	1 to: 10 do: [:i | tmp := entryHash digitAt: i.
		entryHash digitAt: i put: (entryHash digitAt: (mirrorIndex := 21 - i));
			digitAt: mirrorIndex put: tmp].
	^self