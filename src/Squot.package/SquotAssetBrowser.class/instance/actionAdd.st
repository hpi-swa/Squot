actions
actionAdd
	| mapperClass path mapper |
	self activeWorkingCopyIfNilInformAnd: [^ self].
	mapperClass := SquotAssetMapper requestMapperClass ifNil: [^ nil].
	path := (self
				requestPathWithSuffix: (self defaultFileNameFor: mapperClass)
				title: 'Path of the asset in the repository:') ifNil: [^ nil].
	mapper := mapperClass new
					path: path;
					yourself.
	self activeWorkingCopy addMapper: mapper.