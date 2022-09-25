reflection
valueReflection
	| value valueMirror |
	value := self value.
	valueMirror := mirror mirrorOf: value reachedVia: reference from: owner.
	^ SquotObjectReflection object: value mirror: valueMirror