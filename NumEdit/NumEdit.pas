unit NumEdit;

interface

uses
  SysUtils, Classes, Controls, StdCtrls;

type
  TNumEdit = class(TEdit)
  private
  FNumerico : boolean;
    { Private declarations }
  protected
  procedure KeyPress(var Key : Char);override;
  procedure Change;override;
    { Protected declarations }
  public
  constructor Create(AOwner: TComponent);override;
    { Public declarations }
  published
  property Numerico : boolean read FNumerico write FNumerico;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Sagahc', [TNumEdit]);
end;

{ TNumEdit }

procedure TNumEdit.Change;
 var
    indice : word;
    posinal : string;
    valorconvertido : Real ;
begin
  // Colocar os sinais + e - na frente da string no Edit.
  // Apenas e a propriedade apenas numero estiver ativada
          if FNumerico then
             begin
             indice := Pos('-',Text);
          if indice > 1   then
              begin
                  posinal := Text;
                  System.Delete(posinal, indice, 1);
                  Text := '-'+posinal;
              end;
          indice := Pos('+',Text);
          if indice > 1 then
              begin
                  posinal := Text;
                  System.Delete(posinal, indice, 1);
                  Text := '+'+posinal;
              end;
              try
                  if Text<>EmptyStr Then
                    valorconvertido := StrToFloat(Text);
              except
                  on EConvertError do
                     begin
                        Numerico := False;
                     end;
              end;
              end;
       inherited Change;
end;

constructor TNumEdit.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
     FNumerico := True;
     Text := '0';
end;

procedure TNumEdit.KeyPress(var Key: Char);
begin
  // Restringir Apenas números no edit
 if FNumerico then
     begin
          if (not (key in ['0'..'9',',', #8]))  then
            key := #0;
end;
inherited KeyPress(Key);

end;

end.
