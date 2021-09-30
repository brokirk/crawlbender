Option Explicit

    '[public objects]
    'Direction "enumeration"
    Const WEST = 0
    const W = 0
    Const EAST = 1
    const E = 1
    Const NORTH = 2
    Const N = 2
    Const SOUTH = 3
    const S = 3
    Const ASCEND = 4
    Const U = 4
    Const DESCEND = 5
    Const D = 5
    Const NW = 6
    Const NE = 7
    Const SW = 8
    Const SE = 9

     'Aquirement Scroll options "enumeration"
     Const WEAPON = "a"
     Const ARMOUR = "b"
     Const JEWELLERY = "c"
     Const BOOK = "d"
     Const STAFF = "e"
     Const FOOD = "f"
     Const MISC = "g"
     Const GOLD = "h"

    Const SPACE_BAR = " "


    dim shell
    set shell = WScript.CreateObject("WScript.Shell")
    dim startTimer
    startTimer = Timer

    '[run main script]
    Main
    BugOut "Script Complete (" & FormattareTempo(Timer - startTimer) & ")"

WScript.Quit

'---
' put script sequence here (this sub called each time)
'---
Sub Main()
     
     'Bribe_A_Thon 5
     'MemorizzareIncantesimo "z", "g", 6
     'LanciareIncantesimo "f", 6
     'Evocare 6
     'LeggerePergamena "n", 6
     'PergamenaDiAquirement "r", BOOK, 6
     Quaff "q", 10


     'LanciareCrawl
     'ActivateCrawl


End Sub

'---
' quit gracefully
'---
Sub BugOut(Msg)
    shell.popup "== " & msg & " ==", 2
    WScript.Quit
End Sub

'---
' send the keystroke Key
'---
Sub Premere(Key)
    shell.SendKeys Key
    Pause 200
End Sub

'---
' give Crawl focus
'---
Sub AttivareCrawl()
    shell.AppActivate "Crawl 4.0.0 beta 26"
    Pause 100
End Sub

'---
' give Crawl Helper focus
'---
Sub AttivareAiutante()
    shell.AppActivate "Crawl Bender"
    Pause 100
End Sub

'---
' Launch Crawl from Crawl Helper; Crawl Helper must be in focus
'---
Sub LanciareCrawl()
     Premere "^l"
End Sub

Sub ConservareGioco()
     Premere "S"
     Premere "Y"
End Sub

Sub Pause (TimeInMs)
    WScript.sleep TimeInMs
End Sub

'---
' return the NumSecs in time string formatted "HH hrs MM mins SS secs"
'---
Function FormattareTempo(ByVal NumSecs)
     Const ORA = 3600
     Const MINUTO = 60

     dim hrs, mins, secs
     dim output

     if NumSecs / ORA > 1 Then
          hrs = NumSecs \  ORA
          NumSecs = NumSecs - (hrs * ORA)
          If hrs = 1 then
               output = hrs & " hr "
          else
               output = hrs & " hrs "
          end if
     End If

     if NumSecs / MINUTO > 1 Then
          mins = NumSecs \ MINUTO
          NumSecs = NumSecs - (mins * MINUTO)
          if mins = 1 then
               output = output & mins & " min "
          else
               output = output & mins & " mins "
          end if

     End If

     FormattareTempo = output & NumSecs & " secs"

End Function

'---
' move one step to Direction (see constant list at top)
'---
Sub Andare(Direzione)

    select case Direzione
        case WEST, W: Premere "{LEFT}"
        case EAST, E: Premere "{RIGHT}"        
        case NORTH, N: Premere "{UP}"
        case SOUTH: Premere "{DOWN}"            
        case NW: Premere "{HOME}"            
        case NE: Premere "{PGUP}"
        case SW: Premere "{END}"
        case SE: Premere "{PGDN}"
        case ASCEND, U: Premere "<"
        Case DESCEND, D: Premere ">"
    end select 
End Sub

'---
' launch a new crawl session then read ScrollLetter; repeated Ripetizione times
'---
Sub LeggerePergamena(ScrollLettera, Ripetizioni)
     dim i
     for i = 1 to Ripetizioni
          AttivareAiutante()
          LanciareCrawl
          AttivareCrawl
          Premere ("r")
          Premere (ScrollLettera)
     next
End Sub

'---
' bribe you Power with gold
'---
Sub Bribe_A_Thon(Ripetizioni)
     dim i 
     for i = 1 to Ripetizioni
          AttivareAiutante
          Premere ("^g")
          LanciareCrawl
          AttivareCrawl
          Premere ("d")
          'Premere SPACE_BAR
          'Premere SPACE_BAR
          Premere "$"
          Premere "p"
          Pause 750
	  Premere (",")
          ConservareGioco
     next
End Sub

'---
' launch crawl and attempt to memorize a spell repeatedly without saving
'---
Sub MemorizzareIncantesimo(ByVal LibroLettera, ByVal IncantesimoLettera, ByVal Ripetizioni)
    dim i
    for i = 1 to Ripetizioni
        AttivareAiutante
        LanciareCrawl
        AttivareCrawl
        Premere "M"
        Premere LibroLettera
        Premere IncantesimoLettera
        Premere "y"
    next
End Sub

'---
'  launch crawl and cast spell repeatedly without saving
'---
Sub LanciareIncantesimo(IncantesimoLettera, Ripetizioni)
    dim i
    for i = 1 to Ripetizioni
        AttivareAiutante
        LanciareCrawl
        AttivareCrawl
        Premere "Z"
        Premere IncantesimoLettera
    next
End Sub

'---
' launch crawl and evoke power of held object repeatedly without saving
'---
Sub Evocare(Ripetizioni)
    dim i
    for i = 1 to Ripetizioni
        AttivareAiutante
        LanciareCrawl
        AttivareCrawl 
        Premere "E"
    next
End Sub


'---
' launch crawl and drink potion repeatedly without saving
'---
Sub Quaff (ByVal PotionLettera, ByVal Ripetizioni)
     dim i
     for i = 1 to Ripetizioni
          AttivareAiutante
          LanciareCrawl
          AttivareCrawl
          Premere "q"
          Premere PotionLettera
	  Premere " "
          Premere "A"
	  Pause 2500
     next
End Sub


'---
'
'---
Sub PergamenaDiAquirement(ByVal PergamenaLettera, OptionLettera, Ripetizioni)
     dim i
     for i = 1 to Ripetizioni
          AttivareAiutante
          LanciareCrawl
          AttivareCrawl
          Premere "r"
          Premere PergamenaLettera
          Premere OptionLettera
          Premere ","
          Premere "r"
          Premere PergamenaLettera
          Pause 500
     next
End Sub