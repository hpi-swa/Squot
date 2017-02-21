running
setUp
	"Setting these variables for the tests ensures that no FillInTheBlankMorph will
	stall the building of the image and that tests don't require user interaction."
	temporaryGitStamp := TemporaryGitStamp ensureDefaultValues.