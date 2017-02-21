initialize-release
packData
	^ packData ifNil: [ 
		packData := self reference readStreamDo: [ :stream | stream contents ] ].