remotes
unsetUpstreamOfBranchNamed: aString
	"git branch --unset-upstream aString"
	GitReference validateReferenceName: aString.
	self configUnsetAt: 'branch.', aString, '.merge';
		configUnsetAt: 'branch.', aString, '.remote'.