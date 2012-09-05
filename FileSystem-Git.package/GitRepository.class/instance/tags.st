public-accessing-objects
tags
	|  referencedObjects tags |
	
	tags := OrderedCollection new.
	
	self tagsDir exists ifFalse: [ ^ tags ].
	
	referencedObjects := self collectTagsFromPackedRefs.
	referencedObjects addAll: self collectTagsFromLooseRefs.
	
	referencedObjects keysAndValuesDo: [ :name :object |
		tags add: (object class = GitCommit
			ifTrue: [ "this is a lightweight tag"
				GitLightweightTag
					named: name
					for: object
					in: self ]
			ifFalse: [ "this is a full tag and will be loaded later"
				 object ]) ].
	
	^ tags