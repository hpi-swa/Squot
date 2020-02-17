private
collectTagsFromLooseRefs
	| tags |
	tags := Dictionary new.
	
	repository tagsDir children do: [ :ref |
		ref readStreamDo: [ :stream |
			tags 
				at: ref basename
				put: (repository objectNamed: (stream next: 40) asString) ] ].
		
	^ tags