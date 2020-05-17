*Squot-Tools
squotChangeAsStringOrText
	| text |
	text := WriteStream on: (Text new: 100).
	(SquotPackageDiff modificationsGroupedByClass: ((containerConflicts reject: [:each | each localChosen]) collect: [:each | each operation]))
		keysAndValuesDo: 
			[:groupKey :items |
			text nextPutAll: groupKey asText allBold;
				cr; cr.
			items do: [:each | text nextPutAll: (containerConflicts at: each definition description) squotChangeAsStringOrText]
				separatedBy: [text cr; cr].
			text cr; cr].
	(SquotPackageDiff modificationsGroupedByClass: self modifications)
		keysAndValuesDo:
			[:groupKey :items |
			text nextPutAll: groupKey asText allBold;
				cr; cr.
			items do: [:each | text nextPutAll: each squotChangeAsStringOrText]
				separatedBy: [text cr; cr].
			text cr; cr].
	^ text contents