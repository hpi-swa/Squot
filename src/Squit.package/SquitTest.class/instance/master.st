accessing
master
	master ifNil: [master := squitRepository historianNamed: 'master'].
	^ master