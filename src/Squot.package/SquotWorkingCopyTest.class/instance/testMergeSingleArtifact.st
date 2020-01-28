tests
testMergeSingleArtifact
	"When a merge is performed for a single artifact, only this loaded artifact should change in the process."
	| class relevantObject unrelatedObject baseVersion leftVersion rightVersion rightArtifact |
	"given"
	"base version"
	self workingCopy add: (unrelatedObject := Text fromString: 'unrelated') at: 'unrelated'.
	(self suppressChangeNotificationsDuring: [class := classFactory newClass])
		compileSilently: 'mergeMe ^ 1' classified: 'to-be-changed'.
	self workingCopy
		add: (relevantObject := PackageInfo new packageName: classFactory packageName)
		at: 'to-be-merged'.
	self workingCopy saveVersionWithMessage: 'base version'.
	baseVersion := self workingCopy loadedHistorian version.
	"right-side version"
	unrelatedObject replaceFrom: 1 to: unrelatedObject size with: 'unrelated1'.
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
	unrelatedObject replaceFrom: 1 to: unrelatedObject size with: 'unrelated2'.
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
	self assert: 'unrelated2' equals: (self workingCopy objectAt: 'unrelated') asString.