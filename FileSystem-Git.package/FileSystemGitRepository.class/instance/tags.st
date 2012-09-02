accessing
tags
	| tags |
	
	tags := Dictionary new.
	
	repository tags do: [ :tag | 
		tags at: tag put: (self filesystemOn: tag object) ].
	
	^ tags