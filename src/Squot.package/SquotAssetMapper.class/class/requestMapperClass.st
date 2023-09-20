requests
requestMapperClass
	| classes |
	classes := self assetMapperClasses.
	^ UIManager default
		chooseFrom: (classes collect: #assetTypeName)
		values: classes
		title: 'Asset type:'