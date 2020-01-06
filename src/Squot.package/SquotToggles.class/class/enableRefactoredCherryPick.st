accessing
enableRefactoredCherryPick
	<preference: 'Enable refactored cherry-pick implementation'
		categoryList: #('Squot expert settings')
		description: 'Disable this to use the old cherry pick implementation.'
		type: #Boolean>
	^ EnableRefactoredCherryPick ifNil: [true]