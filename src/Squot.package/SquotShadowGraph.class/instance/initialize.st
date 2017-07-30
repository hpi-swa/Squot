initialize-release
initialize
	shadows := Dictionary new.
	objectNames := WeakIdentityKeyDictionary new.
	objectCreators := WeakIdentityKeyDictionary new.
	objectCreatorSlots := WeakIdentityKeyDictionary new.