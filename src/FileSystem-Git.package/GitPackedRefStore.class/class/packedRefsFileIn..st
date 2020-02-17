accessing
packedRefsFileIn: aGitRepository
	^ aGitRepository baseDir resolve: 'packed-refs'