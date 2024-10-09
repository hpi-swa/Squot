adding
addInTree: aString
	| split |
	split := aString indexOf: $/.
	(self getTree: (aString first: split - 1))
		add: (aString allButFirst: split).