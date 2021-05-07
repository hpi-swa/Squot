accessing
enableDragAndDrop
	<preference: 'Enable drag and drop'
		categoryList: #('Squot expert settings')
		description: 'Enables drag and drop in the Git Browser'
		type: #Boolean>
	^ EnableDragAndDrop ifNil: [false]