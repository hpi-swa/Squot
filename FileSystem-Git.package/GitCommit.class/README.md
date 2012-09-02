I represent the state of a git repository in time. It is mandatory to provide me with a message describing the changes.

Instance Variables:
	tree	<GitTree>
		Holds a tree representing the root of the repository.
	parents	<Collection of: GitCommit>
		Holds a collection of parent commits. A parent commit represents 
		the state the repository was in when the changes occurred that led to the current commit.
		In case of a merge it is possible for a commit to have more than one parent.
	author	<GitStamp>
		Denotes the author of the content committed.
	committer	<GitStamp>
		Denotes the committer of the commit. The committer might be a different
		person than the author.