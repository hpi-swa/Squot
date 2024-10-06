refs
isSomeHead: aString
	| refBasename |
	refBasename := aString allButFirst: (aString lastIndexOf: $/).
	^ refBasename = self headRefBasename