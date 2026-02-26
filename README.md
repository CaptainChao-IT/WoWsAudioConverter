# WoWsAudioConverter 
A tool that enables everybody to convert .wav files (Mono, 44100Hz, Signed 16-bit PCM) in .wem files that WoWs can read.
- Prerequisites:
  Windows 10 (not tested, sorry...) & 11
  Audiokinetic Wwise 2022.1.5.9095 (for it to work right from the box)
  
- Installation:
  Just download as zip and put the folder in a convinient location.

- Use:
  Put your .wav files in the Input directory and run the converter.bat batch file (note that the script will only work with version 2025.1.5.9095, if not eddited with your prefered IDE),
  then you'll find the converted .wem files under the \Output\Windows directory with the same name of the files under the Input directory.
  Protip: Unpack the files you want to replace with the [WoWs Unpack Tool](https://www.mediafire.com/file/1foiw66d4czfm2r/WOWSUnpackTool.exe/file) and record/create your own ones and save them with the same
  name as the unpacked files (but as .wav files) and then convert them with my tool and create your voiceover mod with ease!
  
- Experienced users:
  If you want to modify the conversion preset, just create one in a Wwise project, replace the Converter.wproj file with your own (you can find it in the project's directory) and then replace "Custom Vorbis" 
  on line #19 of the batch file with the name of the conversion preset you just created.
  If you fucked something up the batch file will convert your files using the Default Conversion Preset from the Wwise project in Converter.wproj.

Software author: CC (Captain Chao) - Chao Air S.p.A.™ - flychaoair@gmail.com - This software is free for personal use, give credit whenever you are using it. Thanks!
