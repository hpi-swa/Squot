private
collectTagsFromLooseRefs
	| tags tagsDir |
	tags := Dictionary new.
	
	tagsDir := baseDir / 'refs' / 'tags'.
	tagsDir children do: [ :ref |
		ref readStreamDo: [ :stream |
			tags 
				at: ref basename
				put: (repository objectNamed: (stream next: 40) asString) ] ].
		
	^ tags