navigating
relativeTo: landmark
	"Answer a new path relative to landmark."
	
	"parent/child/grandChild relativeTo: parent returns child/grandChild
	(FSFilesystem onDisk / 'griffle' / 'plonk' / 'nurp') relativeTo: (FSFilesystem onDisk / 'griffle') 
	returns plonk/nurp"

	^ landmark makeRelative: self