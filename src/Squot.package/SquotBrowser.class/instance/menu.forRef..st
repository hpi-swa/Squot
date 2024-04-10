menu
menu: aMenu forRef: aString
	 | isBranch refTypeName |
	aMenu target: self.
	isBranch := self activeWorkingCopy isSqueakBranchRef: aString.
	refTypeName := self refTypeName: aString.
	aMenu addTitle: ('{1} {2}' format: {refTypeName capitalized. (GitReference shortName: self activeRef) printString}).
	isBranch ifTrue: [
		aMenu
			add: 'Switch to it'
			selector: #actionSwitchToBranch:
			argument: aString].
	aMenu
		add: 'Delete it'
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
			
			add: 'Set its remote branch'
			selector: #actionSetUpstreamOfBranch:
			argument: aString;
			
			add: 'Unset its remote branch'
			selector: #actionUnsetUpstreamOfBranch:
			argument: aString]