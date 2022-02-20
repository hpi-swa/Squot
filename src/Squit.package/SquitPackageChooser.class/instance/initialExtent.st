toolbuilder
initialExtent

	| listFont |
	listFont := Preferences standardListFont.
	^ (20 * (listFont widthOf: $m)) * 2 @ (SquotGUI listHeightFor: 15)