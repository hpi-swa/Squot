accessing
useNewApi
	<preference: 'Use new Squot API in Git Browser'
		categoryList: #('Squot expert settings')
		description: 'Lets the Git Browser use the new API of Squot objects'
		type: #Boolean>
	^ UseNewApi ifNil: [false]