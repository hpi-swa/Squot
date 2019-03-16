A simple repository that uses the SquotFileSystemStore to store version's snapshots.

Related classes involved in the implementation: SquotFileTestHistorian, SquotFileTestVersion.

The following directory structure is created:

/ historians
	/ <name>		file containing the version number referred to by historian <name>
/ versions
	/ <number>	directory that holds information about the version with number <number>
					the number is the internalId of the version
		message	contains the version log message
		author		contains the name of the version author
		parents		contains the numbers of the parent versions, each on one line
		tree		directory that contains the snapshot of the version, the store is used here