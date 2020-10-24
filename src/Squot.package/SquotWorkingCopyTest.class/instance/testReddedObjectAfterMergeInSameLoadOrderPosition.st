tests merging
testReddedObjectAfterMergeInSameLoadOrderPosition
	"Relates to testRemovalAndChange, but only focuses on the load order.
	The readded artifact should be readded in the same place as in the incoming changes."
	scenario := SquotMergeRemovalAndChangeTestScenario forTestCase: self.
	scenario testReaddedArtifactInIncomingLoadOrderPosition.