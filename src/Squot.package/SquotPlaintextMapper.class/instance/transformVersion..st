ui
transformVersion: aStringOrNil
	^ self toPlaintext: (aStringOrNil ifNil: [^ nil])