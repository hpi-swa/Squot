git-suffix
withoutGitSuffix: aString
	(aString endsWith: self gitSuffix) ifTrue: [^ aString allButLast: self gitSuffix size].
	^ aString