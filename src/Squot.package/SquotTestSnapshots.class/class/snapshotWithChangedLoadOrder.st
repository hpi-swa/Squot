objects for tests
snapshotWithChangedLoadOrder
	| bytes1 bytes2 snapshot |
	bytes1 := #[1]. bytes2 := #[2].
	(snapshot := SquotSnapshot new)
		artifacts: (Dictionary new
					at: 'bytes1' put: (SquotArtifact new
										content: (SquotShadowGraph withSingleShadow:
													(SquotBitsObjectShadow for: bytes1));
										path: 'bytes1';
										initializeDefaultStoreInfoFor: bytes1;
										yourself);
					at: 'bytes2' put: (SquotArtifact new
										content: (SquotShadowGraph withSingleShadow:
													(SquotBitsObjectShadow for: bytes2));
										path: 'bytes2';
										initializeDefaultStoreInfoFor: bytes2;
										yourself);
					yourself);
		loadOrder: snapshot artifacts keys asArray reversed.
	^ snapshot