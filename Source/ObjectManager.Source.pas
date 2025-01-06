unit ObjectManager.Source;

interface

uses
  System.SysUtils,
  System.Classes,
  System.StrUtils;

type
  IObjectManager<T: class> = interface
    ['{A97F7065-6F6B-4499-9F46-E5C54148749C}']
    function This: T;
  end;

  TObjectManager<T: class> = class(TInterfacedObject, IObjectManager<T>)
  private
    { Private declarations }
    [strong]
    FObject: T;
  public
    { Public declarations }
    constructor Create(AObject: T);
    destructor Destroy; override;
    class function New(AObject: T): IObjectManager<T>;
    function This: T;
  end;

implementation

{ TObjectManager<T> }

constructor TObjectManager<T>.Create(AObject: T);
begin
  FObject := AObject;
end;

destructor TObjectManager<T>.Destroy;
begin
  if Assigned(FObject) then
    FreeAndNil(FObject);
  inherited;
end;

class function TObjectManager<T>.New(AObject: T): IObjectManager<T>;
begin
  Result := Self.Create(AObject);
end;

function TObjectManager<T>.This: T;
begin
  Result := FObject;
end;

end.
