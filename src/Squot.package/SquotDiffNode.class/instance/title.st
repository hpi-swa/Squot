accessing
title
	| adornedTitle |
	adornedTitle := ((content respondsTo: #adornedDiffNodeTitle:)
		ifTrue: [content adornedDiffNodeTitle: title]
		ifFalse: [title]) asText.
	self anyChildNeedsChoice
		ifTrue: [adornedTitle addAttribute: TextEmphasis bold].
	^ adornedTitle