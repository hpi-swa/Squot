private
withCurrentSnapshot: aBlock
	"Capture the current memory snapshot only once during aBlock"
	| currentSnapshot |
	currentSnapshot := nil.
	snapshotBlock ifNotNil: ["reentrant send" ^ aBlock value].
	snapshotBlock := [currentSnapshot ifNil: [currentSnapshot := self lazySnapshot]].
	aBlock ensure:
		[snapshotBlock := nil].