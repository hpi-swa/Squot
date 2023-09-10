accessing
treeAt: aString
	| found |
	found := self children at: aString ifAbsentPut: [
		OrderedCollection with: (self class withLabel: aString)].
	found ifEmpty: [found addFirst: (self class withLabel: aString)].
	found first isTree ifFalse: [found addFirst: (self class withLabel: aString)].
	^ found first