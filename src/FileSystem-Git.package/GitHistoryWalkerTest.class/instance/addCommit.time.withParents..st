helpers
addCommit: message time: dateAndTime withParents: parentCommits
	^ self addCommit: message
		time: dateAndTime
		committedAt: dateAndTime
		withParents: parentCommits