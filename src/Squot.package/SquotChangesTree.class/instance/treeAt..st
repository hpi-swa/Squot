accessing
treeAt: aString
	| found |
	found := self children at: aString ifAbsentPut: [
		OrderedCollection with: (self class named: aString)].
	found ifEmpty: [found addFirst: (self class named: aString)].
	found first isTree ifFalse: [found addFirst: (self class named: aString)].
	^ found first