git porcelain - external
performTerminalCommandTemplateReplacement: aString in: anotherString
	| needle parts replacement |
	({''. 'no-key'} includes: aString) ifTrue: [^ anotherString].
	aString = 'quote' ifTrue: [^ SquotTextUtilities quote: anotherString].
	parts := aString splitBy: ':'.
	needle := parts first.
	replacement := parts second.
	^ anotherString copyReplaceAll: needle with: replacement