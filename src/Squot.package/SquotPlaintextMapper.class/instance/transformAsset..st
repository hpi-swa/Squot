ui
transformAsset: aStringOrNil
	^ self toPlaintext: (aStringOrNil ifNil: [^ nil])