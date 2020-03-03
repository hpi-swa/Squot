accessing
ignoreMethodsInAssumeUnchanged
	<preference: 'Ignore methods in ChangeSet "AssumeUnchanged"'
		categoryList: #('Squot expert settings')
		description: 'Put methods in that ChangeSet to always exclude them from commits'
		type: #Boolean>
	^ IgnoreMethodsInAssumeUnchanged ifNil: [false]