validating
quickValidate
	treeHash ifNil: [ GitInvalidObjectError signal: 'Cannot have a commit without a tree.' ].
	author ifNil: [ GitInvalidObjectError signal: 'Author identity is required.' ].
	committer ifNil: [ GitInvalidObjectError signal: 'Committer identity is required.' ].