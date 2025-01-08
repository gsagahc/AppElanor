unit NumPed;

interface

uses
  SysUtils, Classes, Controls, StdCtrls;

type
  TNumPed = class(TEdit)
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
  RegisterComponents('Sagahc', [TNumPed]);
end;

{ TNumEdit }

procedure TNumPed.Change;
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
                 if length (Text)>2 Then
                   valorconvertido := StrToFloat(Copy(Text,3,(length (Text))));
              except
                  on EConvertError do
                     begin
                        Numerico := False;
                     end;
              end;
              end;
       inherited Change;
end;

constructor TNumPed.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
     FNumerico := True;
     Text := 'DO';
end;

procedure TNumPed.KeyPress(var Key: Char);
begin
  // Restringir Apenas números no edit
 if FNumerico then
     begin
          if (not (key in ['0'..'9','-','+',#8, 'D', 'O']))or((key in ['+','-']) and (Pos(key,Text)>0)) then key := #0;
end;
inherited KeyPress(Key);

end;

end.
