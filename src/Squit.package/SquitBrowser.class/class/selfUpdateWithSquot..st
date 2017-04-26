updating
selfUpdateWithSquot: aWorkingCopy
	"ignore the proper working copy for the moment"
	UpdateWorkingCopy repository gitRepository fetchFrom: 'origin'.
	UpdateWorkingCopy loadedHistorian:
		(UpdateWorkingCopy repository historianNamed: 'origin/master').
	UpdateWorkingCopy registerPackagesInStore.
	UpdateWorkingCopy loadCurrentVersionInteractively.
	"-- or, for non-developers of Squot: --"
	"UpdateWorkingCopy loadVersion: UpdateWorkingCopy baseVersion interactive: false."