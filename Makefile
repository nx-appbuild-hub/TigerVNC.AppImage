SOURCE="https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc-1.10.1.x86_64.tar.gz"
DESTINATION="tigervnc.tar.xz"
OUTPUT="TigerVNC.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	
	mkdir -p ./build
	tar -zxvf $(DESTINATION) -C ./build
	rm -rf AppDir/application
	
	mkdir --parents AppDir/application
	cp -r build/tigervnc-*/usr/* AppDir/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/application
	rm -rf build
