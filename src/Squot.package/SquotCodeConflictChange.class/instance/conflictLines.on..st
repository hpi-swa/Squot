ui
conflictLines: aConflict on: aStream
	{
		self leftColor -> 
			({(SquotTextUtilities monospace: self conflictMarkerLeft), ' current'},
			aConflict left).
		self baseColor ->
			({(SquotTextUtilities monospace: self conflictMarkerBase), ' base'},
			aConflict original,
			{SquotTextUtilities monospace: self conflictMarkerSeparator}).
		self rightColor ->
			(aConflict right,
			{(SquotTextUtilities monospace: self conflictMarkerRight), ' incoming'}).
	} do: [:each | each value do: [:line |
		aStream nextPut: (SquotTextUtilities
								colorText: (self withConflictTextClickHandler: line)
								with: each key)]].