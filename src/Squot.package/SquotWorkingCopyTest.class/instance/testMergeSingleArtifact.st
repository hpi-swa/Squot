tests
testMergeSingleArtifact
	"When a merge is performed for a single artifact, only this loaded artifact should change in the process."
	| class relevantObject unrelatedObject baseVersion leftVersion rightVersion rightArtifact |
	"given"
	"base version"
	self workingCopy add: (unrelatedObject := Text fromString: 'unrelated') at: 'unrelated'.
	(class := classFactory newClass) compileSilently: 'mergeMe ^ 1' classified: 'to-be-changed'.
	self workingCopy
		add: (relevantObject := PackageInfo new packageName: classFactory packageName)
		at: 'to-be-merged'.
	self workingCopy saveNewVersionMessage: 'base version' interactive: false.
	baseVersion := self workingCopy loadedHistorian version.
	"right-side version"
	unrelatedObject replaceFrom: 1 to: unrelatedObject size with: 'unrelated1'.
	class organization classify: #mergeMe under: 'something else' logged: false.
	self workingCopy saveNewVersionMessage: 'right-side version' interactive: false.
	rightVersion := self workingCopy loadedHistorian version.
	rightArtifact := rightVersion artifacts at:
		(rightVersion artifacts keys detect: [:each | each beginsWith: 'to-be-merged']).
	"left-side version"
	self workingCopy loadedHistorian version: baseVersion.
	self workingCopy discardUnsavedChanges.
	class compileSilently: 'addedMethod ^ self' classified: 'should be kept'.
	unrelatedObject replaceFrom: 1 to: unrelatedObject size with: 'unrelated2'.
	self workingCopy saveNewVersionMessage: 'left-side version' interactive: false.
	leftVersion := self workingCopy loadedHistorian version.
	"when"
	[[self workingCopy mergeArtifactInteractively: rightArtifact from: rightVersion
		ifCanceled: [self fail: 'This code should not be reached']]
	on: SquotSelectionOfChangesRequested do: [:request | 
		"then"
		self assert: (request patch includesDiffAt: rightArtifact path).
		self deny: (request patch includesDiffAt: 'unrelated').
		request resume]
	] valueSupplyingAnswers: {{'*'. #default}}.
	self assert: 'something else' = (class organization categoryOfElement: #mergeMe).
	self assert: (class methodDictionary includesKey: #addedMethod).
	self assert: 'unrelated2' equals: (self workingCopy objectAt: 'unrelated') asString.