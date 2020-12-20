# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)

all: clean
	mkdir --parents $(PWD)/build/Qtcreator.AppDir
	apprepo --destination=$(PWD)/build appdir qtcreator qtcreator-data qtcreator-doc

	rm --force $(PWD)/build/Qtcreator.AppDir/*.desktop		| true
	rm --force $(PWD)/build/Qtcreator.AppDir/*.svg			| true
	rm --force $(PWD)/build/Qtcreator.AppDir/*.png			| true

	cp -r --force $(PWD)/AppDir/*.desktop	$(PWD)/build/Qtcreator.AppDir/	| true
	cp -r --force $(PWD)/AppDir/*.svg		$(PWD)/build/Qtcreator.AppDir/ 	| true
	cp -r --force $(PWD)/AppDir/*.png		$(PWD)/build/Qtcreator.AppDir/ 	| true

	echo "exec \$${APPDIR}/bin/qtcreator \"\$${@}\"" >> $(PWD)/build/Qtcreator.AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage $(PWD)/build/Qtcreator.AppDir $(PWD)/Qtcreator.AppImage
	chmod +x $(PWD)/Qtcreator.AppImage


clean:
	rm -rf $(PWD)/build
