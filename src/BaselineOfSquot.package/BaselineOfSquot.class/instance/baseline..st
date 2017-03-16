baseline
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec project: 'Ston' with: [
				spec
					className: 'ConfigurationOfSton';
					versionString: #'stable';
					repository: 'http://www.smalltalkhub.com/mc/SvenVanCaekenberghe/STON/main' ].
		spec baseline: 'FileTree' with: [
				spec
					repository: 'github://dalehenrich/filetree:squeak4.3/repository'. ].
		spec 
			package: 'INIFile' with: [
				spec
					repository: 'http://www.squeaksource.com/INIFile';
					file: 'INIFile-jf.3'. ];
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
			package: 'Squot' with: [
				spec requires: #('FS-Core' 'Ston' ). ];
			package: 'Pharo-compatibility';
			package: 'FileSystem-Git' with: [
				spec requires: #('FS-Core' 'FS-Disk' 'FS-Memory' 'FS-AnsiStreams' 'FS-Tests-Core' 'Pharo-compatibility' 'INIFile' ). ];
			package: 'Squit' with: [
				spec requires: #('FileSystem-Git' 'Squot' ). ].
		spec 
			group: 'FileSystemGit' with: #('FileSystem-Git' );
			group: 'FileSystem' with: #('FS-Core' 'FS-Disk' 'FS-Memory' 'FS-AnsiStreams' );
			group: 'tests' with: #('Squit' 'FS-Tests-Core' 'FS-Tests-Disk' 'FS-Tests-Memory' 'FS-Tests-AnsiStreams');
			group: 'default' with: #('Squit' 'Squot'). ].
