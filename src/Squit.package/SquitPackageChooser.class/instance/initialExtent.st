toolbuilder
initialExtent

	| listFont |
	listFont := Preferences standardListFont.
	^ (20 * (listFont widthOf: $m)) * 2 @ (ToolBuilder default listHeightFor: 15)