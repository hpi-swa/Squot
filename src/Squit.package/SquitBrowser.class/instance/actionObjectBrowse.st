actions
actionObjectBrowse
	| path category |
	path := self objectSelection artifact path.
	(path endsWith: '.package')
		ifFalse: [^ self objectSelection artifact explore].
	category := (path copyAfterLast: $/) allButLast: ('.package' size).
	Browser newOnCategory: category.