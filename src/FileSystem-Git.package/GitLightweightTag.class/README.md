I have the responsibility of associating a human readable tag (a string) with a commit, e.g. 'version 0.5' -> '2341f8c0615bbcc465ac4686025e880786430697'. In contrast to a full tag the tag ref references a commit directly

Instance Variables:
	object	<GitCommit>
		The commit referenced by the tag name.
	name	<String>
		The human readable tag (or tag name) that describes the referenced commit.