ancestry
saveVersionWithMessage: aString
	"Non-interactive save"
	^ self newSaveOperation
		message: aString;
		applyToWorkingCopy