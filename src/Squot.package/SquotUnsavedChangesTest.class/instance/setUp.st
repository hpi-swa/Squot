running
setUp
	super setUp.
	trackedObject := StringHolder new contents: 'Tracked'; yourself.
	workingCopy add: trackedObject at: 'tracked.txt'.
	workingCopy saveVersionWithMessage: 'add something'.
	"remember this version on another branch"
	(otherHistorian := repository historianNamed: 'other') version: workingCopy baseVersion.