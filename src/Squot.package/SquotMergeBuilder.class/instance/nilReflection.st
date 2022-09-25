private
nilReflection
	^ nilReflection ifNil: [nilReflection := SquotObjectReflection object: nil mirror: nil class squotMirror]