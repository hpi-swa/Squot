private
withCurrentSnapshot: aBlock
	"Capture the current memory snapshot only once during aBlock"
	| currentSnapshot |
	currentSnapshot := nil.
	SquotCurrentWorkingCopySnapshotBlock value ifNotNil: ["reentrant send" ^ aBlock value].
	SquotCurrentWorkingCopySnapshotBlock
		value: [currentSnapshot ifNil: [currentSnapshot := self lazySnapshot]]
		during: [aBlock value].