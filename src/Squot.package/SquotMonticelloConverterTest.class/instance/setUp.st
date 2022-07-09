running
setUp
	super setUp.
	
	repository := self newRepository.
	converter := SquotMonticelloConverter new.