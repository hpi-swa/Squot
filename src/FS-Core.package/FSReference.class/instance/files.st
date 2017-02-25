navigating
files
	"Return all the files (as opposed to folders) contained in the receiver"
	
	^ (self filesystem filesAt: self path) collect: [:ea |
		FSReference
			filesystem: self filesystem
			path: ea]