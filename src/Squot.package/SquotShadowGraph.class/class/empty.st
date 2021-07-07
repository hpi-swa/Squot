instance creation
empty
	| placeholder uniqueName |
	placeholder := Object new.
	uniqueName := {UUID new}.
	^ SquotMutableObjectGraph new
		assign: uniqueName to: placeholder;
		assign: uniqueName toShadow: SquotObjectShadow new;
		startName: uniqueName;
		refreshStartShadow;
		yourself