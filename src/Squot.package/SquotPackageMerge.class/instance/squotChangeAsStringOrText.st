*Squot-Tools
squotChangeAsStringOrText
	| text |
	text := WriteStream on: (Text new: 100).
	containerConflicts
		do: [:each | text nextPutAll: each squotChangeAsStringOrText]
		separatedBy: [text cr; cr].
	self modificationsGroupedByClass
		keysAndValuesDo:
			[:groupKey :items |
			text nextPutAll: groupKey asText allBold;
				cr; cr.
			items do: [:each | text nextPutAll: each squotChangeAsStringOrText]
				separatedBy: [text cr; cr]].
	^ text contents