initialize-release
setWorking: workingPackageShadow incoming: incomingPackageShadow base: basePackageShadow modifications: operationsCollection conflicts: conflictsCollection
	working := workingPackageShadow.
	incoming := incomingPackageShadow.
	base := basePackageShadow.
	operationsCollection do:
		[:each | containerModifications at: each definition description put: each].
	conflictsCollection do:
		[:each | containerConflicts at: each definition description put: each].