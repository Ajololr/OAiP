unit Queue;

interface

type
    TElement = String;
    PNodePointer = ^TNode;
    TNode = record
        Value: TElement;
        Next: PNodePointer;
    end;

    TMyQueue = class(TObject)
    private
        Head: PNodePointer;
        Tail: PNodePointer;
    public
        constructor Create;
        destructor Destroy;
        procedure Enqueue(Item: TElement);
        function Dequeue: TElement;
        function IsEmpty: Boolean;
    end;

implementation

uses Main;

constructor TMyQueue.Create;
begin
    Head:= nil;
    Tail:= nil;
end;

destructor TMyQueue.Destroy;
begin
    while not IsEmpty do
        Dequeue;
    Head:= nil;
    Tail:= nil;
end;

procedure TMyQueue.Enqueue(Item: TElement);
var
    Temp: PNodePointer;
begin
    New(Temp);
    Temp^.Value := Item;
    Temp^.Next := nil;
    if (IsEmpty) then
    begin
        Head:= Temp;
        Tail:= Temp;
    end
    else
    begin
        Tail^.next := Temp;
        Tail := Temp;
    end;
end;

function TMyQueue.Dequeue: TElement;
var
    Temp: PNodePointer;
begin
    if not IsEmpty then
    begin
        Temp := Head;
        Head := Head^.Next;
        Result := temp^.value;
        Dispose(temp);
    end
    else
        Result := '';
end;

function TMyQueue.IsEmpty: boolean;
begin
    if Head = nil then
        IsEmpty := true
    else
        IsEmpty := false;
end;

end.
