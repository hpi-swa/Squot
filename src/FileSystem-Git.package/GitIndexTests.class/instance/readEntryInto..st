helpers
readEntryInto: aCollection
	"see 'index-format.txt' in the docs and the manpage for 'lstat'"
	self fieldsDo: [ :name :length |
		aCollection add:
			name ->
				(length
					ifNotNil: [ indexReader next: length ]
					ifNil: [ indexReader upTo: 0 ]) ]