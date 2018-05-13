Pur historian
validateReferenceName: aName

	| tokens illegalCharacters |
	illegalCharacters := '[?+~^\*:	 '.
	(aName includesAnyOf: illegalCharacters) ifTrue: [
		SquotIllegalReferenceName signal: 'A reference name can not include whitespace or any of the following characters: ' , illegalCharacters , ''.].
	(aName includesSubstring: '..') ifTrue: [SquotIllegalReferenceName signal: 'A reference name can not include the string ''..'''].
	(aName includesSubstring: '@{') ifTrue: [SquotIllegalReferenceName signal: 'A reference name can not include the string ''@{'''].
	(aName includesSubstring: '//') ifTrue: [SquotIllegalReferenceName signal: 'A reference name can not include two consecutive slashes'].
	(aName first = $/ or: [aName last = $/]) ifTrue: [SquotIllegalReferenceName signal: 'A reference name can not start or end with a slash'].
	(aName endsWith: '@') ifTrue: [SquotIllegalReferenceName signal: '''@'' is not a valid reference name'].
	
	tokens := aName findTokens: '/'.
	(tokens anySatisfy: [:t | (t first = $.) or: [t endsWith: '.lock']]) ifTrue: [
		SquotIllegalReferenceName signal: 'A reference component can not start with a dot or end with .lock'].