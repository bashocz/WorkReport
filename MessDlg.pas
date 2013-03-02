unit MessDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ImgList;

type
  TMessageForm = class(TForm)
    InfoPanel: TPanel;
    ButtonPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    YesBtn: TBitBtn;
    NoBtn: TBitBtn;
    AbortBtn: TBitBtn;
    InfoImage: TImage;
    MessageText: TLabel;
    ConfImage: TImage;
    ErrImage: TImage;
    WarnImage: TImage;
    RetryBtn: TBitBtn;
    IgnoreBtn: TBitBtn;
    AllBtn: TBitBtn;
    NoToAllBtn: TBitBtn;
    YesToAllBtn: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MessageForm: TMessageForm;

function ShowMsgDlg(Mess: string; MsgType: TmsgDlgType; MsgBtns: TMsgDlgButtons): integer; stdcall;

implementation

{$R *.dfm}

(*****************************************************************************)
(* Name      : ShowMsgDlg                                                    *)
(*                                                                           *)
(* Descript  : This function shows message dialog and wait for keypress      *)
(*                                                                           *)
(* Parameter : Mess    - message string                                      *)
(*             MsgType - type of dialog                                      *)
(*                (mtInformation, mtConfirmation, mtError, mtWarning)        *)
(*             MsgBtns - buttons which will be showen                        *)
(*                (mbOk, mbCancel,  mbAbort, mbRetry, mbIgnore,              *)
(*                 mbYes, mbNo, mbAll, mbNoToAll, mbYesToAll)                *)
(*                                                                           *)
(* Return    : Modal result of pressed button                                *)
(*                (mrOk, mrCancel,  mrAbort, mrRetry, mrIgnore,              *)
(*                 mrYes, mrNo, mrAll, mrNoToAll, mrYesToAll)                *)
(*****************************************************************************)
function ShowMsgDlg(Mess: string; MsgType: TmsgDlgType; MsgBtns: TMsgDlgButtons): integer; stdcall;
var
  MessWidth:  integer;
  MessHeight: integer;
  MinWidth:   integer;
  InsBtns:    integer;

  NowTime:    int64;
  WaitTime:   int64;
  FreqTime:   int64;
