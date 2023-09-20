actions
actionAdd
	| mapperClass path mapper |
	self activeWorkingCopy ifNil: [^ self inform: 'Please select a project first.'].
	mapperClass := SquotAssetMapper requestMapperClass ifNil: [^ nil].
	path := self requestPath ifNil: [^ nil].
	mapper := mapperClass new
					path: path;
					yourself.
	self activeWorkingCopy addMapper: mapper.