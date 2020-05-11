unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Menus, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, BinaryTree,
  FMX.Layouts, FMX.TreeView;

type
  TIlya = class(TForm)
    MainMenu: TMainMenu;
    PopupMenu: TPopupMenu;
    Help: TMenuItem;
    AddLeft: TMenuItem;
    AddRight: TMenuItem;
    Start: TMenuItem;
    AddBtn: TButton;
    AddEdit: TEdit;
    TreeView: TTreeView;
    procedure AddBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ilya: TIlya;
  BT: TMyBinaryTree;

implementation

{$R *.fmx}

procedure TIlya.AddBtnClick(Sender: TObject);
begin
    BT.Add(StrToInt(AddEdit.Text));
    TreeView.Items.AddChild
end;

procedure TIlya.FormCreate(Sender: TObject);
begin
    BT := TMyBinaryTree.Create;
end;

function TTree.LeftRightMiddle(Node: PNode): TValues;
var
    Values, LeftValues, RightValues: TValues;
begin
    Values := [];
    if Node <> nil then
        Values := Concat(LeftRightMiddle(Node.Left), LeftRightMiddle(Node.Right), [Node.Value]);
    Result := Values;
end;

procedure TMainForm.AddNode(Node: PNode; TreeNode: TTreeNode);
var
    NewNode: TTreeNode;
begin
    if Node <> nil then
    begin
        NewNode := TreeView.Items.AddChild(TreeNode, IntToStr(Node.Value));
        if (TreeNode <> nil) and (Node.Value < StrToInt(TreeNode.Text)) then
            NewNode.Enabled := False;

        if Node.Right <> nil then
            AddNode(Node.Right, NewNode);

        if Node.Left <> nil then
            AddNode(Node.Left, NewNode);
    end;
end;

end.
