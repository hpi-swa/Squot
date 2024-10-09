ui
conflictLines: aConflict on: aStream
	{
		self leftColor -> 
			({(GSTextUtilities monospace: self conflictMarkerLeft), ' current'},
			aConflict left).
		self baseColor ->
			(GSPreferences showBase
				ifTrue: [
					{(GSTextUtilities monospace: self conflictMarkerBase), ' base'},
					aConflict original,
					{GSTextUtilities monospace: self conflictMarkerSeparator}]
				ifFalse: [
					{GSTextUtilities monospace: self conflictMarkerSeparator}]).
		self rightColor ->
			(aConflict right,
			{(GSTextUtilities monospace: self conflictMarkerRight), ' incoming'}).
	} do: [:each | each value do: [:line |
		aStream nextPut: (GSTextUtilities
								colorText: (self withConflictTextClickHandler: line)
								with: each key)]].