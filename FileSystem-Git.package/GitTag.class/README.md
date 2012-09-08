I have the responsibility of associating a human readable tag (a string) with a commit, e.g. 'version 0.5' -> '2341f8c0615bbcc465ac4686025e880786430697'. Since I am a full tag and can hold additional information, the tag ref points to my object name and I in turn point to the commit.

Full tags have the advantage of knowing the tagger (and the date of tagging) and can hold a message (e.g. a PGP signature).
I incorporate both possibilities.

Instance Variables:
	message (inherited)	<String>
		arbitrary message (e.g. comment or PGP signature)
	tagger	<GitStamp>
		Who created the tag.
	object	<GitCommit>
		The commit referenced by the tag name.
	name	<String>
		The human readable tag (or tag name) that describes the referenced commit.