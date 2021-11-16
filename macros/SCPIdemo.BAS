'#Language "WWB-COM"
'#uses "./scpi/scpi.obm"
'16-Nov-2021 Juris Prikulis
'https://github.com/LZP-2020-1-0200/WinWrap-Basic-SCPI.git


Option Explicit

Sub Main
	Debug.Clear
	scpi.Open("COM6")
	scpi.CaptureTimeouts()
	scpi.SetTimeouts(0,0,10,0,500)
	scpi.ConfigPort("baud=9600 data=8 parity=n stop=1") ' https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-buildcommdcba
	scpi.CheckCommState()

	scpi.Write("*IDN?")
	Wait 0.1

	Dim read_result As String
 	read_result = scpi.Read()
	Debug.Print read_result

	scpi.Write("CONFigure?")
	Wait 0.1
 	read_result = scpi.Read()
	Debug.Print read_result

	scpi.Write(":Output 1")
	Wait 0.1
 	read_result = scpi.Read()
	Debug.Print read_result


	scpi.Write(":Read?")
	Wait 1
 	read_result = scpi.Read()
	Debug.Print read_result

	scpi.Write(":Output 0")
	Wait 0.1
 	read_result = scpi.Read()
	Debug.Print read_result

	scpi.RestoreTimeouts()
	scpi.Close()
End Sub
