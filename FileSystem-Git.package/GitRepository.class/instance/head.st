public-accessing-objects
head
"Answers the GitCommit object referenced in / via 'HEAD'."

	| hexHash |
	hexHash := self headRef ifNil: [ ^ nil ].
	^ self objectNamed: hexHash