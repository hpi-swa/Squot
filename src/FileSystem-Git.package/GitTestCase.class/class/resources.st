accessing
resources
	^ super resources , 
	"Ensure that no FillInTheBlankMorph will stall the building of the image
	and that tests don't require user interaction."
	{DefaultGitStampForTests}