baseline
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'Ston' with: [
				spec
					repository: 'github://fniephaus/ston:fniephaus-patch-3/repository'. ].
		spec baseline: 'FileTree' with: [
				spec
					repository: 'github://dalehenrich/filetree:squeak4.3/repository'. ].
		spec 
			package: 'SqueakSSL-Core' with: [
				spec
					repository: 'http://source.squeak.org/trunk'. ];
			package: 'WebClient-Core' with: [
				spec
					repository: 'http://source.squeak.org/trunk';
					file: 'WebClient-Core-jr.104'. ];
			package: 'WebClient-HTTP' with: [
				spec
					repository: 'http://source.squeak.org/trunk';
					file: 'WebClient-HTTP-cmm.6'. ];
			package: 'INIFile' with: [
				spec
					repository: 'http://www.squeaksource.com/INIFile';
					file: 'INIFile-jf.3'. ];
			package: 'DiffMerge' with: [
				spec
					repository: 'http://www.squeaksource.com/DiffMerge';
					file: 'DiffMerge-tonyg.12'. ];
			package: 'FS-Core';
			package: 'FS-Disk' with: [
				spec requires: #('FS-Core' ). ];
			package: 'FS-Memory' with: [
				spec requires: #('FS-Core' ). ];
			package: 'FS-AnsiStreams' with: [
				spec requires: #('FS-Core' ). ];
			package: 'FS-Tests-Core';
			package: 'FS-Tests-Disk' with: [
				spec requires: #('FS-Tests-Core' ). ];
			package: 'FS-Tests-Memory' with: [
				spec requires: #('FS-Tests-Core' ). ];
			package: 'FS-Tests-AnsiStreams' with: [
				spec requires: #('FS-Tests-Core' ). ];
			package: 'FS-FileDirectory-Adapters' with: [
				spec requires: #('FS-Core'). ];
			package: 'VersionControl';
			package: 'Squot' with: [
				spec requires: #('FS-Core' 'Ston' 'DiffMerge' 'VersionControl' ). ];
			package: 'Pharo-compatibility';
			package: 'FileSystem-Git' with: [
				spec requires: #('FS-Core' 'FS-Disk' 'FS-Memory' 'FS-AnsiStreams' 'FS-Tests-Core' 'Pharo-compatibility' 'INIFile' 'VersionControl' ). ];
			package: 'Squit' with: [
				spec requires: #('FileSystem-Git' 'Squot' 'FS-FileDirectory-Adapters' ). ].
		spec 
			group: 'FileSystemGit' with: #('FileSystem-Git' );
			group: 'FileSystem' with: #('FS-Core' 'FS-Disk' 'FS-Memory' 'FS-AnsiStreams' );
			group: 'tests' with: #('Squit' 'FS-Tests-Core' 'FS-Tests-Disk' 'FS-Tests-Memory' 'FS-Tests-AnsiStreams');
			group: 'default' with: #('Squit' 'Squot'). ].
