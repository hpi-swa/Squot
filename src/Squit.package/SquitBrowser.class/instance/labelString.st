ui
labelString
	^ String streamContents: [:label |
		label nextPutAll: self class defaultTitle.
		self projectSelection ifNotNil: [:project | | extra |
			label nextPutAll: ': '; nextPutAll: project asString.
			extra := OrderedCollection new.
			self projectSelection hasAdditionalParents ifTrue: [extra add: 'merging'].
			self branchSelection ifNotNil:
				[:branch | 
				extra add:
					(extra ifEmpty: [branch asString]
						ifNotEmpty: ['viewing ', branch asString])].
			extra ifNotEmpty:
				[label nextPutAll: ' ('.].
				extra do: [:each | label nextPutAll: each] separatedBy: [label nextPutAll: ', '].
				label nextPut: $)]]