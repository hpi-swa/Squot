tests
testCherryPickPreservesAuthorAndTime
	| cherryPick |
	self suppressChangeNotificationsDuring:
	[repository withUnitOfWork: [repository git configAt: 'user.name' put: 'Original Author'].
	scenario := SquotSimpleMergeTestScenario forTestCase: self.
	repository withUnitOfWork: [repository git configAt: 'user.name' put: 'Cherry Picker'].
	"when"
	cherryPick := workingCopy newCherryPickOperation
		pickedVersion: scenario thirdVersion;
		relevantParentOfPickedVersion: scenario firstVersion;
		message: 'cherry pick'.
	cherryPick applyToWorkingCopy].
	"then"
	repository withUnitOfWork:
	[self assert: workingCopy loadedVersion commit committer timeStamp ~= scenario thirdVersion commit author timeStamp
		description: 'assumption: timestamps are different in the first place';
		assert: workingCopy loadedVersion commit author timeStamp = scenario thirdVersion commit author timeStamp
		description: 'preserve author timestamp';
		assert: 'Original Author' equals: workingCopy loadedVersion commit author name
		description: 'preserve author name';
		assert: 'Cherry Picker' equals: workingCopy loadedVersion commit committer name
		description: 'cherry picker is the committer'].