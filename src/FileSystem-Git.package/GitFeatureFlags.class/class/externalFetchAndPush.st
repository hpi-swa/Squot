accessing
externalFetchAndPush
	<preference: 'Use external git CLI for fetch and push' categoryList: #('Git expert settings') description: 'If true, the external git CLI command is used when fetching and pushing. Activate if you want to authenticate via SSH, for example.' type: #Boolean>

	^ ExternalFetchAndPush ifNil: [false]