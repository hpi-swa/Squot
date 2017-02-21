running
setUp
	classFactory := ClassFactoryForTestCase new.
	workingCopy := self newWorkingCopy.
	repository := workingCopy repository.
	store := workingCopy store.
	changeLogSuppressor := SUnitChangeLogSuppressor new.