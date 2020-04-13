tests
testStateOfUnitOfWorkFlagDuringTest
	"Actually tests the traits for test cases with and without unit of work interface."
	self assert: GitFeatureFlags useUnitOfWorkInterface = self unitOfWorkSetting.