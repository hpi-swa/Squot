ui menu
packageFormatMenuSpec
	| serializers builder menu currentSerializer |
	builder := ToolBuilder default.
	serializers := PackageInfo squotSpecializedSerializers.
	currentSerializer :=
		self projectSelection packageSerializer
			ifNil: [^ (builder pluggableMenuSpec new
							add: 'No packages tracked'
							target: [] selector: #value argumentList: #();
							yourself)].
	menu := builder pluggableMenuSpec new.
	serializers do:
		[:each |
		menu add:
				(each name = currentSerializer ifTrue: ['<yes>'] ifFalse: ['<no>']),
				each userFriendlyTitle
			target: self
			selector: #setPackageSerializer:
			argumentList: (Array with: each)].
	^ menu