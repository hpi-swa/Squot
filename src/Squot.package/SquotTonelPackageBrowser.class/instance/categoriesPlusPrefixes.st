accessing
categoriesPlusPrefixes
	^ (SystemOrganizer default categories gather: [:each | | parts |
		parts := each splitBy: '-'.
		parts withIndexCollect: [:x :index |
			(parts copyFrom: 1 to: index) joinSeparatedBy: '-']])
		asSet asOrderedCollection sorted