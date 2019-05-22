accessing
parents
	^ (([(self directory / 'parents') contents]
		on: FileDoesNotExist do: [:e | e return: #()])
		lines collect: [:each | repository versionNamed: each ifAbsent: []])
		reject: [:each | each isNil]