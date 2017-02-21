validating
validate
	super validate.
	tree ifNil: [ GitInvalidObjectError signal: 'Cannot have a commit without a tree.' ].
	tree class = GitTree ifFalse: [ GitInvalidObjectError signal: 'The tree of this commit object is not of class GitTree.' ].
	author ifNil: [ GitInvalidObjectError signal: 'Author identity is required.' ].
	committer ifNil: [ GitInvalidObjectError signal: 'Committer identity is required.' ]