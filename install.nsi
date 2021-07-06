; Mindustry Installer Script
; Written by Nerahikada

!pragma warning error all

;-----------------------------------------------------
; Includes

  !include "MUI2.nsh"
  !include "x64.nsh"
  !include "LogicLib.nsh"

;-----------------------------------------------------
; Information

  !define PRODUCT_NAME "Mindustry"
  !define PRODUCT_VERSION "X.X"
  !define PRODUCT_BUILD_NUMBER "Y.Y"

  VIProductVersion "${PRODUCT_VERSION}.${PRODUCT_BUILD_NUMBER}"
  VIAddVersionKey ProductName "${PRODUCT_NAME}"
  VIAddVersionKey ProductVersion "${PRODUCT_VERSION}"
  VIAddVersionKey FileDescription "${PRODUCT_NAME} Installer"
  VIAddVersionKey FileVersion "${PRODUCT_VERSION}.${PRODUCT_BUILD_NUMBER}"
  VIAddVersionKey LegalCopyright "Nerahikada"
  VIAddVersionKey Comment "https://github.com/Nerahikada/Mindustry_Installer"

;-----------------------------------------------------
; General

  !define REGPATH_UNINSTSUBKEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"

  Unicode true

  Name "${PRODUCT_NAME}"
  OutFile "${PRODUCT_NAME}_${PRODUCT_VERSION}_${PRODUCT_BUILD_NUMBER}.exe"
  BrandingText "${PRODUCT_NAME} ${PRODUCT_VERSION} Build ${PRODUCT_BUILD_NUMBER}"

  RequestExecutionLevel admin
  ;SetCompressor /solid lzma

  InstallDir "$PROGRAMFILES\${PRODUCT_NAME}"
  InstallDirRegKey HKLM "${REGPATH_UNINSTSUBKEY}" "InstallLocation"

;-----------------------------------------------------
; Interface Settings

  !define MUI_ICON "assets\Mindustry.ico"
  !define MUI_UNICON "assets\Mindustry.ico"

  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_BITMAP "assets\header.bmp"
  !define MUI_HEADERIMAGE_UNBITMAP "assets\header.bmp"
  !define MUI_WELCOMEFINISHPAGE
  !define MUI_WELCOMEFINISHPAGE_BITMAP "assets\background.bmp"
  !define MUI_UNWELCOMEFINISHPAGE_BITMAP "assets\background.bmp"

  !define MUI_ABORTWARNING
  !define MUI_UNABORTWARNING

  !define MUI_LANGDLL_ALLLANGUAGES

  ShowInstDetails show
  ShowUnInstDetails show

  !define MUI_FINISHPAGE_NOAUTOCLOSE
  !define MUI_UNFINISHPAGE_NOAUTOCLOSE

;-----------------------------------------------------
; Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "assets\LICENSE.txt"
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

;-----------------------------------------------------
; Languages

  !insertmacro MUI_LANGUAGE "English" ; The first language is the default language
  !insertmacro MUI_LANGUAGE "French"
  !insertmacro MUI_LANGUAGE "German"
  !insertmacro MUI_LANGUAGE "Spanish"
  !insertmacro MUI_LANGUAGE "SpanishInternational"
  !insertmacro MUI_LANGUAGE "SimpChinese"
  !insertmacro MUI_LANGUAGE "TradChinese"
  !insertmacro MUI_LANGUAGE "Japanese"
  !insertmacro MUI_LANGUAGE "Korean"
  !insertmacro MUI_LANGUAGE "Italian"
  !insertmacro MUI_LANGUAGE "Dutch"
  !insertmacro MUI_LANGUAGE "Danish"
  !insertmacro MUI_LANGUAGE "Swedish"
  !insertmacro MUI_LANGUAGE "Norwegian"
  !insertmacro MUI_LANGUAGE "NorwegianNynorsk"
  !insertmacro MUI_LANGUAGE "Finnish"
  !insertmacro MUI_LANGUAGE "Greek"
  !insertmacro MUI_LANGUAGE "Russian"
  !insertmacro MUI_LANGUAGE "Portuguese"
  !insertmacro MUI_LANGUAGE "PortugueseBR"
  !insertmacro MUI_LANGUAGE "Polish"
  !insertmacro MUI_LANGUAGE "Ukrainian"
  !insertmacro MUI_LANGUAGE "Czech"
  !insertmacro MUI_LANGUAGE "Slovak"
  !insertmacro MUI_LANGUAGE "Croatian"
  !insertmacro MUI_LANGUAGE "Bulgarian"
  !insertmacro MUI_LANGUAGE "Hungarian"
  !insertmacro MUI_LANGUAGE "Thai"
  !insertmacro MUI_LANGUAGE "Romanian"
  !insertmacro MUI_LANGUAGE "Latvian"
  !insertmacro MUI_LANGUAGE "Macedonian"
  !insertmacro MUI_LANGUAGE "Estonian"
  !insertmacro MUI_LANGUAGE "Turkish"
  !insertmacro MUI_LANGUAGE "Lithuanian"
  !insertmacro MUI_LANGUAGE "Slovenian"
  !insertmacro MUI_LANGUAGE "Serbian"
  !insertmacro MUI_LANGUAGE "SerbianLatin"
  !insertmacro MUI_LANGUAGE "Arabic"
  !insertmacro MUI_LANGUAGE "Farsi"
  !insertmacro MUI_LANGUAGE "Hebrew"
  !insertmacro MUI_LANGUAGE "Indonesian"
  !insertmacro MUI_LANGUAGE "Mongolian"
  !insertmacro MUI_LANGUAGE "Luxembourgish"
  !insertmacro MUI_LANGUAGE "Albanian"
  !insertmacro MUI_LANGUAGE "Breton"
  !insertmacro MUI_LANGUAGE "Belarusian"
  !insertmacro MUI_LANGUAGE "Icelandic"
  !insertmacro MUI_LANGUAGE "Malay"
  !insertmacro MUI_LANGUAGE "Bosnian"
  !insertmacro MUI_LANGUAGE "Kurdish"
  !insertmacro MUI_LANGUAGE "Irish"
  !insertmacro MUI_LANGUAGE "Uzbek"
  !insertmacro MUI_LANGUAGE "Galician"
  !insertmacro MUI_LANGUAGE "Afrikaans"
  !insertmacro MUI_LANGUAGE "Catalan"
  !insertmacro MUI_LANGUAGE "Esperanto"
  !insertmacro MUI_LANGUAGE "Asturian"
  !insertmacro MUI_LANGUAGE "Basque"
  !insertmacro MUI_LANGUAGE "Pashto"
  !insertmacro MUI_LANGUAGE "ScotsGaelic"
  !insertmacro MUI_LANGUAGE "Georgian"
  !insertmacro MUI_LANGUAGE "Vietnamese"
  !insertmacro MUI_LANGUAGE "Welsh"
  !insertmacro MUI_LANGUAGE "Armenian"
  !insertmacro MUI_LANGUAGE "Corsican"
  !insertmacro MUI_LANGUAGE "Tatar"
  !insertmacro MUI_LANGUAGE "Hindi"

