tags
tags
	| tagHistorians |
	tagHistorians := OrderedCollection new.
	self git allReferencesPrefixedWith: 'refs/tags/' do:
		[:each | tagHistorians add: (self historianNamed: each)].
	^ tagHistorians