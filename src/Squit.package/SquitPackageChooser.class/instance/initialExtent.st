as yet unclassified
initialExtent

	| listFont |
	listFont := Preferences standardListFont.
	^ (20 * (listFont widthOf: $m)) * 2 @ (15 * listFont height)