unit criptografia;

interface

uses
  SysUtils, Classes;

type
  Tcriptografia = class(TComponent)
  private
    VChave: Word;


    { Private declarations }
  protected
    { Protected declarations }
  public
    Constructor Create(AOWner:Tcomponent);override;
    Function Criptografar(wStri: String): String;

    { Public declarations }
  published
    Property Chave:Word read vChave write vChave;

    { Published declarations }
  end;

procedure Register;
Const
C1= 33598;
C2=24219;


implementation


procedure Register;
begin
  RegisterComponents('Samples', [Tcriptografia]);
end;
constructor Tcriptografia.Create(AOWner: Tcomponent);
begin
  Inherited Create(AOWner); //Chama o construtor priginal
  Chave:=16854;
end;





function Tcriptografia.Criptografar(wStri: String): String;
var Simbolos : array [0..4] of String;
x            : Integer;
begin
        Simbolos[1]:='ABCDEFGHIJLMNOPQRSTUVXZYWK ~!@#$%^&*()';
        Simbolos[2]:= 'ÂÀ©Øû×ƒçêùÿ5Üø£úñÑªº¿®¬¼ëèïÙýÄÅÉæÆôöò»Á';
        Simbolos[3]:= 'abcdefghijlmnopqrstuvxzywk1234567890';
        Simbolos[4]:= 'áâäàåíóÇüé¾¶§÷ÎÏ-+ÌÓß¸°¨·¹³²Õµþîì¡«½';
 
        for x := 1 to Length(Trim(wStri)) do 
        begin
                if pos(copy(wStri,x,1),Simbolos[1])>0 then
                Result := Result+copy(Simbolos[2],
                          pos(copy(wStri,x,1),Simbolos[1]),1)
 
                else 
                if pos(copy(wStri,x,1),Simbolos[2])>0 then
                   Result := Result+copy(Simbolos[1],
                             pos(copy(wStri,x,1),Simbolos[2]),1)
 
                else 
                if pos(copy(wStri,x,1),Simbolos[3])>0 then
                   Result := Result+copy(Simbolos[4],
                             pos(copy(wStri,x,1),Simbolos[3]),1)
                              
                else 
                if pos(copy(wStri,x,1),Simbolos[4])>0 then
                   Result := Result+copy(Simbolos[3],
                          pos(copy(wStri,x,1),Simbolos[4]),1);
        end;
end;



end.
