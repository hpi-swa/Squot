enumerating
commits: aCollection do: aBlock
	"aBlock takes as arguments a commit and optionally an exit block"
	aCollection ifNil: [ ^ self ].
	
	aCollection do: [ :commit | 
		aBlock valueWithEnoughArguments: (Array with: commit with: [ ^ self ]).
		self commits: commit parents do: aBlock ]