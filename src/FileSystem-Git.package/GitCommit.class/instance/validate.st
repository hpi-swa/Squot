validating
validate
	super validate.
	self quickValidate.
	self tree class = GitTree ifFalse: [ GitInvalidObjectError signal: 'The tree of this commit object is not of class GitTree.' ].