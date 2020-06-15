SOURCE="https://dl.bintray.com/probono/AppImages/QtCreator-5.8.0-x86_64.AppImage"
OUTPUT="QtCreator.AppImage"

all:
	echo "Building: $(OUTPUT)"
	rm -f ./$(OUTPUT)
	wget --output-document=$(OUTPUT) --continue $(SOURCE)
	chmod +x $(OUTPUT)

