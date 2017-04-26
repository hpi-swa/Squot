user requests
categoriesPlusPrefixes
	^ (SystemOrganizer default categories gather: [:each | | eachSplitted |
		eachSplitted := each splitBy: '-'.
		eachSplitted withIndexCollect: [:x :index |
		(eachSplitted copyFrom: 1 to: index) joinSeparatedBy: '-']])
		asSet asOrderedCollection sorted