tests
testSaveTimestampIsNow
	| trackedObject save version startOfSave |
	"given"
	repository withUnitOfWork:
	[trackedObject := ValueHolder new contents: 'This is a test'.
	workingCopy add: trackedObject at: 'tracked'.
	"when"
	save := workingCopy newSaveOperation message: 'initial version'; yourself.
	startOfSave := DateAndTime now.
	(Delay forSeconds: 1) wait.
	version := save applyToWorkingCopy].
	"then"
	repository withUnitOfWork:
		[self assert: version timestamp > startOfSave].