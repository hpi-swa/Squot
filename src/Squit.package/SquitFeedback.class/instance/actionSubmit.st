actions
actionSubmit
	self actionTitle ifEmpty: [self error: 'No title provided.'].
	self actionMessage ifEmpty: [self error: 'No message provided.'].
	WebClient 
		htmlSubmit: 'http://squot.fniephaus.com/create.php'
		fields: {
			'title' -> self actionTitle.
			'message' -> self actionMessage.
			'author' -> self actionAuthor.
		} method: 'POST'.
	self inform: 'Thanks for providing feedback!'.
	self changed: #close.