begin
  if (MessageForm <> nil) then
  begin
    if (MessageForm.Visible) then
    begin
      QueryPerformanceFrequency(FreqTime);
      QueryPerformanceCounter(WaitTime);
      QueryPerformanceCounter(NowTime);
      WaitTime:=(WaitTime div FreqTime);
      while (MessageForm <> nil) and ((WaitTime + 1000) > NowTime) do
      begin
        QueryPerformanceCounter(NowTime);
        NowTime:=(NowTime div FreqTime);
      end;
      if (MessageForm <> nil) then
      begin
        MessageForm.Close;
        MessageForm.Destroy;
        MessageForm:=nil;
      end;
    end;
  end;

  if (MessageForm = nil) then
    MessageForm:=TMessageForm.Create(nil);

  MessageForm.MessageText.Caption:=Mess;

  {change position and size of some componets}
  MessWidth:=MessageForm.MessageText.Width;
  MinWidth:=100;
  InsBtns:=0;
  if mbOk       in MsgBtns then InsBtns:=InsBtns+1;
  if mbCancel   in MsgBtns then InsBtns:=InsBtns+1;
  if mbAbort    in MsgBtns then InsBtns:=InsBtns+1;
  if mbRetry    in MsgBtns then InsBtns:=InsBtns+1;
  if mbIgnore   in MsgBtns then InsBtns:=InsBtns+1;
  if mbYes      in MsgBtns then InsBtns:=InsBtns+1;
  if mbNo       in MsgBtns then InsBtns:=InsBtns+1;
  if mbAll      in MsgBtns then InsBtns:=InsBtns+1;
  if mbNoToAll  in MsgBtns then InsBtns:=InsBtns+1;
  if mbYesToAll in MsgBtns then InsBtns:=InsBtns+1;
  if (MinWidth + 112) < ((InsBtns*80)+17) then MinWidth:=((InsBtns*80)+17)-112;
  if (MessWidth < MinWidth) then
  begin
    MessageForm.MessageText.Left:=80+round((MinWidth-MessWidth)/2);
    MessWidth:=MinWidth;
  end;
  MessHeight:=MessageForm.MessageText.Height;
  if (MessHeight < 41) then
  begin
    MessageForm.MessageText.Top:=16+round((41-MessHeight)/2);
    MessHeight:=41;
  end;

  MessageForm.InfoPanel.Width:=112+MessWidth;
  MessageForm.ButtonPanel.Width:=112+MessWidth;
  MessageForm.ClientWidth:=112+MessWidth;

  MessageForm.InfoPanel.Height:=32+MessHeight;
  MessageForm.ButtonPanel.Top:=39+MessHeight;
  MessageForm.ClientHeight:=80+MessHeight;
  {change position and size of some componets}

  {select rigth picture}
  case MsgType of
    mtInformation:  MessageForm.InfoImage.Visible:=True;
    mtConfirmation: MessageForm.ConfImage.Visible:=True;
    mtError:        MessageForm.ErrImage.Visible:=True;
    mtWarning:      MessageForm.WarnImage.Visible:=True;
  end;
  {select rigth picture}

  {select rigth buttons and change their position}
  MessageForm.YesToAllBtn.Visible:=False;
  MessageForm.YesToAllBtn.Enabled:=False;
  MessageForm.NoToAllBtn.Visible:=False;
  MessageForm.NoToAllBtn.Enabled:=False;
  MessageForm.AllBtn.Visible:=False;
  MessageForm.AllBtn.Enabled:=False;
  MessageForm.NoBtn.Visible:=False;
  MessageForm.NoBtn.Enabled:=False;
  MessageForm.YesBtn.Visible:=False;
  MessageForm.YesBtn.Enabled:=False;
  MessageForm.IgnoreBtn.Visible:=False;
  MessageForm.IgnoreBtn.Enabled:=False;
  MessageForm.RetryBtn.Visible:=False;
  MessageForm.RetryBtn.Enabled:=False;
  MessageForm.AbortBtn.Visible:=False;
  MessageForm.AbortBtn.Enabled:=False;
  MessageForm.CancelBtn.Visible:=False;
  MessageForm.CancelBtn.Enabled:=False;
  MessageForm.OkBtn.Visible:=False;
  MessageForm.OkBtn.Enabled:=False;
  InsBtns:=1;
  if mbYesToAll in MsgBtns then
  begin
    MessageForm.YesToAllBtn.Left:=MessageForm.ClientWidth-(InsBtns*80)-9;
    MessageForm.YesToAllBtn.Visible:=True;
    MessageForm.YesToAllBtn.Enabled:=True;
    InsBtns:=InsBtns+1;
  end;
  if mbNoToAll in MsgBtns then
  begin
    MessageForm.NoToAllBtn.Left:=MessageForm.ClientWidth-(InsBtns*80)-9;
    MessageForm.NoToAllBtn.Visible:=True;
    MessageForm.NoToAllBtn.Enabled:=True;
    InsBtns:=InsBtns+1;
  end;
  if mbAll in MsgBtns then
  begin
    MessageForm.AllBtn.Left:=MessageForm.ClientWidth-(InsBtns*80)-9;
    MessageForm.AllBtn.Visible:=True;
    MessageForm.AllBtn.Enabled:=True;
    InsBtns:=InsBtns+1;
  end;
  if mbCancel in MsgBtns then
  begin
    MessageForm.CancelBtn.Left:=MessageForm.ClientWidth-(InsBtns*80)-9;
    MessageForm.CancelBtn.Visible:=True;
    MessageForm.CancelBtn.Enabled:=True;
    InsBtns:=InsBtns+1;
  end;
  if mbNo in MsgBtns then
  begin
    MessageForm.NoBtn.Left:=MessageForm.ClientWidth-(InsBtns*80)-9;
    MessageForm.NoBtn.Visible:=True;
    MessageForm.NoBtn.Enabled:=True;
    InsBtns:=InsBtns+1;
  end;
  if mbYes in MsgBtns then
  begin
    MessageForm.YesBtn.Left:=MessageForm.ClientWidth-(InsBtns*80)-9;
    MessageForm.YesBtn.Visible:=True;
    MessageForm.YesBtn.Enabled:=True;
    InsBtns:=InsBtns+1;
  end;
  if mbIgnore in MsgBtns then
  begin
    MessageForm.IgnoreBtn.Left:=MessageForm.ClientWidth-(InsBtns*80)-9;
    MessageForm.IgnoreBtn.Visible:=True;
    MessageForm.IgnoreBtn.Enabled:=True;
    InsBtns:=InsBtns+1;
  end;
  if mbRetry in MsgBtns then
  begin
    MessageForm.RetryBtn.Left:=MessageForm.ClientWidth-(InsBtns*80)-9;
    MessageForm.RetryBtn.Visible:=True;
    MessageForm.RetryBtn.Enabled:=True;
    InsBtns:=InsBtns+1;
  end;
  if mbAbort in MsgBtns then
  begin
    MessageForm.AbortBtn.Left:=MessageForm.ClientWidth-(InsBtns*80)-9;
    MessageForm.AbortBtn.Visible:=True;
    MessageForm.AbortBtn.Enabled:=True;
    InsBtns:=InsBtns+1;
  end;
  if mbOk in MsgBtns then
  begin
    MessageForm.OkBtn.Left:=MessageForm.ClientWidth-(InsBtns*80)-9;
    MessageForm.OkBtn.Visible:=True;
    MessageForm.OkBtn.Enabled:=True;
  end;
  {select rigth buttons and change their position}

  Result:=MessageForm.ShowModal;

  MessageForm.Destroy;
  MessageForm:=nil;
end;

initialization

  MessageForm:=nil;

finalization

  if (MessageForm <> nil) then
    MessageForm.Destroy;

end.
