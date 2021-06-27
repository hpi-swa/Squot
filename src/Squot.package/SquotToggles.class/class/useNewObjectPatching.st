accessing
useNewObjectPatching
	<preference: 'Use new object patching'
		categoryList: #('Squot expert settings')
		description: 'Use SquotNewObjectPatcher instead of SquotObjectPatcher'
		type: #Boolean>
	^ UseNewObjectPatching ifNil: [false]