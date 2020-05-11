unit BinaryTree;

interface

type
    TElement = Integer;
    PNode = ^TNode;
    TNode = record
        Key: TElement;
        Left: PNode;
        Right: PNode;
    end;

    TMyBinaryTree = class(TObject)
    public
        Root: PNode;
        constructor Create;
        destructor Destroy;
        procedure Add(NewKey: TElement);
        procedure Delete(Target: TElement);
        function Search(Target: TElement): Boolean;
        function IsEmpty: Boolean;
    end;

implementation

constructor TMyBinaryTree.Create;
begin
    Root := nil;
end;

destructor TMyBinaryTree.Destroy;
begin
    Root := nil;
end;

procedure TMyBinaryTree.Add(NewKey: TElement);
var
    Temp, Pointer: PNode;
begin
    New(Temp);
    Temp^.Key := NewKey;
    Temp^.Right := nil;
    Temp^.Left := nil;
    Pointer := Root;
    while (Pointer <> nil) do
        if NewKey >= Pointer^.Key then
            Pointer := Pointer^.Right
        else
            Pointer := Pointer^.Left;
    Pointer := Temp;
end;

function TMyBinaryTree.IsEmpty: Boolean;
begin
    if Root = nil then
        IsEmpty := true
    else
        IsEmpty := false;
end;

procedure TMyBinaryTree.Delete(Target: TElement);
begin
    //
end;

function TMyBinaryTree.Search(Target: Integer): Boolean;
var
    Temp, Pointer: PNode;
begin
    Pointer := Root;
    Search := false;
    while (Pointer <> nil) do
    begin
        if Target = Pointer^.Key then
            Search := true
        else
            if Target > Pointer^.Key then
                Pointer := Pointer^.Right
            else
                Pointer := Pointer^.Left;
    end;
end;

end.
