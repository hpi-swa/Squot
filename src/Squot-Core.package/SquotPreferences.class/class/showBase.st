merging
showBase
	<preference: 'Show base in merge conflicts'
		categoryList: #('Git expert settings')
		description: 'If true, shows not only the current and incoming versions, but also the version of the merge base in merge conflicts.'
		type: #Boolean>
	^ ShowBase ifNil: [false]