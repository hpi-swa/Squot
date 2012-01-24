navigating
directories
	"Return all the directories (by opposition to files) contained in the receiver"

	^ (self filesystem directoriesAt: self path) collect: [:ea |
		FSReference
			filesystem: self filesystem
			path: ea]