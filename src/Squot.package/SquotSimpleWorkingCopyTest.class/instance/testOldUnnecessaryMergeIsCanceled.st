tests
testOldUnnecessaryMergeIsCanceled
	| firstVersion wasCanceled |
	"given"
	workingCopy
		saveVersionWithMessage: 'first version';
		saveVersionWithMessage: 'successor version'.
	firstVersion := workingCopy baseVersion parents first.
	"when"
	wasCanceled := false.
	[[workingCopy mergeVersionInteractively: firstVersion ifCanceled: [wasCanceled := true]]
		valueSupplyingAnswers: {{'*'. #default}}]
		on: Deprecation do: [:d | d resume].
	"then"
	self assert: wasCanceled.