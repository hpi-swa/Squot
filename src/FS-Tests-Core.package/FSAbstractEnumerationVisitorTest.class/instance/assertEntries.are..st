as yet unclassified
assertEntries: references are: expected
	| strings |
	self assert: references isArray.
	references do: [ :ea | self assert: ea class = FSDirectoryEntry ].
	strings := references collect: [ :ea | ea reference pathString ].
	self assert: strings = expected