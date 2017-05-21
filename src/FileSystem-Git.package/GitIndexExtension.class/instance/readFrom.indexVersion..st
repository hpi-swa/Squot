reading and writing
readFrom: aStream indexVersion: versionNumber
	| size |
	signature := aStream next: 4.
	size := (aStream next: 4) asInteger.
	data := aStream next: size.