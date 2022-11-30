accessing
object
	^ object ifNil: [self error: 'No object was provided when this ', self class, ' was constructed']