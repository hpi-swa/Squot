Squot repository
defaultHistorian
	"Do not use HEAD because that needs a unit of work (which is not used in test initialization, for example)."
	^ self historianNamed: 'refs/heads/master'