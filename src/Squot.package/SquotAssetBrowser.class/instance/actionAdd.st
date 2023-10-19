actions
actionAdd
	| mapperClass path mapper |
	self activeWorkingCopy ifNil: [^ self inform: 'Please select a project first.'].
	mapperClass := SquotAssetMapper requestMapperClass ifNil: [^ nil].
	path := (self
				requestPathWithSuffix: (self defaultFileNameFor: mapperClass)
				title: 'Path of the asset in the repository:') ifNil: [^ nil].
	mapper := mapperClass new
					path: path;
					yourself.
	self activeWorkingCopy addMapper: mapper.