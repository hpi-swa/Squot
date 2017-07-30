initialize-release
initialize
	super initialize.
	objects := WeakValueDictionary new.
	shadows := Dictionary new.
	delegateRegistry := SquotObjectRegistry2 new.