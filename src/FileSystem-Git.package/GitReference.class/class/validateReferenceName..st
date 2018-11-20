instance creation
validateReferenceName: aName
	"See https://git-scm.com/docs/git-check-ref-format"

	| tokens illegalCharacters |
	illegalCharacters := '[?+~^\*:	 '.
	(aName includesAnyOf: illegalCharacters) ifTrue: [
		GitInvalidReferenceName signal: 'A reference name can not include whitespace or any of the following characters: ' , illegalCharacters.].
	aName isEmpty ifTrue: [GitInvalidReferenceName signal: 'A reference name can not be empty'].
	(aName includesSubstring: '..') ifTrue: [GitInvalidReferenceName signal: 'A reference name can not include the string ''..'''].
	(aName includesSubstring: '@{') ifTrue: [GitInvalidReferenceName signal: 'A reference name can not include the string ''@{'''].
	(aName includesSubstring: '//') ifTrue: [GitInvalidReferenceName signal: 'A reference name can not include two consecutive slashes'].
	(aName first = $/ or: [aName last = $/]) ifTrue: [GitInvalidReferenceName signal: 'A reference name can not start or end with a slash'].
	(aName endsWith: '@') ifTrue: [GitInvalidReferenceName signal: '''@'' is not a valid reference name'].
	
	tokens := aName findTokens: '/'.
	(tokens anySatisfy: [:t | (t first = $.) or: [t endsWith: '.lock']]) ifTrue: [
		GitInvalidReferenceName signal: 'A reference component can not start with a dot or end with .lock'].