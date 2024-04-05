menu
menu: aMenu forRef: aString
	 | isBranch refTypeName |
	aMenu target: self.
	isBranch := self activeWorkingCopy isSqueakBranchRef: aString.
	refTypeName := self refTypeName: aString.
	isBranch ifTrue: [
		aMenu
			add: 'Switch to this branch'
			selector: #actionSwitchToBranch:
			argument: aString].
	aMenu
		add: ('Delete this {1}' format: {refTypeName})
		selector: #actionDeleteRef:
		argument: aString;
		addLine.
	self
		menu: aMenu
		forCommit: (self unitOfWork objectReferenced: aString)
		ref: aString.
	isBranch ifTrue: [
		aMenu
			addLine;
			
			add: 'Set the remote branch of this branch'
			selector: #actionSetUpstreamOfBranch:
			argument: aString;
			
			add: 'Unset the remote branch of this branch'
			selector: #actionUnsetUpstreamOfBranch:
			argument: aString]