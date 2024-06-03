UNIT cvIniFile;

{=============================================================================================================
   Gabriel Moraru
   2024.05
   See Copyright.txt
--------------------------------------------------------------------------------------------------------------

  Extension of TCubicIniFileVcl.
  Same functionality as TCubicIniFileVcl but it adds support for own VCL controls (like cvPathEdit)

  Important:
     The cvRadioButton/cvCheckbox will NOT be automatically resized if you call LoadForm(self) in FormCreate (canvas not ready).
     You need to call LoadForm(self) in after the form was fully created.
=======================================================================================================================}

INTERFACE

USES
   System.Classes, System.SysUtils, System.IniFiles, Vcl.Forms, Vcl.ComCtrls, Vcl.Controls,
   ccCore, ccIniFileVCL;

{$WARN DUPLICATE_CTOR_DTOR OFF}                                                                               {Silence the: W1029 Duplicate constructor  with identical parameters will be inacessible from C++ }

TYPE
 TCubicIniFileEx = class(TCubicIniFileVcl)
  public
    function IsSupported(WinCtrl: TComponent): Boolean; override;
    function WriteComp(Comp: TComponent): Boolean; override;
    function ReadComp (Comp: TComponent): Boolean; override;
  end;


{ These add support for custom (cubic) VCL controls }
procedure SaveForm (Form: TForm; OnlyFormPos: Boolean= FALSE);
procedure LoadForm (Form: TForm; OnlyFormPos: Boolean= FALSE);


IMPLEMENTATION

USES
   FormLog, cvFloatSpinEdit, cvFileListBox, cvSpinEdit, cvSpinEditDelayed, cvPathEdit, ccRichLogTrack,
   ccCenterControl, ccAppData;





{-----------------------------------------------------------------------------------------------------------------------
   READ/WRITE INDIVIDUAL CTRLS
-----------------------------------------------------------------------------------------------------------------------}
function TCubicIniFileEx.WriteComp(Comp: TComponent): Boolean;                                                             { Write 'any' control to INI file }
begin
  Result:= inherited WriteComp(Comp);
  if Result then EXIT; { We handled this component in the parent class. Nothing to do here. }

  if Comp.InheritsFrom(TCubicPathEdit)
  then WriteString  (Comp.Owner.Name, Comp.Name, TCubicPathEdit(Comp).Path) else

  if Comp.InheritsFrom(TCubicSpinEditSplit)
  then WriteInteger (Comp.Owner.Name, Comp.Name, TCubicSpinEditSplit(Comp).Value) else

  if Comp.InheritsFrom(TFloatSpinEdit)
  then WriteFloat   (Comp.Owner.Name, Comp.Name, TFloatSpinEdit(Comp).Value) else

  if Comp.InheritsFrom(TRichLogTrckbr)     { This MUST be before InheritsFrom(TTrackBar) }
  then WriteInteger (Comp.Owner.Name, Comp.Name, TRichLogTrckbr(Comp).TrackBar.Position) else

  if Comp.InheritsFrom(TCubicFileList)
  then WriteString (Comp.Owner.Name, Comp.Name, TCubicFileList(Comp).SelectedItem)

  else
      RAISE Exception.Create('Unsupported control: '+ Comp.ClassName+ ', '+ Comp.Name);
end;



{Important:
    The cvRadioButton/cvRadioButton will NOT be automatically resized if you call LoadForm(self) in FormCreate (canvas not ready). You need to call LoadForm(self) in LateInitialize. }
