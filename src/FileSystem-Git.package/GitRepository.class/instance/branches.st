public-accessing-objects
branches
"Answers a dictionary of all GitCommit objects referenced in '/refs/heads'."

	| dictionary |
	dictionary := Dictionary new.
	self allReferencesPrefixedWith: 'refs/heads/' do: [:each |
		dictionary
			at: (each allButFirst: 'refs/heads/' size)
			put: (self objectNamed: (self resolveRef: each))].
	^ dictionary