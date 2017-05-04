enumerating
objectsWithPathsDo: aBinaryBlock
	objects associationsDo: [:each | aBinaryBlock
			value: each value "object"
			value: each key "path"].