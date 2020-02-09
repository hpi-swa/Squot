accessing
useUnitOfWorkInterface
	<preference: 'Use new unit-of-work interface for Git repository'
		categoryList: #('Git expert settings')
		description: 'This should speed up load, save and compare operations with the repository.'
		type: #Boolean>
	^ UseUnitOfWorkInterface ifNil: [true]