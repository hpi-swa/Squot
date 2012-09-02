accessing
snapshot
	^ snapshot ifNil: [ 
		snapshot := self loadSnapshot ].