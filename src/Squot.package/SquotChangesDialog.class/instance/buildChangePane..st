toolbuilder
buildChangePane: builder
	^ BuildInParent child: 
		((DynamicToolBuilderMorph on: self specSelector: #buildChangePart:)
			layoutFrame: LayoutFrame fullFrame;
			yourself)