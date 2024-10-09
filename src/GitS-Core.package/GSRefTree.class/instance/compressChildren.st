compressing
compressChildren
	self children:
		((self children
			collect: [:each | each compress]
			thenSelect: #notNil)
			sorted: #label ascending).