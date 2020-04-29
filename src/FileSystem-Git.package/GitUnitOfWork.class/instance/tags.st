accessing
tags
	|  referencedObjects tags |
	referencedObjects := Dictionary new.
	self allReferencesPrefixedWith: 'refs/tags/' do: [:each |
		referencedObjects at: each put: (self objectReferenced: each)].
	tags := OrderedCollection new.
	referencedObjects keysAndValuesDo: [ :name :object |
		tags add: (object class = GitCommit
			ifTrue: [ "this is a lightweight tag"
				GitLightweightTag
					named: (repository nameOf: name in: 'refs/tags/')
					for: object
					in: self ]
			ifFalse: [ "this is a full tag and will be loaded later"
				 object ]) ].
	
	^ tags