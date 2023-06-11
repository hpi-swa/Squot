git-operations
checkoutReflogMessageTo: aString
	^ 'checkout: moving from ',
		(GitReference shortName: self headRef target),
		' to ',
		(GitReference shortName: aString)