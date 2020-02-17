accessing
tags
	|  referencedObjects tags |
	referencedObjects := Dictionary new.
	refStores do: [:each | each referencesPrefixedWith: 'refs/tags/' do: [:eachRef |
			referencedObjects at: eachRef put: (self objectReferenced: eachRef)]].
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