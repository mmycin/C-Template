build:
	@cmd /c color 6
	@cmd /c echo Building...
	@cmd /c if not exist bin/ mkdir bin
	@gcc src\main.c lib\helper.c -I lib -o bin\app.exe
	@cmd /c color 2
	@cmd /c echo Building Successful

run: build
	@cmd /c cls
	@cmd /c color 7

	@cmd /c bin\app.exe
	@cmd /c pause

clean:
	@cmd /c echo Cleaning the project...
	@cmd /c if exist bin rmdir /s /q bin
	@cmd /c color 2
	@cmd /c echo Cleaning Success