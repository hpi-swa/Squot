accessing
useUnitOfWorkInterface
	<preference: 'Use unit of work interface'
		categoryList: #('Squot expert settings')
		description: 'Disable this to not use unit of work optimizations.
Also toggles the setting for Git if Git is loaded.'
		type: #Boolean>
	^ UseUnitOfWorkInterface ifNil: [true]