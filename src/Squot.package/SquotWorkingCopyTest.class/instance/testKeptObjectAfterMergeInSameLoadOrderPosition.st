tests merging
testKeptObjectAfterMergeInSameLoadOrderPosition
	"The kept artifact should keep its position in the load order."
	scenario := SquotMergeChangeAndRemovalTestScenario forTestCase: self.
	scenario testKeepArtifact.