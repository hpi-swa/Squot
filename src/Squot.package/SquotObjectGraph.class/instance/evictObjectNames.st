copying
evictObjectNames
	super evictObjectNames.
	objects keysAndValuesDo: [:name :object | objectNames at: object put: name].