;-----------------------------------------------------
; Reserve Files

  !insertmacro MUI_RESERVEFILE_LANGDLL

;-----------------------------------------------------
; Installer Functions

Function .onInit
  ClearErrors
  EnumRegKey $0 HKLM "${REGPATH_UNINSTSUBKEY}" 0
  ${If} ${Errors}
    ${If} ${RunningX64}
      StrCpy $INSTDIR "$PROGRAMFILES64\${PRODUCT_NAME}"
    ${Else}
      StrCpy $INSTDIR "$PROGRAMFILES32\${PRODUCT_NAME}"
    ${EndIf}
  ${EndIf}
FunctionEnd

;-----------------------------------------------------
; Installer Sections

Section "Mindustry"
  SetOutPath "$INSTDIR"
  ${If} ${RunningX64}
    File /r "mindustry-windows-64-bit\"
  ${Else}
    File /r "mindustry-windows-32-bit\"
  ${EndIf}

  WriteUninstaller "$INSTDIR\Uninstall.exe"

  WriteRegStr HKLM "${REGPATH_UNINSTSUBKEY}" "DisplayIcon" "$INSTDIR\Mindustry.exe"
  WriteRegStr HKLM "${REGPATH_UNINSTSUBKEY}" "DisplayName" "${PRODUCT_NAME}"
  WriteRegStr HKLM "${REGPATH_UNINSTSUBKEY}" "DisplayVersion" "${PRODUCT_VERSION} Build ${PRODUCT_BUILD_NUMBER}"
  WriteRegStr HKLM "${REGPATH_UNINSTSUBKEY}" "InstallLocation" "$INSTDIR"
  WriteRegDWORD HKLM "${REGPATH_UNINSTSUBKEY}" "NoModify" 1
  WriteRegDWORD HKLM "${REGPATH_UNINSTSUBKEY}" "NoRepair" 1
  WriteRegStr HKLM "${REGPATH_UNINSTSUBKEY}" "Publisher" "Anuke"
  WriteRegStr HKLM "${REGPATH_UNINSTSUBKEY}" "UninstallString" '"$INSTDIR\Uninstall.exe"'
SectionEnd

Section "Start Menu shortcut"
  SetShellVarContext all
  CreateShortcut "$SMPROGRAMS\${PRODUCT_NAME}.lnk" "$INSTDIR\Mindustry.exe"
SectionEnd

Section "Public desktop shortcut"
  SetShellVarContext all
  CreateShortcut "$DESKTOP\${PRODUCT_NAME}.lnk" "$INSTDIR\Mindustry.exe"
SectionEnd

;-----------------------------------------------------
; Uninstaller Section

Section "Uninstall"
  ; For safety reasons, the file deletion script is generated automatically by Actions.

  Delete "$INSTDIR\Uninstall.exe"

  SetShellVarContext all
  Delete "$SMPROGRAMS\${PRODUCT_NAME}.lnk"
  Delete "$DESKTOP\${PRODUCT_NAME}.lnk"

  RMDir "$INSTDIR"

  DeleteRegKey HKLM "${REGPATH_UNINSTSUBKEY}"
SectionEnd