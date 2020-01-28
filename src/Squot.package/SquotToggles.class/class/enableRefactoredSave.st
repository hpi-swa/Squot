accessing
enableRefactoredSave
	<preference: 'Enable refactored save implementation'
		categoryList: #('Squot expert settings')
		description: 'Disable this to use the old save implementation.'
		type: #Boolean>
	^ EnableRefactoredSave ifNil: [true]