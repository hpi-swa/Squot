encoding
changeEncoding
	^ (self class chooseNewEncodingClass ifNil: [^ nil])
		package: self package
		path: self path