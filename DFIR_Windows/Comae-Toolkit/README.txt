Thanks for your interest !

You can download the latest Comae-Toolkit from http://www.comae.io

Please send any feedback to support@comae.io

--------------------------------------------------------------------------------------------------------------------------

  DumpIt 3.0
  Copyright (C) 2007 - 2017, Matthieu Suiche <http://www.msuiche.net>
  Copyright (C) 2012 - 2014, MoonSols Limited <http://www.moonsols.com>
  Copyright (C) 2015 - 2017, Comae Technologies FZE <http://www.comae.io>

Usage: DumpIt [Options] /OUTPUT <FILENAME>

Description:
  Enables users to create a snapshot of the physical memory as a local file.

Options:
  /TYPE, /T             Select type of memory dump (e.g. RAW or DMP) [default: DMP]
  /OUTPUT, /O           Output file to be created. (optional)
  /QUIET, /Q            Do not ask any questions. Proceed directly.
  /NOLYTICS, /N         Do not send any usage analytics information to Comae Technologies. This is used to improve our services.
  /NOJSON, /J           Do not save a .json file containing metadata. Metadata are the basic information you will need for the analysis.
  /LIVEKD, /L           Enables live kernel debugging session.
  /APP, /A              Specifies filename or complete path of debugger image to execute.
  /CMDLINE, /C          Specifies debugger command-line options.

Examples:

  Create a local memory snapshot:

      DumpIt /OUTPUT snapshot.bin

  Enable live kernel debugging session:

      DumpIt /L /A <debugger image path>

  Extract metadata from machine in live kernel debugging session:

      DumpIt /L /A Dmp2Json.exe /C "/Y srv*C:\Symbols*http://msdl.microsoft.com/download/symbols /C \"/zlib /all /json FileName.json\""
      	  
--------------------------------------------------------------------------------------------------------------------------

  Hibr2Bin 3.0
  Copyright (C) 2007 - 2017, Matthieu Suiche <http://www.msuiche.net>
  Copyright (C) 2012 - 2014, MoonSols Limited <http://www.moonsols.com>
  Copyright (C) 2015 - 2017, Comae Technologies FZE <http://www.comae.io>

Usage: Hibr2Bin [Options] /INPUT <FILENAME> /OUTPUT <FILENAME>

Description:
  Enables users to uncompress Windows hibernation file.

Options:
  /PLATFORM, /P         Select platform (X64 or X86)
  /MAJOR, /V            Select major version (e.g. 6 for NT 6.1
  /MINOR, /M            Select minor version (e.g. 1 for NT 6.1)
  /OFFSET, /L           Data offset in hexadecimal (optional)
  /INPUT, /I            Input hiberfil.sys file.
  /OUTPUT, /O           Output hiberfil.sys file.

Versions:
  /MAJOR 5 /MINOR 1     Windows XP
  /MAJOR 5 /MINOR 2     Windows XP x64, Windows 2003 R2
  /MAJOR 6 /MINOR 0     Windows Vista, Windows Server 2008
  /MAJOR 6 /MINOR 1     Windows 7, Windows Server 2008 R2
  /MAJOR 6 /MINOR 2     Windows 8, Windows Server 2012
  /MAJOR 6 /MINOR 3     Windows 8.1, Windows Server 2012 R2
  /MAJOR 10 /MINOR 0    Windows 10, Windows Server 2017

Examples:

  Uncompress a Windows 7 (NT 6.1) x64 hibernation file:
      Hibr2Bin /PLATFORM X64 /MAJOR 6 /MINOR 1 /INPUT hiberfil.sys /OUTPUT uncompressed.bin

  Uncompress a Windows 10 (NT 10.0) x86 hibernation file:
      Hibr2Bin /PLATFORM X86 /MAJOR 10 /MINOR 0 /INPUT hiberfil.sys /OUTPUT uncompressed.bin

--------------------------------------------------------------------------------------------------------------------------

  Dmp2Json 3.0
  Copyright (C) 2007 - 2017, Matthieu Suiche <http://www.msuiche.net>
  Copyright (C) 2012 - 2014, MoonSols Limited <http://www.moonsols.com>
  Copyright (C) 2015 - 2017, Comae Technologies FZE <http://www.comae.io>

Usage: Dmp2Json [Options]

Description:
  Extracts metadata from Microsoft crash dump files.

Options:
  /I        Specifies the location of image files.
  /Y        Specifies the symbol search path.
  /Z        Specifies the name of a crash dump file.
  /C        Specifies commands:
                /vars: Save environment variables.
                /exports: Save exports belonging to process.
                /imports: Save imports belonging to process.
                /dlls: Save dlls belonging to process.
                /vads: Save VADs belonging to process.
                /handles: Save handles belonging to process.
                /threads: Save threads belonging to process.
                /all: Save all.
                /json: Output file.
                /format: Format output file.
                /zlib: Compress output file.

Example:

  Dmp2Json /Y srv*C:\Symbols*http://msdl.microsoft.com/download/symbols /Z C:\FileName.dmp /C "/zlib /all /json C:\FileName.json"

--------------------------------------------------------------------------------------------------------------------------

  Bin2Dmp 3.0
  Copyright (C) 2007 - 2017, Matthieu Suiche <http://www.msuiche.net>
  Copyright (C) 2012 - 2014, MoonSols Limited <http://www.moonsols.com>
  Copyright (C) 2015 - 2017, Comae Technologies FZE <http://www.comae.io>

Usage: Bin2Dmp <input file> <output file>

Description:
  Converts raw memory dump images into Microsoft crash dump files.

Options:
  <input file>      Source path of the raw memory dump file.
  <output file>     Destination path of the Microsoft crash dump file.

--------------------------------------------------------------------------------------------------------------------------

  Dmp2Bin 3.0
  Copyright (C) 2007 - 2017, Matthieu Suiche <http://www.msuiche.net>
  Copyright (C) 2012 - 2014, MoonSols Limited <http://www.moonsols.com>
  Copyright (C) 2015 - 2017, Comae Technologies FZE <http://www.comae.io>

Usage: Dmp2Bin <input file> <output file>

Description:
  Converts Microsoft crash dump files into raw memory dump images.

Options:
  <input file>      Source path of the Microsoft crash dump file.
  <output file>     Destination path of the raw memory dump file.
    
--------------------------------------------------------------------------------------------------------------------------

  Pdb2Json 3.0
  Copyright (C) 2007 - 2017, Matthieu Suiche <http://www.msuiche.net>
  Copyright (C) 2012 - 2014, MoonSols Limited <http://www.moonsols.com>
  Copyright (C) 2015 - 2017, Comae Technologies FZE <http://www.comae.io>

Usage: Pdb2Json [Options]

Description:
  Converts a Microsoft PDB file into a readable JSON file.

Options:
  /PDB           Source is a PDB file
  /OUTPUT        Destination file for the JSON file.