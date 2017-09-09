patching
removeFrom: anObjectShadow with: aPatcher
	"Usually, instance variables cannot be removed from objects, but they can be removed from shadows to create partial snapshots."
	anObjectShadow removeInstVarNamed: self instVarName.