accessing
updateRef: nameString to: valueString
	accesses add: {#update. (GitReference name: nameString target: valueString)}.
	refs add: (GitReference name: nameString target: valueString).