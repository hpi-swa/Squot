accessing
asyncActions
	<preference: 'Perform Git browser actions in separate processes'
		categoryList: #('Git expert settings')
		description: ''
		type: #Boolean>
	^ AsyncActions ifNil: [true]