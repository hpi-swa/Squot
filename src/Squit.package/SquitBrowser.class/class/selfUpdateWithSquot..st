updating
selfUpdateWithSquot: aWorkingCopy
	| repository newVersion |
	"do not mess with the passed working copy for the moment"
	UpdateWorkingCopy ifNil: [
		UpdateWorkingCopy := SquotWorkingCopy new.
		UpdateWorkingCopy store: SquotImageStore new.
		UpdateWorkingCopy repository:
			(SquitRepository onDirectory: FileSystem memory / 'Squot').
		UpdateWorkingCopy repository cloneFrom: self selfUpdateRepository].
	repository := UpdateWorkingCopy repository.
	repository importFromUpstream: 'origin'.
	newVersion := (repository historianNamed: 'origin/', SelfUpdateBranch) version.
	UpdateWorkingCopy
		mergeVersionWithLoadedObjects: newVersion		
		ifCanceled: [^ self].
	(repository historianNamed: SelfUpdateBranch) version: newVersion.
	"-- or, for non-developers of Squot: --"
	"UpdateWorkingCopy loadVersion: UpdateWorkingCopy baseVersion interactive: false."