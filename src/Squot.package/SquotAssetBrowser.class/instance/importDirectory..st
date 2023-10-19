importing
importDirectory: aReference
	| basePath |
	basePath := (self
					requestPathWithSuffix: nil
					title: 'Base path for assets in the repository:') ifNil: [^ self].
	aReference allFiles do: [:each |
		self importFile: each getPath: [basePath resolve: (each path relativeTo: aReference path)]].