sar
serializeAssetFile: anAssetFile toSar: aSarBuilder
	| pathString |
	pathString := GSPathUtilities asRelativeString: self path.
	aSarBuilder addString: anAssetFile contents at: pathString.
	^ '({1} withMapper: {2} contents: (self memberNamed: {3}) contents asByteArray)'
		format: {GSAssetFile name. self storeString. pathString storeString}