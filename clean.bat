@echo off
del /s /q /f *.vcxproj
del /s /q /f *.vcxproj.user
del /s /q /f *.vcxproj.filters
del /s /q /f  *.sln
del /s /q /f  .vs
del /s /q /f  MakeFile

rmdir Build /s /q