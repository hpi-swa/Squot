I am a mapping between two branches in different Git repositories.
On the Git command line I would be used as an argument to push or fetch to denote which local branches map to which remote branches.

Instance Variables
	destructiveUpdatesAllowed:	<Boolean> false if only fast-forward updates are allowed
	leftRefPattern:					<String> pattern for refs (can contain at most one * wildcard)
	rightRefPattern:				<String> pattern for refs (can contain at most one * wildcard)
