tests merging
testKeptObjectAfterMergeInIncmoingLoadOrderPosition
	"The kept artifact should keep its position in the load order."
	scenario := SquotMergeChangeAndRemovalWithReorderingTestScenario forTestCase: self.
	scenario testKeepArtifact.