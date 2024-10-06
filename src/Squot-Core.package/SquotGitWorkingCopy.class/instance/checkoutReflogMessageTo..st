git-operations
checkoutReflogMessageTo: aString
	^ 'checkout: moving from ',
		(GitReference shortName: self currentHeadTarget),
		' to ',
		(GitReference shortName: aString)