I have the responsibility of associating a human readable tag (a string) with a commit (on the filesystem level I do this by simply referencing the sha1 name of a commit), e.g. 'version 0.5' -> '2341f8c0615bbcc465ac4686025e880786430697'.

It is important to know that there are light tags and real tag objects in git. Light tags are represented through a file with the tag name that holds a reference to a commit. Alternatively that file can hold a reference to a tag object which in turn references a commit. Full tags have the advantage of knowing the tagger (and the date of tagging) and can hold a message (e.g. a PGP signature).
I incorporate both possibilities.

Instance Variables:
	tagger	<GitStamp>
		Who created the tag.
	object	<GitCommit>
		The commit referenced by the tag name.
	name	<String>
		The human readable tag (or tag name) that describes the referenced commit.