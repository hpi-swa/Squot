accessing
useNewApi
	<preference: 'Use new Squot API'
		categoryList: #('Squot expert settings')
		description: 'Expect the new kinds of objects and their protocols'
		type: #Boolean>
	^ UseNewApi ifNil: [false]