tests merging
testMergeSingleArtifact
	"When a merge is performed for a single artifact, only this loaded artifact should change in the process."
	| class relevantObject unrelatedObject baseVersion leftVersion rightVersion rightArtifact |
	"given"
	repository withUnitOfWork:
	["base version"
	self workingCopy add: (unrelatedObject := ValueHolder new contents: 'unrelated') at: 'unrelated'.
	(self suppressChangeNotificationsDuring: [class := classFactory newClass])
		compileSilently: 'mergeMe ^ 1' classified: 'to-be-changed'.
	self workingCopy
		add: (relevantObject := PackageInfo new packageName: classFactory packageName)
		at: 'to-be-merged'.
	self workingCopy saveVersionWithMessage: 'base version'.
	baseVersion := self workingCopy loadedHistorian version.
	"right-side version"
	unrelatedObject contents: 'unrelated1'.
	self suppressChangeNotificationsDuring:
		[class organization classify: #mergeMe under: 'something else' logged: false].
	self workingCopy saveVersionWithMessage: 'right-side version'.
	rightVersion := self workingCopy loadedHistorian version.
	rightArtifact := rightVersion artifacts at:
		(rightVersion artifacts keys detect: [:each | each beginsWith: 'to-be-merged']).
	"left-side version"
	self workingCopy loadedHistorian version: baseVersion.
	self suppressChangeNotificationsDuring: [self workingCopy discardUnsavedChanges].
	class compileSilently: 'addedMethod ^ self' classified: 'should be kept'.
	unrelatedObject contents: 'unrelated2'.
	self workingCopy saveVersionWithMessage: 'left-side version'.
	leftVersion := self workingCopy loadedHistorian version.
	"when"
	self suppressChangeNotificationsDuring:
	[[[self workingCopy mergeArtifactInteractively: rightArtifact from: rightVersion
		ifCanceled: [self fail: 'This code should not be reached']]
	on: SquotMergeRequested do: [:request | 
		"then"
		self assert: (request merge modifies: rightArtifact).
		self deny: (request merge includesModificationAt: 'unrelated').
		request resume]
	] valueSupplyingAnswers: {{'*'. #default}}].
	self assert: 'something else' = (class organization categoryOfElement: #mergeMe).
	self assert: (class methodDictionary includesKey: #addedMethod).
	self assert: 'unrelated2' equals: (self workingCopy objectAt: 'unrelated') contents].