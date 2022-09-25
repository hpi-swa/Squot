private
nullBase
	"Answer something that can stand in for 'no suitable base version' if there is none."
	^ SquotToggles useNewApi
		ifTrue: [SquotNullVersion instance]
		ifFalse: [SquotSnapshot empty]