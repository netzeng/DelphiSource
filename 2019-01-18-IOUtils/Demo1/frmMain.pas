unit frmMain;

interface

uses
  System.Types, System.IOUtils, Winapi.Windows, Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure ListFiless(FilePath: string);
    procedure ListDirs(DirName: string);

    { Private declarations }
  public
    { Public declarations }
    // 递归演示:数字累加
    procedure ProRecursion(i: Integer);

    function FunRecursion(i: Integer): Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage('调用方：' + FunRecursion(0).ToString);
end;

procedure TForm1.Button2Click(Sender: TObject);

begin
  // 获取当前目录下所有的文件
  ListFiless(Edit1.Text);
  // 获取当前目录下所有的文件夹
  ListDirs(Edit1.Text);

end;

// 递归演示(函数):数字累加
function TForm1.FunRecursion(i: Integer): Integer;
begin
  ShowMessage('方法内部：' + i.ToString);
  i := i + 1;
  if (i < 10) then begin
    Result := FunRecursion(i);
  end
  else begin
    Result := i;
  end;

end;

procedure TForm1.ListDirs(DirName: string);
var
  DirList: TStringDynArray;
  Name: string;
begin
  // 获取某个路径下的所有文件夹
  DirList := TDirectory.GetDirectories(DirName);
  // 遍历，获取每一个文件夹(路径)
  for Name in DirList do begin
    // 将获取到的路径加入窗口
    Self.Memo1.Lines.Add(Name);
    // 获取这个路径下所有文件
    ListFiless(Name);
    // 递归,继续获取当前(Name)目录下的文件夹
    ListDirs(Name);
  end;
end;

procedure TForm1.ListFiless(FilePath: string);
var
  FileList: TStringDynArray;
  FileName: string;
begin
  // 获取当前路径下的所有文件
  FileList := TDirectory.GetFiles(FilePath);
  //遍历数组，获取文件信息
  for FileName in FileList do begin
    Self.Memo1.Lines.Add(FileName);
  end;
end;

// 递归演示:数字累加 ,递归方法一定要有出口
procedure TForm1.ProRecursion(i: Integer);
begin
  ShowMessage(i.ToString);
  i := i + 1;
  if (i < 10) then begin
    ProRecursion(i);
  end;
end;

end.
