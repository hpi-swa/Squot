actions on working copies
offerPackageFormatMenu
	| serializers builder menu currentSerializer |
	serializers := PackageInfo squotSpecializedSerializers.
	currentSerializer :=
		(self projectSelection artifacts
			detect: [:each | each storeInfo objectClassName = #PackageInfo]
			ifNone: [^ self inform: 'No packages tracked in this working copy.'])
			storeInfo serializer.
	builder := ToolBuilder default.
	menu := builder pluggableMenuSpec new.
	serializers do:
		[:each |
		menu add:
				(each name = currentSerializer ifTrue: ['<yes>'] ifFalse: ['<no>']),
				each userFriendlyTitle
			target: self
			selector: #setPackageSerializer:
			argumentList: (Array with: each)].
	builder open: menu.