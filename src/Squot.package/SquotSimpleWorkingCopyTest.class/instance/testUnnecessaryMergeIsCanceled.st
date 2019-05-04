tests
testUnnecessaryMergeIsCanceled
	| firstVersion wasCanceled |
	"given"
	workingCopy
		saveNewVersionMessage: 'first version' interactive: false;
		saveNewVersionMessage: 'successor version' interactive: false.
	firstVersion := workingCopy baseVersion parents first.
	"when"
	wasCanceled := false.
	[workingCopy mergeVersionInteractively: firstVersion ifCanceled: [wasCanceled := true]]
		valueSupplyingAnswers: {{'*'. #default}}.
	"then"
	self assert: wasCanceled.