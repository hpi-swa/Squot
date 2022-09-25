accessing objects
objectAt: path
	| artifact store |
	artifact := self store artifactAt: path.
	store := workingCopy storeForArtifact: artifact.
	(store respondsTo: #contents) ifTrue: [^ store contents].
	(store respondsTo: #packageInfoFor:) ifTrue: [^ store packageInfoFor: artifact].
	NotYetImplemented signal.