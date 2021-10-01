echo "Make sure you are in the RustDesk Directory - where this bat file resides"
echo "make sure that sciter.dll for windows exists in src directory."
cd  src
packfolder ui resources.rc -i "*.html;*.css;*.tis" -v "resources" -binary
rem wget https://github.com/c-smile/sciter-sdk/raw/master/bin.win/x64/sciter.dll
cd  ..
cargo  build --features "inline" --release  
upx --best --lzma target/release/rustdesk.exe
cp src/sciter.dll target/release/
cp src/sciter.dll target/debug/
.\target\release\rustdesk.exe