function TCubicIniFileEx.ReadComp(Comp: TComponent): Boolean;
VAR s: string;
begin
  Result:= inherited ReadComp(Comp);
  if Result then EXIT; { We handled this component in the parent class. Nothing to do here. }

  { Read controls }
  if ValueExists(Comp.Owner.Name, Comp.Name) then
   begin
     if Comp.InheritsFrom(TCubicSpinEditD)
     then TCubicSpinEditD(Comp).StopTimer   { Stop the event from triggering some seconds later after the value of this spinbox was loaded from the INI file }
     else

     if Comp.InheritsFrom(TRichLogTrckbr)     { This MUST be before InheritsFrom(TTrackBar) }
     then TRichLogTrckbr (Comp).TrackBar.Position:= ReadInteger(Comp.Owner.Name, Comp.Name, 0)
     else

     if Comp.InheritsFrom(TFloatSpinEdit)
     then TFloatSpinEdit (Comp).Value := ReadFloat(Comp.Owner.Name, Comp.Name, 0)
     else

     if Comp.InheritsFrom(TCubicSpinEditSplit)
     then TCubicSpinEditSplit (Comp).Value := ReadInteger(Comp.Owner.Name, Comp.Name, 0)
     else

     if Comp.InheritsFrom(TCubicPathEdit)
     then TCubicPathEdit (Comp).Path := Self.ReadString (Comp.Owner.Name, Comp.Name, AppData.CurFolder)
     else

     {NOTE! The last item will be selected only if the TCubicPathEdit associated with this component was read from INI before this. For this, make sure that the TCubicPathEdit appears in the DFM before this component. A simply cut and paste for this component (in form designed) is enough. }
     if Comp.InheritsFrom(TCubicFileList)
     then
      begin
       s:= ReadString (Comp.Owner.Name, Comp.Name, '');
       if FileExists(s)
       then TCubicFileList (Comp).SelectItem(s)
      end
     else
       RAISE exception.Create('Unsupported control: '+ Comp.ClassName+ ', '+ Comp.Name);
   end;
end;




function TCubicIniFileEx.IsSupported(WinCtrl: TComponent): Boolean;
begin
 Result:= inherited IsSupported(WinCtrl)
       OR WinCtrl.InheritsFrom (TCubicSpinEditSplit)
       OR WinCtrl.InheritsFrom (TCubicPathEdit)
       OR WinCtrl.InheritsFrom (TFloatSpinEdit)
       OR WinCtrl.InheritsFrom (TCubicFileList)
       OR WinCtrl.InheritsFrom (TRichLogTrckbr)
       OR WinCtrl.InheritsFrom (TCubicSpinEditD);
end;















{-----------------------------------------------------------------------------------------------------------------------
   MAIN

   Load/Save all controls on this form to their initial state.

   Parameters:
         OnlyFormPos=False  ->  Save all supported controls on this form
         OnlyFormPos=True   ->  Save only the position of the form (no width/height/WndState)
-----------------------------------------------------------------------------------------------------------------------}

procedure SaveForm(Form: TForm; OnlyFormPos: Boolean= FALSE);
VAR
   IniFile: TCubicIniFileEx;
begin
 if AppData.Initializing
 AND (Form = Application.MainForm) then
  begin
   if AppData.RunningHome
   then MesajError('Closing application while still initializing!');
   Exit;{ We don't save anything if the start up was improper! }
  end;

 IniFile:= TCubicIniFileEx.Create(Form.Name);
 TRY
  TRY
   IniFile.SaveForm(Form, OnlyFormPos);
  EXCEPT
   ON EIniFileexception DO AppData.LogError('Cannot save INI file: '+ IniFile.FileName);
  END;
 FINALLY
   FreeAndNil(IniFile);
 END;
end;


{ It also does:
    * LoadForm will also set the font for all forms to be the same as the font of the MainForm.
    * If the form is out of screen, LoadForm will also bring the form back to screen. }
procedure LoadForm(Form: TForm; OnlyFormPos: Boolean= FALSE);
VAR
   IniFile: TCubicIniFileEx;
begin
 if Application.MainForm <> NIL
 then Form.Font:= Application.MainForm.Font;

 IniFile:= TCubicIniFileEx.Create(Form.Name);
 TRY
  TRY
    IniFile.LoadForm(Form, OnlyFormPos);
    CorrectFormPositionScreen(Form);
  EXCEPT
    ON EIniFileException DO AppData.LogError('Cannot load INI file: '+ IniFile.FileName);
  END;
 FINALLY
   FreeAndNil(IniFile);
 END;
end;






end.
