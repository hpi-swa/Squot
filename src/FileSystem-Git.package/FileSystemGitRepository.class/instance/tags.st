accessing
tags
	| tags |
	
	tags := Dictionary new.
	
	self unitOfWork tags do: [ :tag | 
		tags at: tag put: (self filesystemOn: tag object) ].
	
	^ tags