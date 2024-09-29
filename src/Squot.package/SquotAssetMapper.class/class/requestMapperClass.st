requests
requestMapperClass
	| classes |
	classes := self assetMapperClasses.
	^ UIManager default
		chooseFrom: (classes collect: #kind)
		values: classes
		title: 'Asset type:'