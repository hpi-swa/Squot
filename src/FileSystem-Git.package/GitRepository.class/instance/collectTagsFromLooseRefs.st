private
collectTagsFromLooseRefs
	| tags |
	self privateDeprecatedUseUnitOfWork.
	tags := Dictionary new.
	
	self tagsDir children do: [ :ref |
		ref readStreamDo: [ :stream |
			tags 
				at: ref basename
				put: (self objectNamed: (stream next: 40) asString) ] ].
		
	^ tags