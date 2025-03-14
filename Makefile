build:
	@cmd /c echo Building...
	@cmd /c if not exist bin/ mkdir bin
	@cc\bin\g++ src\main.cpp lib\helper.cpp -I lib -o bin\app.exe
	@cmd /c echo Building Successful

run: build
	@cmd /c cls
	@cmd /c bin\app.exe
	@cmd /c pause

clean:
	@cmd /c echo Cleaning the project...
	@cmd /c if exist bin rmdir /s /q bin
	@cmd /c echo Cleaning Success