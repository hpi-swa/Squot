running
setUp
	classFactory := ClassFactoryForTestCase new.
	repositoryDirectory := FileSystem memory root.
	workingCopy := self newWorkingCopy.
	repository := workingCopy repository.
	store := workingCopy store.
	changeLogSuppressor := SUnitChangeLogSuppressor new.