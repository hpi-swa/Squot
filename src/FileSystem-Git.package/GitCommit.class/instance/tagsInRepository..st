public-accessing
tagsInRepository: aGitRepos
	^ aGitRepos tags select: [ :tag | tag object = self ]