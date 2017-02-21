accessing
ancestors
	^ ancestors ifNil: [ 
		ancestors := self loadAncestors ]