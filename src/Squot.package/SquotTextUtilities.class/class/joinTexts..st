joining
joinTexts: aCollection
	^ Text streamContents: [:stream |
		aCollection do: [:each | stream nextPutAll: each] separatedBy: [stream lf]]