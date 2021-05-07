helpers
createSomeCommits
	| i commits |
	i := 0.
	commits := self createSomeTrees collect: [ :tree |
		i := i + 1.
		GitCommit
			withTree: tree
			message: 'commit ', i asString 
			author: self defaultStamp
			committer: self defaultStamp
			in: repository ].
		
	commits last parents: ((commits reversed allButFirst: 1) collect: [ :commit | commit hexHash ]).
	commits second parents: (OrderedCollection with: commits first hexHash).
	commits do: [ :commit | commit store ].
	repository unitOfWork updateRef: 'refs/heads/master' to: commits last hexHash