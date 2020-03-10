initialize-release
initializeCaches
	objectCache := GitObjectCache new.
	refs := Dictionary new.
	resolvedRefs := Dictionary new.
	refLogs := Dictionary new.