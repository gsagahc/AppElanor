// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl
// Encoding : UTF-8
// Version  : 1.0
// (13/01/2020 13:23:29 - 1.33.2.5)
// ************************************************************************ //

unit UAtendeCliente1;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:unsignedShort   - "http://www.w3.org/2001/XMLSchema"
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"
  // !:short           - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"

  // [WARNINGS]************************************************************** //
  // Unable to sort type 'usuarioInstalacao' due to circular reference!
  // Unable to sort type 'servicoERP' due to circular reference!
  // Unable to sort type 'cartaoPostagemERP' due to circular reference!
  // Unable to sort type 'usuarioInstalacao' due to circular reference!
  // Unable to sort type 'preListaPostagem' due to circular reference!
  // ************************************************************************ //

  buscaDataAtual       = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  getStatusCartaoPostagemResponse = class;      { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  getStatusPLPResponse = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  obterEmbalagemLRS    = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  verificaModalTransporteResponse = class;      { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  verificaModalTransporte = class;              { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  verificaDisponibilidadeServicoResponse = class;   { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  solicitarPostagemScolResponse = class;        { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  solicitaXmlPlpResponse = class;               { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  solicitaPLPResponse  = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  solicitaEtiquetasResponse = class;            { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  pesquisarServicosAdicionais = class;          { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  pesquisarParametrosPorDescricao = class;      { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  pesquisarEmbalagensPorServico = class;        { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  pesquisarDimensoesServico = class;            { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  obterClienteAtualizacao = class;              { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  getStatusCartaoPostagem = class;              { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  geraDigitoVerificadorEtiquetas = class;       { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  consultaCEP          = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  cancelarPedidoScol   = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  calculaTarifaServicoResponse = class;         { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaServicosXServicosAdicionais = class;     { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaServicosValorDeclarado = class;          { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaServicosAdicionaisAtivos = class;        { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaServicos        = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaPagamentoEntregaResponse = class;        { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaPagamentoEntrega = class;                { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaOpcoesResponse  = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaOpcoes          = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaCliente         = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  bloquearObjetoResponse = class;               { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  atualizaRemessaAgrupadaResponse = class;      { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  atualizaRemessaAgrupada = class;              { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  atualizaPagamentoNaEntregaResponse = class;   { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  atualizaPagamentoNaEntrega = class;           { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  Exception            = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/"[F] }
  ErroMontagemRelatorio = class;                { "http://cliente.bean.master.sigep.bsb.correios.com.br/"[F] }
  obterClienteAtualizacaoResponse = class;      { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaDataAtualResponse = class;               { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  objetoPostalPK       = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  validaPlp            = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  validaEtiquetaPLP    = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  solicitaXmlPlp       = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  solicitaPLP          = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  fechaPlpVariosServicosResponse = class;       { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  fechaPlpVariosServicos = class;               { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  fechaPlpResponse     = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  fechaPlp             = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  cancelarObjeto       = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaContrato        = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  bloquearObjeto       = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  SQLException         = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/"[F] }
  verificaDisponibilidadeServico = class;       { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  solicitarPostagemScol = class;                { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  solicitaEtiquetas    = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  integrarUsuarioScol  = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  contratoERPPK        = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  parametroMaster      = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  unidadePostagemERP   = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  enderecoERP          = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  consultaCEPResponse  = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  vigenciaERP          = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  validarPostagemSimultaneaResponse = class;    { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  validarPostagemReversaResponse = class;       { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  validaPlpResponse    = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  validaEtiquetaPLPResponse = class;            { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  integrarUsuarioScolResponse = class;          { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  cancelarObjetoResponse = class;               { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  VerificaSeTodosObjetosCanceladosResponse = class;   { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  valorDeclarado       = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  servicoAdicionalERP  = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  servicoSigep         = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  chancelaMaster       = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  servicoERP           = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  contratoERP          = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  cartaoPostagemERP    = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  gerenteConta2        = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  clienteERP           = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  usuarioInstalacao    = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaClienteResponse = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaContratoResponse = class;                { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  preListaPostagem     = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  objetoPostal         = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  getStatusPLP         = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  VerificaSeTodosObjetosCancelados = class;     { "http://cliente.bean.master.sigep.bsb.correios.com.br/"[A] }
  calculaTarifaServico = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaTarifaVale      = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  valePostal           = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaTarifaValeResponse = class;              { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  objetoSimplificado   = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  retornoCancelamento  = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  cancelarPedidoScolResponse = class;           { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  obterMensagemParametrizada = class;           { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  mensagemParametrizadaTO = class;              { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  obterMensagemParametrizadaResponse = class;   { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  medidaTO             = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  dimensaoTO           = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  pesquisarParametrosPorDescricaoResponse = class;   { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  pesquisarDimensoesServicoResponse = class;    { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  servicoAdicionalTO   = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  buscaServicosAdicionaisAtivosResponse = class;   { "http://cliente.bean.master.sigep.bsb.correios.com.br/"[A] }
  buscaServicosResponse = class;                { "http://cliente.bean.master.sigep.bsb.correios.com.br/"[A] }
  buscaServicosValorDeclaradoResponse = class;   { "http://cliente.bean.master.sigep.bsb.correios.com.br/"[A] }
  buscaServicosXServicosAdicionaisResponse = class;   { "http://cliente.bean.master.sigep.bsb.correios.com.br/"[A] }
  geraDigitoVerificadorEtiquetasResponse = class;   { "http://cliente.bean.master.sigep.bsb.correios.com.br/"[A] }
  obterEmbalagemLRSResponse = class;            { "http://cliente.bean.master.sigep.bsb.correios.com.br/"[A] }
  pesquisarEmbalagensPorServicoResponse = class;   { "http://cliente.bean.master.sigep.bsb.correios.com.br/"[A] }
  pesquisarServicosAdicionaisResponse = class;   { "http://cliente.bean.master.sigep.bsb.correios.com.br/"[A] }
  objeto               = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  produto              = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  pessoa               = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  remetente            = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  coleta               = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  coletaReversa        = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  validarPostagemReversa = class;               { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  coletaSimultanea     = class;                 { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  validarPostagemSimultanea = class;            { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  SigepClienteException = class;                { "http://cliente.bean.master.sigep.bsb.correios.com.br/"[F] }
  AutenticacaoException = class;                { "http://cliente.bean.master.sigep.bsb.correios.com.br/"[F] }

  { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  statusGerente = (Ativo, Inativo);

  { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  tipoGerente = (GerenteConta, GerenteContaMaster);

  { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  statusUsuario = (Ativo2, Inativo2);

  { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  categoriaServico = (SEM_CATEGORIA, PAC, SEDEX, CARTA, GRANDES_FORMATOS, REVERSO);

  { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  simNao = (S, N);

  { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  statusPlp = (Aberta, Fechada, Postada);

  { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  statusObjetoPostal = (EmBranco, Postado, Cancelado, Estorno);

  { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  statusCartao = (Desconhecido, Normal, Suspenso, Cancelado2, Irregular);

  { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  tipoBloqueio = (FRAUDE_BLOQUEIO, EXTRAVIO_VAREJO_PRE_INDENIZADO, EXTRAVIO_VAREJO_POS_INDENIZADO, EXTRAVIO_CORPORATIVO, INTERNACIONAL_LDI);

  { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  acao = (DEVOLVIDO_AO_REMETENTE, ENCAMINHADO_PARA_REFUGO, REINTEGRADO_E_DEVOLVIDO_AO_REMETENTE, DESBLOQUEADO);

  { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }
  tipoMensagem = (A, E, S2);



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaDataAtual = class(TRemotable)
  private
  public
    constructor Create; override;
  published
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  getStatusCartaoPostagemResponse = class(TRemotable)
  private
    Freturn: statusCartao;
  public
    constructor Create; override;
  published
    property return: statusCartao read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  getStatusPLPResponse = class(TRemotable)
  private
    Freturn: statusPlp;
  public
    constructor Create; override;
  published
    property return: statusPlp read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  obterEmbalagemLRS = class(TRemotable)
  private
  public
    constructor Create; override;
  published
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  verificaModalTransporteResponse = class(TRemotable)
  private
    Freturn: WideString;
  public
    constructor Create; override;
  published
    property return: WideString read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  verificaModalTransporte = class(TRemotable)
  private
    FcodigoServico: WideString;
    FcepOrigem: WideString;
    FcepDestino: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property codigoServico: WideString read FcodigoServico write FcodigoServico;
    property cepOrigem: WideString read FcepOrigem write FcepOrigem;
    property cepDestino: WideString read FcepDestino write FcepDestino;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  verificaDisponibilidadeServicoResponse = class(TRemotable)
  private
    Freturn: WideString;
  public
    constructor Create; override;
  published
    property return: WideString read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  solicitarPostagemScolResponse = class(TRemotable)
  private
    Freturn: WideString;
  public
    constructor Create; override;
  published
    property return: WideString read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  solicitaXmlPlpResponse = class(TRemotable)
  private
    Freturn: WideString;
  public
    constructor Create; override;
  published
    property return: WideString read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  solicitaPLPResponse = class(TRemotable)
  private
    Freturn: WideString;
  public
    constructor Create; override;
  published
    property return: WideString read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  solicitaEtiquetasResponse = class(TRemotable)
  private
    Freturn: WideString;
  public
    constructor Create; override;
  published
    property return: WideString read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  pesquisarServicosAdicionais = class(TRemotable)
  private
    Fcodigo: WideString;
  public
    constructor Create; override;
  published
    property codigo: WideString read Fcodigo write Fcodigo;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  pesquisarParametrosPorDescricao = class(TRemotable)
  private
    Fprefix: WideString;
  public
    constructor Create; override;
  published
    property prefix: WideString read Fprefix write Fprefix;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  pesquisarEmbalagensPorServico = class(TRemotable)
  private
    Fcodigo: WideString;
  public
    constructor Create; override;
  published
    property codigo: WideString read Fcodigo write Fcodigo;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  pesquisarDimensoesServico = class(TRemotable)
  private
    Fcodigo: WideString;
    Fembalagem: WideString;
  public
    constructor Create; override;
  published
    property codigo: WideString read Fcodigo write Fcodigo;
    property embalagem: WideString read Fembalagem write Fembalagem;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  obterClienteAtualizacao = class(TRemotable)
  private
    FcnpjCliente: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property cnpjCliente: WideString read FcnpjCliente write FcnpjCliente;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  getStatusCartaoPostagem = class(TRemotable)
  private
    FnumeroCartaoPostagem: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property numeroCartaoPostagem: WideString read FnumeroCartaoPostagem write FnumeroCartaoPostagem;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  geraDigitoVerificadorEtiquetas = class(TRemotable)
  private
    Fetiquetas: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property etiquetas: WideString read Fetiquetas write Fetiquetas;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  consultaCEP = class(TRemotable)
  private
    Fcep: WideString;
  public
    constructor Create; override;
  published
    property cep: WideString read Fcep write Fcep;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  cancelarPedidoScol = class(TRemotable)
  private
    FcodAdministrativo: WideString;
    FidPostagem: WideString;
    Ftipo: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property codAdministrativo: WideString read FcodAdministrativo write FcodAdministrativo;
    property idPostagem: WideString read FidPostagem write FidPostagem;
    property tipo: WideString read Ftipo write Ftipo;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  calculaTarifaServicoResponse = class(TRemotable)
  private
    Freturn: WideString;
  public
    constructor Create; override;
  published
    property return: WideString read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaServicosXServicosAdicionais = class(TRemotable)
  private
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaServicosValorDeclarado = class(TRemotable)
  private
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaServicosAdicionaisAtivos = class(TRemotable)
  private
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaServicos = class(TRemotable)
  private
    FidContrato: WideString;
    FidCartaoPostagem: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property idContrato: WideString read FidContrato write FidContrato;
    property idCartaoPostagem: WideString read FidCartaoPostagem write FidCartaoPostagem;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaPagamentoEntregaResponse = class(TRemotable)
  private
    Freturn: WideString;
  public
    constructor Create; override;
  published
    property return: WideString read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaPagamentoEntrega = class(TRemotable)
  private
    Fusuario: WideString;
    Fsenha: WideString;
    Fcontrato: WideString;
    FdataInicio: WideString;
    FdataFim: WideString;
    Fetiqueta: WideString;
  public
    constructor Create; override;
  published
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
    property contrato: WideString read Fcontrato write Fcontrato;
    property dataInicio: WideString read FdataInicio write FdataInicio;
    property dataFim: WideString read FdataFim write FdataFim;
    property etiqueta: WideString read Fetiqueta write Fetiqueta;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaOpcoesResponse = class(TRemotable)
  private
    Freturn: WideString;
  public
    constructor Create; override;
  published
    property return: WideString read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaOpcoes = class(TRemotable)
  private
    FlistaObjetos: WideString;
    FtipoResultado: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property listaObjetos: WideString read FlistaObjetos write FlistaObjetos;
    property tipoResultado: WideString read FtipoResultado write FtipoResultado;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaCliente = class(TRemotable)
  private
    FidContrato: WideString;
    FidCartaoPostagem: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property idContrato: WideString read FidContrato write FidContrato;
    property idCartaoPostagem: WideString read FidCartaoPostagem write FidCartaoPostagem;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  bloquearObjetoResponse = class(TRemotable)
  private
    Freturn: WideString;
  public
    constructor Create; override;
  published
    property return: WideString read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  atualizaRemessaAgrupadaResponse = class(TRemotable)
  private
    Freturn: WideString;
  public
    constructor Create; override;
  published
    property return: WideString read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  atualizaRemessaAgrupada = class(TRemotable)
  private
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  atualizaPagamentoNaEntregaResponse = class(TRemotable)
  private
    Freturn: WideString;
  public
    constructor Create; override;
  published
    property return: WideString read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  atualizaPagamentoNaEntrega = class(TRemotable)
  private
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  Exception = class(ERemotableException)
  private
    Fmessage: WideString;
  published
    property message: WideString read Fmessage write Fmessage;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  ErroMontagemRelatorio = class(ERemotableException)
  private
    Fmessage: WideString;
  published
    property message: WideString read Fmessage write Fmessage;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  obterClienteAtualizacaoResponse = class(TRemotable)
  private
    Freturn: TXSDateTime;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property return: TXSDateTime read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaDataAtualResponse = class(TRemotable)
  private
    Freturn: TXSDateTime;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property return: TXSDateTime read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  objetoPostalPK = class(TRemotable)
  private
    FcodigoEtiqueta: WideString;
    FplpNu: Int64;
  published
    property codigoEtiqueta: WideString read FcodigoEtiqueta write FcodigoEtiqueta;
    property plpNu: Int64 read FplpNu write FplpNu;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  validaPlp = class(TRemotable)
  private
    Fcliente: Int64;
    Fnumero: WideString;
    Fdiretoria: Int64;
    Fcartao: WideString;
    FunidadePostagem: WideString;
    Fservico: Int64;
    FservicosAdicionais: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property cliente: Int64 read Fcliente write Fcliente;
    property numero: WideString read Fnumero write Fnumero;
    property diretoria: Int64 read Fdiretoria write Fdiretoria;
    property cartao: WideString read Fcartao write Fcartao;
    property unidadePostagem: WideString read FunidadePostagem write FunidadePostagem;
    property servico: Int64 read Fservico write Fservico;
    property servicosAdicionais: WideString read FservicosAdicionais write FservicosAdicionais;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  validaEtiquetaPLP = class(TRemotable)
  private
    FnumeroEtiqueta: WideString;
    FidPlp: Int64;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property numeroEtiqueta: WideString read FnumeroEtiqueta write FnumeroEtiqueta;
    property idPlp: Int64 read FidPlp write FidPlp;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  solicitaXmlPlp = class(TRemotable)
  private
    FidPlpMaster: Int64;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property idPlpMaster: Int64 read FidPlpMaster write FidPlpMaster;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  solicitaPLP = class(TRemotable)
  private
    FidPlpMaster: Int64;
    FnumEtiqueta: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property idPlpMaster: Int64 read FidPlpMaster write FidPlpMaster;
    property numEtiqueta: WideString read FnumEtiqueta write FnumEtiqueta;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  fechaPlpVariosServicosResponse = class(TRemotable)
  private
    Freturn: Int64;
  public
    constructor Create; override;
  published
    property return: Int64 read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  fechaPlpVariosServicos = class(TRemotable)
  private
    Fxml: WideString;
    FidPlpCliente: Int64;
    FcartaoPostagem: WideString;
    FlistaEtiquetas: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property xml: WideString read Fxml write Fxml;
    property idPlpCliente: Int64 read FidPlpCliente write FidPlpCliente;
    property cartaoPostagem: WideString read FcartaoPostagem write FcartaoPostagem;
    property listaEtiquetas: WideString read FlistaEtiquetas write FlistaEtiquetas;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  fechaPlpResponse = class(TRemotable)
  private
    Freturn: Int64;
  public
    constructor Create; override;
  published
    property return: Int64 read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  fechaPlp = class(TRemotable)
  private
    Fxml: WideString;
    FidPlpCliente: Int64;
    FcartaoPostagem: WideString;
    FfaixaEtiquetas: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property xml: WideString read Fxml write Fxml;
    property idPlpCliente: Int64 read FidPlpCliente write FidPlpCliente;
    property cartaoPostagem: WideString read FcartaoPostagem write FcartaoPostagem;
    property faixaEtiquetas: WideString read FfaixaEtiquetas write FfaixaEtiquetas;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  cancelarObjeto = class(TRemotable)
  private
    FidPlp: Int64;
    FnumeroEtiqueta: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property idPlp: Int64 read FidPlp write FidPlp;
    property numeroEtiqueta: WideString read FnumeroEtiqueta write FnumeroEtiqueta;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaContrato = class(TRemotable)
  private
    Fnumero: WideString;
    Fdiretoria: Int64;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property numero: WideString read Fnumero write Fnumero;
    property diretoria: Int64 read Fdiretoria write Fdiretoria;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  bloquearObjeto = class(TRemotable)
  private
    FnumeroEtiqueta: WideString;
    FidPlp: Int64;
    FtipoBloqueio: tipoBloqueio;
    Facao: acao;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property numeroEtiqueta: WideString read FnumeroEtiqueta write FnumeroEtiqueta;
    property idPlp: Int64 read FidPlp write FidPlp;
    property tipoBloqueio: tipoBloqueio read FtipoBloqueio write FtipoBloqueio;
    property acao: acao read Facao write Facao;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  SQLException = class(ERemotableException)
  private
    FerrorCode: Integer;
    FsQLState: WideString;
    Fmessage: WideString;
  published
    property errorCode: Integer read FerrorCode write FerrorCode;
    property sQLState: WideString read FsQLState write FsQLState;
    property message: WideString read Fmessage write Fmessage;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  verificaDisponibilidadeServico = class(TRemotable)
  private
    FcodAdministrativo: Integer;
    FnumeroServico: WideString;
    FcepOrigem: WideString;
    FcepDestino: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property codAdministrativo: Integer read FcodAdministrativo write FcodAdministrativo;
    property numeroServico: WideString read FnumeroServico write FnumeroServico;
    property cepOrigem: WideString read FcepOrigem write FcepOrigem;
    property cepDestino: WideString read FcepDestino write FcepDestino;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  solicitarPostagemScol = class(TRemotable)
  private
    FcodAdministrativo: Integer;
    Fxml: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property codAdministrativo: Integer read FcodAdministrativo write FcodAdministrativo;
    property xml: WideString read Fxml write Fxml;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  solicitaEtiquetas = class(TRemotable)
  private
    FtipoDestinatario: WideString;
    Fidentificador: WideString;
    FidServico: Int64;
    FqtdEtiquetas: Integer;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property tipoDestinatario: WideString read FtipoDestinatario write FtipoDestinatario;
    property identificador: WideString read Fidentificador write Fidentificador;
    property idServico: Int64 read FidServico write FidServico;
    property qtdEtiquetas: Integer read FqtdEtiquetas write FqtdEtiquetas;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  integrarUsuarioScol = class(TRemotable)
  private
    FcodAdministrativo: Integer;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
  published
    property codAdministrativo: Integer read FcodAdministrativo write FcodAdministrativo;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  contratoERPPK = class(TRemotable)
  private
    Fdiretoria: Int64;
    Fnumero: WideString;
  published
    property diretoria: Int64 read Fdiretoria write Fdiretoria;
    property numero: WideString read Fnumero write Fnumero;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  parametroMaster = class(TRemotable)
  private
    FprmCoParametro: Int64;
    FprmTxParametro: WideString;
    FprmTxValor: WideString;
  published
    property prmCoParametro: Int64 read FprmCoParametro write FprmCoParametro;
    property prmTxParametro: WideString read FprmTxParametro write FprmTxParametro;
    property prmTxValor: WideString read FprmTxValor write FprmTxValor;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  unidadePostagemERP = class(TRemotable)
  private
    FdiretoriaRegional: WideString;
    Fendereco: enderecoERP;
    Fid: WideString;
    Fnome: WideString;
    Fstatus: WideString;
    Ftipo: WideString;
  public
    destructor Destroy; override;
  published
    property diretoriaRegional: WideString read FdiretoriaRegional write FdiretoriaRegional;
    property endereco: enderecoERP read Fendereco write Fendereco;
    property id: WideString read Fid write Fid;
    property nome: WideString read Fnome write Fnome;
    property status: WideString read Fstatus write Fstatus;
    property tipo: WideString read Ftipo write Ftipo;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  enderecoERP = class(TRemotable)
  private
    Fbairro: WideString;
    Fcep: WideString;
    Fcidade: WideString;
    Fcomplemento2: WideString;
    Fend_: WideString;
    Fuf: WideString;
    FunidadesPostagem: unidadePostagemERP;
  public
    destructor Destroy; override;
  published
    property bairro: WideString read Fbairro write Fbairro;
    property cep: WideString read Fcep write Fcep;
    property cidade: WideString read Fcidade write Fcidade;
    property complemento2: WideString read Fcomplemento2 write Fcomplemento2;
    property end_: WideString read Fend_ write Fend_;
    property uf: WideString read Fuf write Fuf;
    property unidadesPostagem: unidadePostagemERP read FunidadesPostagem write FunidadesPostagem;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  consultaCEPResponse = class(TRemotable)
  private
    Freturn: enderecoERP;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property return: enderecoERP read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  vigenciaERP = class(TRemotable)
  private
    FdataFinal: TXSDateTime;
    FdataInicial: TXSDateTime;
    FdatajFim: Integer;
    FdatajIni: Integer;
    Fid: Int64;
  public
    destructor Destroy; override;
  published
    property dataFinal: TXSDateTime read FdataFinal write FdataFinal;
    property dataInicial: TXSDateTime read FdataInicial write FdataInicial;
    property datajFim: Integer read FdatajFim write FdatajFim;
    property datajIni: Integer read FdatajIni write FdatajIni;
    property id: Int64 read Fid write Fid;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  validarPostagemSimultaneaResponse = class(TRemotable)
  private
    Freturn: Boolean;
  public
    constructor Create; override;
  published
    property return: Boolean read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  validarPostagemReversaResponse = class(TRemotable)
  private
    Freturn: Boolean;
  public
    constructor Create; override;
  published
    property return: Boolean read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  validaPlpResponse = class(TRemotable)
  private
    Freturn: Boolean;
  public
    constructor Create; override;
  published
    property return: Boolean read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  validaEtiquetaPLPResponse = class(TRemotable)
  private
    Freturn: Boolean;
  public
    constructor Create; override;
  published
    property return: Boolean read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  integrarUsuarioScolResponse = class(TRemotable)
  private
    Freturn: Boolean;
  public
    constructor Create; override;
  published
    property return: Boolean read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  cancelarObjetoResponse = class(TRemotable)
  private
    Freturn: Boolean;
  public
    constructor Create; override;
  published
    property return: Boolean read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  VerificaSeTodosObjetosCanceladosResponse = class(TRemotable)
  private
    Freturn: Boolean;
  public
    constructor Create; override;
  published
    property return: Boolean read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  valorDeclarado = class(TRemotable)
  private
    Fmaximo: Double;
    Fminimo: Double;
  published
    property maximo: Double read Fmaximo write Fmaximo;
    property minimo: Double read Fminimo write Fminimo;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  servicoAdicionalERP = class(TRemotable)
  private
    Fcategoria: WideString;
    Fcodigo: WideString;
    FdataAtualizacao: TXSDateTime;
    FdatajAtualizacao: Integer;
    Fdescricao: WideString;
    FhorajAtualizacao: Integer;
    Fid: Integer;
    Fsigla: WideString;
    FvalorDeclarado: valorDeclarado;
  public
    destructor Destroy; override;
  published
    property categoria: WideString read Fcategoria write Fcategoria;
    property codigo: WideString read Fcodigo write Fcodigo;
    property dataAtualizacao: TXSDateTime read FdataAtualizacao write FdataAtualizacao;
    property datajAtualizacao: Integer read FdatajAtualizacao write FdatajAtualizacao;
    property descricao: WideString read Fdescricao write Fdescricao;
    property horajAtualizacao: Integer read FhorajAtualizacao write FhorajAtualizacao;
    property id: Integer read Fid write Fid;
    property sigla: WideString read Fsigla write Fsigla;
    property valorDeclarado: valorDeclarado read FvalorDeclarado write FvalorDeclarado;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  servicoSigep = class(TRemotable)
  private
    FcategoriaServico: categoriaServico;
    Fchancela: chancelaMaster;
    Fdescricao: WideString;
    FexigeDimensoes: Boolean;
    FexigeValorCobrar: Boolean;
    Fimitm: Int64;
    FpagamentoEntrega: WideString;
    FremessaAgrupada: WideString;
    Frestricao: simNao;
    Fservico: Int64;
    FservicoERP: servicoERP;
    FssiCoCodigoPostal: WideString;
  public
    destructor Destroy; override;
  published
    property categoriaServico: categoriaServico read FcategoriaServico write FcategoriaServico;
    property chancela: chancelaMaster read Fchancela write Fchancela;
    property descricao: WideString read Fdescricao write Fdescricao;
    property exigeDimensoes: Boolean read FexigeDimensoes write FexigeDimensoes;
    property exigeValorCobrar: Boolean read FexigeValorCobrar write FexigeValorCobrar;
    property imitm: Int64 read Fimitm write Fimitm;
    property pagamentoEntrega: WideString read FpagamentoEntrega write FpagamentoEntrega;
    property remessaAgrupada: WideString read FremessaAgrupada write FremessaAgrupada;
    property restricao: simNao read Frestricao write Frestricao;
    property servico: Int64 read Fservico write Fservico;
    property servicoERP: servicoERP read FservicoERP write FservicoERP;
    property ssiCoCodigoPostal: WideString read FssiCoCodigoPostal write FssiCoCodigoPostal;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  chancelaMaster = class(TRemotable)
  private
    Fativo: simNao;
    Fchancela: TByteDynArray;
    FdataAtualizacao: TXSDateTime;
    Fdescricao: WideString;
    Fid: Int64;
    FservicosSigep: servicoSigep;
  public
    destructor Destroy; override;
  published
    property ativo: simNao read Fativo write Fativo;
    property chancela: TByteDynArray read Fchancela write Fchancela;
    property dataAtualizacao: TXSDateTime read FdataAtualizacao write FdataAtualizacao;
    property descricao: WideString read Fdescricao write Fdescricao;
    property id: Int64 read Fid write Fid;
    property servicosSigep: servicoSigep read FservicosSigep write FservicosSigep;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  servicoERP = class(TRemotable)
  private
    Fcodigo: WideString;
    FdataAtualizacao: TXSDateTime;
    FdatajAtualizacao: Integer;
    Fdescricao: WideString;
    FhorajAtualizacao: Integer;
    Fid: Int64;
    FservicoSigep: servicoSigep;
    FservicosAdicionais: servicoAdicionalERP;
    Ftipo1Codigo: WideString;
    Ftipo1Descricao: WideString;
    Ftipo2Codigo: WideString;
    Ftipo2Descricao: WideString;
    Fvigencia: vigenciaERP;
  public
    destructor Destroy; override;
  published
    property codigo: WideString read Fcodigo write Fcodigo;
    property dataAtualizacao: TXSDateTime read FdataAtualizacao write FdataAtualizacao;
    property datajAtualizacao: Integer read FdatajAtualizacao write FdatajAtualizacao;
    property descricao: WideString read Fdescricao write Fdescricao;
    property horajAtualizacao: Integer read FhorajAtualizacao write FhorajAtualizacao;
    property id: Int64 read Fid write Fid;
    property servicoSigep: servicoSigep read FservicoSigep write FservicoSigep;
    property servicosAdicionais: servicoAdicionalERP read FservicosAdicionais write FservicosAdicionais;
    property tipo1Codigo: WideString read Ftipo1Codigo write Ftipo1Codigo;
    property tipo1Descricao: WideString read Ftipo1Descricao write Ftipo1Descricao;
    property tipo2Codigo: WideString read Ftipo2Codigo write Ftipo2Codigo;
    property tipo2Descricao: WideString read Ftipo2Descricao write Ftipo2Descricao;
    property vigencia: vigenciaERP read Fvigencia write Fvigencia;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  contratoERP = class(TRemotable)
  private
    FcartoesPostagem: cartaoPostagemERP;
    Fcliente: clienteERP;
    FcodigoCliente: Int64;
    FcodigoDiretoria: WideString;
    FcontratoPK: contratoERPPK;
    FdataAtualizacao: TXSDateTime;
    FdataAtualizacaoDDMMYYYY: WideString;
    FdataVigenciaFim: TXSDateTime;
    FdataVigenciaFimDDMMYYYY: WideString;
    FdataVigenciaInicio: TXSDateTime;
    FdataVigenciaInicioDDMMYYYY: WideString;
    FdatajAtualizacao: Integer;
    FdatajVigenciaFim: Integer;
    FdatajVigenciaInicio: Integer;
    FdescricaoDiretoriaRegional: WideString;
    FdescricaoStatus: WideString;
    FdiretoriaRegional: unidadePostagemERP;
    FhorajAtualizacao: Integer;
    FstatusCodigo: WideString;
  public
    destructor Destroy; override;
  published
    property cartoesPostagem: cartaoPostagemERP read FcartoesPostagem write FcartoesPostagem;
    property cliente: clienteERP read Fcliente write Fcliente;
    property codigoCliente: Int64 read FcodigoCliente write FcodigoCliente;
    property codigoDiretoria: WideString read FcodigoDiretoria write FcodigoDiretoria;
    property contratoPK: contratoERPPK read FcontratoPK write FcontratoPK;
    property dataAtualizacao: TXSDateTime read FdataAtualizacao write FdataAtualizacao;
    property dataAtualizacaoDDMMYYYY: WideString read FdataAtualizacaoDDMMYYYY write FdataAtualizacaoDDMMYYYY;
    property dataVigenciaFim: TXSDateTime read FdataVigenciaFim write FdataVigenciaFim;
    property dataVigenciaFimDDMMYYYY: WideString read FdataVigenciaFimDDMMYYYY write FdataVigenciaFimDDMMYYYY;
    property dataVigenciaInicio: TXSDateTime read FdataVigenciaInicio write FdataVigenciaInicio;
    property dataVigenciaInicioDDMMYYYY: WideString read FdataVigenciaInicioDDMMYYYY write FdataVigenciaInicioDDMMYYYY;
    property datajAtualizacao: Integer read FdatajAtualizacao write FdatajAtualizacao;
    property datajVigenciaFim: Integer read FdatajVigenciaFim write FdatajVigenciaFim;
    property datajVigenciaInicio: Integer read FdatajVigenciaInicio write FdatajVigenciaInicio;
    property descricaoDiretoriaRegional: WideString read FdescricaoDiretoriaRegional write FdescricaoDiretoriaRegional;
    property descricaoStatus: WideString read FdescricaoStatus write FdescricaoStatus;
    property diretoriaRegional: unidadePostagemERP read FdiretoriaRegional write FdiretoriaRegional;
    property horajAtualizacao: Integer read FhorajAtualizacao write FhorajAtualizacao;
    property statusCodigo: WideString read FstatusCodigo write FstatusCodigo;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  cartaoPostagemERP = class(TRemotable)
  private
    FcodigoAdministrativo: WideString;
    Fcontratos: contratoERP;
    FdataAtualizacao: TXSDateTime;
    FdataVigenciaFim: TXSDateTime;
    FdataVigenciaInicio: TXSDateTime;
    FdatajAtualizacao: Integer;
    FdatajVigenciaFim: Integer;
    FdatajVigenciaInicio: Integer;
    FdescricaoStatusCartao: WideString;
    FdescricaoUnidadePostagemGenerica: WideString;
    FhorajAtualizacao: Integer;
    Fnumero: WideString;
    Fservicos: servicoERP;
    FstatusCartaoPostagem: WideString;
    FstatusCodigo: WideString;
    FunidadeGenerica: WideString;
    FunidadesPostagem: unidadePostagemERP;
  public
    destructor Destroy; override;
  published
    property codigoAdministrativo: WideString read FcodigoAdministrativo write FcodigoAdministrativo;
    property contratos: contratoERP read Fcontratos write Fcontratos;
    property dataAtualizacao: TXSDateTime read FdataAtualizacao write FdataAtualizacao;
    property dataVigenciaFim: TXSDateTime read FdataVigenciaFim write FdataVigenciaFim;
    property dataVigenciaInicio: TXSDateTime read FdataVigenciaInicio write FdataVigenciaInicio;
    property datajAtualizacao: Integer read FdatajAtualizacao write FdatajAtualizacao;
    property datajVigenciaFim: Integer read FdatajVigenciaFim write FdatajVigenciaFim;
    property datajVigenciaInicio: Integer read FdatajVigenciaInicio write FdatajVigenciaInicio;
    property descricaoStatusCartao: WideString read FdescricaoStatusCartao write FdescricaoStatusCartao;
    property descricaoUnidadePostagemGenerica: WideString read FdescricaoUnidadePostagemGenerica write FdescricaoUnidadePostagemGenerica;
    property horajAtualizacao: Integer read FhorajAtualizacao write FhorajAtualizacao;
    property numero: WideString read Fnumero write Fnumero;
    property servicos: servicoERP read Fservicos write Fservicos;
    property statusCartaoPostagem: WideString read FstatusCartaoPostagem write FstatusCartaoPostagem;
    property statusCodigo: WideString read FstatusCodigo write FstatusCodigo;
    property unidadeGenerica: WideString read FunidadeGenerica write FunidadeGenerica;
    property unidadesPostagem: unidadePostagemERP read FunidadesPostagem write FunidadesPostagem;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  gerenteConta2 = class(TRemotable)
  private
    FclientesVisiveis: clienteERP;
    FdataAtualizacao: TXSDateTime;
    FdataInclusao: TXSDateTime;
    FdataSenha: TXSDateTime;
    Flogin: WideString;
    Fmatricula: WideString;
    Fsenha: WideString;
    Fstatus: statusGerente;
    FtipoGerente: tipoGerente;
    FusuariosInstalacao: usuarioInstalacao;
    Fvalidade: WideString;
  public
    destructor Destroy; override;
  published
    property clientesVisiveis: clienteERP read FclientesVisiveis write FclientesVisiveis;
    property dataAtualizacao: TXSDateTime read FdataAtualizacao write FdataAtualizacao;
    property dataInclusao: TXSDateTime read FdataInclusao write FdataInclusao;
    property dataSenha: TXSDateTime read FdataSenha write FdataSenha;
    property login: WideString read Flogin write Flogin;
    property matricula: WideString read Fmatricula write Fmatricula;
    property senha: WideString read Fsenha write Fsenha;
    property status: statusGerente read Fstatus write Fstatus;
    property tipoGerente: tipoGerente read FtipoGerente write FtipoGerente;
    property usuariosInstalacao: usuarioInstalacao read FusuariosInstalacao write FusuariosInstalacao;
    property validade: WideString read Fvalidade write Fvalidade;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  clienteERP = class(TRemotable)
  private
    Fcnpj: WideString;
    Fcontratos: contratoERP;
    FdataAtualizacao: TXSDateTime;
    FdatajAtualizacao: Integer;
    FdescricaoStatusCliente: WideString;
    FgerenteConta: gerenteConta2;
    FhorajAtualizacao: Int64;
    Fid: Int64;
    FinscricaoEstadual: WideString;
    Fnome: WideString;
    FstatusCodigo: WideString;
  public
    destructor Destroy; override;
  published
    property cnpj: WideString read Fcnpj write Fcnpj;
    property contratos: contratoERP read Fcontratos write Fcontratos;
    property dataAtualizacao: TXSDateTime read FdataAtualizacao write FdataAtualizacao;
    property datajAtualizacao: Integer read FdatajAtualizacao write FdatajAtualizacao;
    property descricaoStatusCliente: WideString read FdescricaoStatusCliente write FdescricaoStatusCliente;
    property gerenteConta: gerenteConta2 read FgerenteConta write FgerenteConta;
    property horajAtualizacao: Int64 read FhorajAtualizacao write FhorajAtualizacao;
    property id: Int64 read Fid write Fid;
    property inscricaoEstadual: WideString read FinscricaoEstadual write FinscricaoEstadual;
    property nome: WideString read Fnome write Fnome;
    property statusCodigo: WideString read FstatusCodigo write FstatusCodigo;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  usuarioInstalacao = class(TRemotable)
  private
    FdataAtualizacao: TXSDateTime;
    FdataInclusao: TXSDateTime;
    FdataSenha: TXSDateTime;
    FgerenteMaster: gerenteConta2;
    FhashSenha: WideString;
    Fid: Int64;
    Flogin: WideString;
    Fnome: WideString;
    Fparametros: parametroMaster;
    Fsenha: WideString;
    Fstatus: statusUsuario;
    Fvalidade: WideString;
  public
    destructor Destroy; override;
  published
    property dataAtualizacao: TXSDateTime read FdataAtualizacao write FdataAtualizacao;
    property dataInclusao: TXSDateTime read FdataInclusao write FdataInclusao;
    property dataSenha: TXSDateTime read FdataSenha write FdataSenha;
    property gerenteMaster: gerenteConta2 read FgerenteMaster write FgerenteMaster;
    property hashSenha: WideString read FhashSenha write FhashSenha;
    property id: Int64 read Fid write Fid;
    property login: WideString read Flogin write Flogin;
    property nome: WideString read Fnome write Fnome;
    property parametros: parametroMaster read Fparametros write Fparametros;
    property senha: WideString read Fsenha write Fsenha;
    property status: statusUsuario read Fstatus write Fstatus;
    property validade: WideString read Fvalidade write Fvalidade;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaClienteResponse = class(TRemotable)
  private
    Freturn: clienteERP;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property return: clienteERP read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaContratoResponse = class(TRemotable)
  private
    Freturn: contratoERP;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property return: contratoERP read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  preListaPostagem = class(TRemotable)
  private
    FcartaoPostagem: cartaoPostagemERP;
    FconteudoProibido: simNao;
    FdataAtualizacaoCliente: TXSDateTime;
    FdataAtualizacaoSara: TXSDateTime;
    FdataFechamento: TXSDateTime;
    FdataPostagem: TXSDateTime;
    FdataPostagemSara: TXSDateTime;
    FobjetosPostais: objetoPostal;
    FplpCliente: Int64;
    FplpNu: Int64;
    FplpXml: Word;
    FplpXmlRetorno: Word;
    Fstatus: statusPlp;
  public
    destructor Destroy; override;
  published
    property cartaoPostagem: cartaoPostagemERP read FcartaoPostagem write FcartaoPostagem;
    property conteudoProibido: simNao read FconteudoProibido write FconteudoProibido;
    property dataAtualizacaoCliente: TXSDateTime read FdataAtualizacaoCliente write FdataAtualizacaoCliente;
    property dataAtualizacaoSara: TXSDateTime read FdataAtualizacaoSara write FdataAtualizacaoSara;
    property dataFechamento: TXSDateTime read FdataFechamento write FdataFechamento;
    property dataPostagem: TXSDateTime read FdataPostagem write FdataPostagem;
    property dataPostagemSara: TXSDateTime read FdataPostagemSara write FdataPostagemSara;
    property objetosPostais: objetoPostal read FobjetosPostais write FobjetosPostais;
    property plpCliente: Int64 read FplpCliente write FplpCliente;
    property plpNu: Int64 read FplpNu write FplpNu;
    property plpXml: Word read FplpXml write FplpXml;
    property plpXmlRetorno: Word read FplpXmlRetorno write FplpXmlRetorno;
    property status: statusPlp read Fstatus write Fstatus;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  objetoPostal = class(TRemotable)
  private
    FcodigoEtiqueta: WideString;
    FdataAtualizacaoCliente: TXSDateTime;
    FdataBloqueioObjeto: TXSDateTime;
    FdataCancelamentoEtiqueta: TXSDateTime;
    FdataInclusao: TXSDateTime;
    FobjetoPostalPK: objetoPostalPK;
    FplpNu: Int64;
    FpreListaPostagem: preListaPostagem;
    FrestricaoAerea: simNao;
    FstatusBloqueio: WideString;
    FstatusEtiqueta: statusObjetoPostal;
  public
    destructor Destroy; override;
  published
    property codigoEtiqueta: WideString read FcodigoEtiqueta write FcodigoEtiqueta;
    property dataAtualizacaoCliente: TXSDateTime read FdataAtualizacaoCliente write FdataAtualizacaoCliente;
    property dataBloqueioObjeto: TXSDateTime read FdataBloqueioObjeto write FdataBloqueioObjeto;
    property dataCancelamentoEtiqueta: TXSDateTime read FdataCancelamentoEtiqueta write FdataCancelamentoEtiqueta;
    property dataInclusao: TXSDateTime read FdataInclusao write FdataInclusao;
    property objetoPostalPK: objetoPostalPK read FobjetoPostalPK write FobjetoPostalPK;
    property plpNu: Int64 read FplpNu write FplpNu;
    property preListaPostagem: preListaPostagem read FpreListaPostagem write FpreListaPostagem;
    property restricaoAerea: simNao read FrestricaoAerea write FrestricaoAerea;
    property statusBloqueio: WideString read FstatusBloqueio write FstatusBloqueio;
    property statusEtiqueta: statusObjetoPostal read FstatusEtiqueta write FstatusEtiqueta;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  getStatusPLP = class(TRemotable)
  private
    Farg0: objetoPostal;
    Farg1: WideString;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property arg0: objetoPostal read Farg0 write Farg0;
    property arg1: WideString read Farg1 write Farg1;
  end;

  arg0       = array of objetoPostal;           { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }


  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoInlineArrays,xoLiteralParam]
  // ************************************************************************ //
  VerificaSeTodosObjetosCancelados = class(TRemotable)
  private
    Farg0: arg0;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetobjetoPostalArray(Index: Integer): objetoPostal;
    function   GetobjetoPostalArrayLength: Integer;
    property   objetoPostalArray[Index: Integer]: objetoPostal read GetobjetoPostalArray; default;
    property   Len: Integer read GetobjetoPostalArrayLength;
  published
    property arg0: arg0 read Farg0 write Farg0;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  calculaTarifaServico = class(TRemotable)
  private
    FcodAdministrativo: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
    FcodServico: WideString;
    FcepOrigem: WideString;
    FcepDestino: WideString;
    Fpeso: WideString;
    FcodFormato: Integer;
    Fcomprimento: Double;
    Faltura: Double;
    Flargura: Double;
    Fdiametro: Double;
    FcodMaoPropria: WideString;
    FvalorDeclarado: Double;
    FcodAvisoRecebimento: WideString;
  public
    constructor Create; override;
  published
    property codAdministrativo: WideString read FcodAdministrativo write FcodAdministrativo;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
    property codServico: WideString read FcodServico write FcodServico;
    property cepOrigem: WideString read FcepOrigem write FcepOrigem;
    property cepDestino: WideString read FcepDestino write FcepDestino;
    property peso: WideString read Fpeso write Fpeso;
    property codFormato: Integer read FcodFormato write FcodFormato;
    property comprimento: Double read Fcomprimento write Fcomprimento;
    property altura: Double read Faltura write Faltura;
    property largura: Double read Flargura write Flargura;
    property diametro: Double read Fdiametro write Fdiametro;
    property codMaoPropria: WideString read FcodMaoPropria write FcodMaoPropria;
    property valorDeclarado: Double read FvalorDeclarado write FvalorDeclarado;
    property codAvisoRecebimento: WideString read FcodAvisoRecebimento write FcodAvisoRecebimento;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaTarifaVale = class(TRemotable)
  private
    FcodAdministrativo: WideString;
    Fusuario: WideString;
    Fsenha: WideString;
    FcodServico: WideString;
    FcepOrigem: WideString;
    FcepDestino: WideString;
    Fpeso: WideString;
    FcodFormato: Integer;
    Fcomprimento: Double;
    Faltura: Double;
    Flargura: Double;
    FvalorDeclarado: Double;
    FservicoAdicional: WideString;
  public
    constructor Create; override;
  published
    property codAdministrativo: WideString read FcodAdministrativo write FcodAdministrativo;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
    property codServico: WideString read FcodServico write FcodServico;
    property cepOrigem: WideString read FcepOrigem write FcepOrigem;
    property cepDestino: WideString read FcepDestino write FcepDestino;
    property peso: WideString read Fpeso write Fpeso;
    property codFormato: Integer read FcodFormato write FcodFormato;
    property comprimento: Double read Fcomprimento write Fcomprimento;
    property altura: Double read Faltura write Faltura;
    property largura: Double read Flargura write Flargura;
    property valorDeclarado: Double read FvalorDeclarado write FvalorDeclarado;
    property servicoAdicional: WideString read FservicoAdicional write FservicoAdicional;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  valePostal = class(TRemotable)
  private
    FcidNoCidade: WideString;
    FctcCoAadministrativo: WideString;
    FctcNuContrato: Int64;
    FctcNuContratoEct: Int64;
    FcvpEdBairro: WideString;
    FcvpEdCliente: WideString;
    FcvpEdComplemento: WideString;
    FcvpEdNumero: WideString;
    FcvpNoCliente: WideString;
    FcvpNuCep: Int64;
    FdescricaoErro: WideString;
    FestSgEstado: WideString;
    FmonVarTarifaAdicional: Integer;
    FmonVarTarifaServico: Integer;
    FmonVarValorDescontos: Integer;
    FmonVarValorImposto: Integer;
    FprsCoProdutoServico: Int64;
    FpveNu: Int64;
    FpveOrgNuAgencia: Int64;
    FpveOrgNuAgenciaDes: Int64;
    FpveOrgNuAgenciaOri: Int64;
    FretornaCodErro: Integer;
    FsitNoSituacao: WideString;
    FtlgTxDescricao: WideString;
    FvapDhTransacao: TXSDateTime;
    FvapNuEtiquetaEncomenda: WideString;
    FvapVrCobradoEct: Double;
    FvapVrNominal: Double;
  public
    destructor Destroy; override;
  published
    property cidNoCidade: WideString read FcidNoCidade write FcidNoCidade;
    property ctcCoAadministrativo: WideString read FctcCoAadministrativo write FctcCoAadministrativo;
    property ctcNuContrato: Int64 read FctcNuContrato write FctcNuContrato;
    property ctcNuContratoEct: Int64 read FctcNuContratoEct write FctcNuContratoEct;
    property cvpEdBairro: WideString read FcvpEdBairro write FcvpEdBairro;
    property cvpEdCliente: WideString read FcvpEdCliente write FcvpEdCliente;
    property cvpEdComplemento: WideString read FcvpEdComplemento write FcvpEdComplemento;
    property cvpEdNumero: WideString read FcvpEdNumero write FcvpEdNumero;
    property cvpNoCliente: WideString read FcvpNoCliente write FcvpNoCliente;
    property cvpNuCep: Int64 read FcvpNuCep write FcvpNuCep;
    property descricaoErro: WideString read FdescricaoErro write FdescricaoErro;
    property estSgEstado: WideString read FestSgEstado write FestSgEstado;
    property monVarTarifaAdicional: Integer read FmonVarTarifaAdicional write FmonVarTarifaAdicional;
    property monVarTarifaServico: Integer read FmonVarTarifaServico write FmonVarTarifaServico;
    property monVarValorDescontos: Integer read FmonVarValorDescontos write FmonVarValorDescontos;
    property monVarValorImposto: Integer read FmonVarValorImposto write FmonVarValorImposto;
    property prsCoProdutoServico: Int64 read FprsCoProdutoServico write FprsCoProdutoServico;
    property pveNu: Int64 read FpveNu write FpveNu;
    property pveOrgNuAgencia: Int64 read FpveOrgNuAgencia write FpveOrgNuAgencia;
    property pveOrgNuAgenciaDes: Int64 read FpveOrgNuAgenciaDes write FpveOrgNuAgenciaDes;
    property pveOrgNuAgenciaOri: Int64 read FpveOrgNuAgenciaOri write FpveOrgNuAgenciaOri;
    property retornaCodErro: Integer read FretornaCodErro write FretornaCodErro;
    property sitNoSituacao: WideString read FsitNoSituacao write FsitNoSituacao;
    property tlgTxDescricao: WideString read FtlgTxDescricao write FtlgTxDescricao;
    property vapDhTransacao: TXSDateTime read FvapDhTransacao write FvapDhTransacao;
    property vapNuEtiquetaEncomenda: WideString read FvapNuEtiquetaEncomenda write FvapNuEtiquetaEncomenda;
    property vapVrCobradoEct: Double read FvapVrCobradoEct write FvapVrCobradoEct;
    property vapVrNominal: Double read FvapVrNominal write FvapVrNominal;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  buscaTarifaValeResponse = class(TRemotable)
  private
    Freturn: valePostal;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property return: valePostal read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  objetoSimplificado = class(TRemotable)
  private
    Fdatahora_cancelamento: WideString;
    Fnumero_pedido: Integer;
    Fstatus_pedido: WideString;
  published
    property datahora_cancelamento: WideString read Fdatahora_cancelamento write Fdatahora_cancelamento;
    property numero_pedido: Integer read Fnumero_pedido write Fnumero_pedido;
    property status_pedido: WideString read Fstatus_pedido write Fstatus_pedido;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  retornoCancelamento = class(TRemotable)
  private
    Fcod_erro: WideString;
    Fcodigo_administrativo: WideString;
    Fdata: WideString;
    Fhora: WideString;
    Fmsg_erro: WideString;
    Fobjeto_postal: objetoSimplificado;
  public
    destructor Destroy; override;
  published
    property cod_erro: WideString read Fcod_erro write Fcod_erro;
    property codigo_administrativo: WideString read Fcodigo_administrativo write Fcodigo_administrativo;
    property data: WideString read Fdata write Fdata;
    property hora: WideString read Fhora write Fhora;
    property msg_erro: WideString read Fmsg_erro write Fmsg_erro;
    property objeto_postal: objetoSimplificado read Fobjeto_postal write Fobjeto_postal;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  cancelarPedidoScolResponse = class(TRemotable)
  private
    Freturn: retornoCancelamento;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property return: retornoCancelamento read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  obterMensagemParametrizada = class(TRemotable)
  private
    Fid: Smallint;
  public
    constructor Create; override;
  published
    property id: Smallint read Fid write Fid;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  mensagemParametrizadaTO = class(TRemotable)
  private
    Fmensagem: WideString;
    Ftipo: tipoMensagem;
    Ftitulo: WideString;
  published
    property mensagem: WideString read Fmensagem write Fmensagem;
    property tipo: tipoMensagem read Ftipo write Ftipo;
    property titulo: WideString read Ftitulo write Ftitulo;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  obterMensagemParametrizadaResponse = class(TRemotable)
  private
    Freturn: mensagemParametrizadaTO;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property return: mensagemParametrizadaTO read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  medidaTO = class(TRemotable)
  private
    Fmaximo: TXSDecimal;
    Fminimo: TXSDecimal;
  public
    destructor Destroy; override;
  published
    property maximo: TXSDecimal read Fmaximo write Fmaximo;
    property minimo: TXSDecimal read Fminimo write Fminimo;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  dimensaoTO = class(TRemotable)
  private
    Faltura: medidaTO;
    Fcomprimento: medidaTO;
    Fdiametro: medidaTO;
    Flargura: medidaTO;
    Fpeso: medidaTO;
    Fsoma: medidaTO;
  public
    destructor Destroy; override;
  published
    property altura: medidaTO read Faltura write Faltura;
    property comprimento: medidaTO read Fcomprimento write Fcomprimento;
    property diametro: medidaTO read Fdiametro write Fdiametro;
    property largura: medidaTO read Flargura write Flargura;
    property peso: medidaTO read Fpeso write Fpeso;
    property soma: medidaTO read Fsoma write Fsoma;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  pesquisarParametrosPorDescricaoResponse = class(TRemotable)
  private
    Freturn: dimensaoTO;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property return: dimensaoTO read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  pesquisarDimensoesServicoResponse = class(TRemotable)
  private
    Freturn: dimensaoTO;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property return: dimensaoTO read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  servicoAdicionalTO = class(TRemotable)
  private
    Fcategoria: WideString;
    Fcodigo: WideString;
    Fsigla: WideString;
    Ftipo: WideString;
  published
    property categoria: WideString read Fcategoria write Fcategoria;
    property codigo: WideString read Fcodigo write Fcodigo;
    property sigla: WideString read Fsigla write Fsigla;
    property tipo: WideString read Ftipo write Ftipo;
  end;

  return     = array of servicoAdicionalTO;     { "http://cliente.bean.master.sigep.bsb.correios.com.br/" }


  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoInlineArrays,xoLiteralParam]
  // ************************************************************************ //
  buscaServicosAdicionaisAtivosResponse = class(TRemotable)
  private
    Freturn: return;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
    function   GetservicoAdicionalTOArrayLength: Integer;
    property   servicoAdicionalTOArray[Index: Integer]: servicoAdicionalTO read GetservicoAdicionalTOArray; default;
    property   Len: Integer read GetservicoAdicionalTOArrayLength;
  published
    property return: return read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoInlineArrays,xoLiteralParam]
  // ************************************************************************ //
  buscaServicosResponse = class(TRemotable)
  private
    Freturn: return;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
    function   GetservicoAdicionalTOArrayLength: Integer;
    property   servicoAdicionalTOArray[Index: Integer]: servicoAdicionalTO read GetservicoAdicionalTOArray; default;
    property   Len: Integer read GetservicoAdicionalTOArrayLength;
  published
    property return: return read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoInlineArrays,xoLiteralParam]
  // ************************************************************************ //
  buscaServicosValorDeclaradoResponse = class(TRemotable)
  private
    Freturn: return;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
    function   GetservicoAdicionalTOArrayLength: Integer;
    property   servicoAdicionalTOArray[Index: Integer]: servicoAdicionalTO read GetservicoAdicionalTOArray; default;
    property   Len: Integer read GetservicoAdicionalTOArrayLength;
  published
    property return: return read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoInlineArrays,xoLiteralParam]
  // ************************************************************************ //
  buscaServicosXServicosAdicionaisResponse = class(TRemotable)
  private
    Freturn: return;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
    function   GetservicoAdicionalTOArrayLength: Integer;
    property   servicoAdicionalTOArray[Index: Integer]: servicoAdicionalTO read GetservicoAdicionalTOArray; default;
    property   Len: Integer read GetservicoAdicionalTOArrayLength;
  published
    property return: return read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoInlineArrays,xoLiteralParam]
  // ************************************************************************ //
  geraDigitoVerificadorEtiquetasResponse = class(TRemotable)
  private
    Freturn: return;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
    function   GetservicoAdicionalTOArrayLength: Integer;
    property   servicoAdicionalTOArray[Index: Integer]: servicoAdicionalTO read GetservicoAdicionalTOArray; default;
    property   Len: Integer read GetservicoAdicionalTOArrayLength;
  published
    property return: return read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoInlineArrays,xoLiteralParam]
  // ************************************************************************ //
  obterEmbalagemLRSResponse = class(TRemotable)
  private
    Freturn: return;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
    function   GetservicoAdicionalTOArrayLength: Integer;
    property   servicoAdicionalTOArray[Index: Integer]: servicoAdicionalTO read GetservicoAdicionalTOArray; default;
    property   Len: Integer read GetservicoAdicionalTOArrayLength;
  published
    property return: return read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoInlineArrays,xoLiteralParam]
  // ************************************************************************ //
  pesquisarEmbalagensPorServicoResponse = class(TRemotable)
  private
    Freturn: return;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
    function   GetservicoAdicionalTOArrayLength: Integer;
    property   servicoAdicionalTOArray[Index: Integer]: servicoAdicionalTO read GetservicoAdicionalTOArray; default;
    property   Len: Integer read GetservicoAdicionalTOArrayLength;
  published
    property return: return read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoInlineArrays,xoLiteralParam]
  // ************************************************************************ //
  pesquisarServicosAdicionaisResponse = class(TRemotable)
  private
    Freturn: return;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
    function   GetservicoAdicionalTOArrayLength: Integer;
    property   servicoAdicionalTOArray[Index: Integer]: servicoAdicionalTO read GetservicoAdicionalTOArray; default;
    property   Len: Integer read GetservicoAdicionalTOArrayLength;
  published
    property return: return read Freturn write Freturn;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  objeto = class(TRemotable)
  private
    Fdesc: WideString;
    Fentrega: WideString;
    Fid: WideString;
    Fitem: WideString;
    Fnum: WideString;
  published
    property desc: WideString read Fdesc write Fdesc;
    property entrega: WideString read Fentrega write Fentrega;
    property id: WideString read Fid write Fid;
    property item: WideString read Fitem write Fitem;
    property num: WideString read Fnum write Fnum;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  produto = class(TRemotable)
  private
    Fcodigo: WideString;
    Fqtd: WideString;
    Ftipo: WideString;
  published
    property codigo: WideString read Fcodigo write Fcodigo;
    property qtd: WideString read Fqtd write Fqtd;
    property tipo: WideString read Ftipo write Ftipo;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  pessoa = class(TRemotable)
  private
    Fbairro: WideString;
    Fcep: WideString;
    Fcidade: WideString;
    Fcomplemento: WideString;
    Fddd: WideString;
    Femail: WideString;
    Flogradouro: WideString;
    Fnome: WideString;
    Fnumero: WideString;
    Freferencia: WideString;
    Ftelefone: WideString;
    Fuf: WideString;
  published
    property bairro: WideString read Fbairro write Fbairro;
    property cep: WideString read Fcep write Fcep;
    property cidade: WideString read Fcidade write Fcidade;
    property complemento: WideString read Fcomplemento write Fcomplemento;
    property ddd: WideString read Fddd write Fddd;
    property email: WideString read Femail write Femail;
    property logradouro: WideString read Flogradouro write Flogradouro;
    property nome: WideString read Fnome write Fnome;
    property numero: WideString read Fnumero write Fnumero;
    property referencia: WideString read Freferencia write Freferencia;
    property telefone: WideString read Ftelefone write Ftelefone;
    property uf: WideString read Fuf write Fuf;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  remetente = class(pessoa)
  private
    Fcelular: WideString;
    Fddd_celular: WideString;
    Fidentificacao: WideString;
    Fsms: WideString;
  published
    property celular: WideString read Fcelular write Fcelular;
    property ddd_celular: WideString read Fddd_celular write Fddd_celular;
    property identificacao: WideString read Fidentificacao write Fidentificacao;
    property sms: WideString read Fsms write Fsms;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  coleta = class(TRemotable)
  private
    Fcklist: WideString;
    Fdescricao: WideString;
    Fdocumento: WideString;
    Fid_cliente: WideString;
    Fproduto: produto;
    Fremetente: remetente;
    Ftipo: WideString;
    Fvalor_declarado: WideString;
  public
    destructor Destroy; override;
  published
    property cklist: WideString read Fcklist write Fcklist;
    property descricao: WideString read Fdescricao write Fdescricao;
    property documento: WideString read Fdocumento write Fdocumento;
    property id_cliente: WideString read Fid_cliente write Fid_cliente;
    property produto: produto read Fproduto write Fproduto;
    property remetente: remetente read Fremetente write Fremetente;
    property tipo: WideString read Ftipo write Ftipo;
    property valor_declarado: WideString read Fvalor_declarado write Fvalor_declarado;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  coletaReversa = class(coleta)
  private
    Fag: WideString;
    Far: Integer;
    Fcartao: WideString;
    Fnumero: Integer;
    Fobj_col: objeto;
    Fservico_adicional: WideString;
  public
    destructor Destroy; override;
  published
    property ag: WideString read Fag write Fag;
    property ar: Integer read Far write Far;
    property cartao: WideString read Fcartao write Fcartao;
    property numero: Integer read Fnumero write Fnumero;
    property obj_col: objeto read Fobj_col write Fobj_col;
    property servico_adicional: WideString read Fservico_adicional write Fservico_adicional;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  validarPostagemReversa = class(TRemotable)
  private
    FcodAdministrativo: WideString;
    FcodigoServico: WideString;
    FcepDestinatario: WideString;
    FidCartaoPostagem: WideString;
    Fcoleta: coletaReversa;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property codAdministrativo: WideString read FcodAdministrativo write FcodAdministrativo;
    property codigoServico: WideString read FcodigoServico write FcodigoServico;
    property cepDestinatario: WideString read FcepDestinatario write FcepDestinatario;
    property idCartaoPostagem: WideString read FidCartaoPostagem write FidCartaoPostagem;
    property coleta: coletaReversa read Fcoleta write Fcoleta;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // ************************************************************************ //
  coletaSimultanea = class(coleta)
  private
    Fobj: WideString;
    Fobs: WideString;
  published
    property obj: WideString read Fobj write Fobj;
    property obs: WideString read Fobs write Fobs;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  validarPostagemSimultanea = class(TRemotable)
  private
    FcodAdministrativo: Integer;
    FcodigoServico: Integer;
    FidCartaoPostagem: WideString;
    FcepDestinatario: WideString;
    Fcoleta: coletaSimultanea;
    Fusuario: WideString;
    Fsenha: WideString;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property codAdministrativo: Integer read FcodAdministrativo write FcodAdministrativo;
    property codigoServico: Integer read FcodigoServico write FcodigoServico;
    property idCartaoPostagem: WideString read FidCartaoPostagem write FidCartaoPostagem;
    property cepDestinatario: WideString read FcepDestinatario write FcepDestinatario;
    property coleta: coletaSimultanea read Fcoleta write Fcoleta;
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoSimpleTypeWrapper]
  // ************************************************************************ //
  SigepClienteException = class(ERemotableException)
  private
    FValue: WideString;
  published
    property Value: WideString read FValue write FValue;
  end;



  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // Serializtn: [xoSimpleTypeWrapper]
  // ************************************************************************ //
  AutenticacaoException = class(ERemotableException)
  private
    FValue: WideString;
  published
    property Value: WideString read FValue write FValue;
  end;


  // ************************************************************************ //
  // Namespace : http://cliente.bean.master.sigep.bsb.correios.com.br/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : AtendeClienteServiceSoapBinding
  // service   : AtendeClienteService
  // port      : AtendeClientePort
  // URL       : https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente
  // ************************************************************************ //
  AtendeCliente = interface(IInvokable)
  ['{06395354-FEDE-FDC9-368D-51C37A49D0E0}']
    function  buscaServicosAdicionaisAtivos(const parameters: buscaServicosAdicionaisAtivos): buscaServicosAdicionaisAtivosResponse; stdcall;
    function  fechaPlp(const parameters: fechaPlp): fechaPlpResponse; stdcall;
    function  calculaTarifaServico(const parameters: calculaTarifaServico): calculaTarifaServicoResponse; stdcall;
    function  validaPlp(const parameters: validaPlp): validaPlpResponse; stdcall;
    function  VerificaSeTodosObjetosCancelados(const parameters: VerificaSeTodosObjetosCancelados): VerificaSeTodosObjetosCanceladosResponse; stdcall;
    function  cancelarObjeto(const parameters: cancelarObjeto): cancelarObjetoResponse; stdcall;
    function  pesquisarParametrosPorDescricao(const parameters: pesquisarParametrosPorDescricao): pesquisarParametrosPorDescricaoResponse; stdcall;
    function  atualizaPagamentoNaEntrega(const parameters: atualizaPagamentoNaEntrega): atualizaPagamentoNaEntregaResponse; stdcall;
    function  obterClienteAtualizacao(const parameters: obterClienteAtualizacao): obterClienteAtualizacaoResponse; stdcall;
    function  verificaDisponibilidadeServico(const parameters: verificaDisponibilidadeServico): verificaDisponibilidadeServicoResponse; stdcall;
    function  fechaPlpVariosServicos(const parameters: fechaPlpVariosServicos): fechaPlpVariosServicosResponse; stdcall;
    function  geraDigitoVerificadorEtiquetas(const parameters: geraDigitoVerificadorEtiquetas): geraDigitoVerificadorEtiquetasResponse; stdcall;
    function  obterEmbalagemLRS(const parameters: obterEmbalagemLRS): obterEmbalagemLRSResponse; stdcall;
    function  validaEtiquetaPLP(const parameters: validaEtiquetaPLP): validaEtiquetaPLPResponse; stdcall;
    function  buscaServicosValorDeclarado(const parameters: buscaServicosValorDeclarado): buscaServicosValorDeclaradoResponse; stdcall;
    function  consultaCEP(const parameters: consultaCEP): consultaCEPResponse; stdcall;
    function  integrarUsuarioScol(const parameters: integrarUsuarioScol): integrarUsuarioScolResponse; stdcall;
    function  pesquisarDimensoesServico(const parameters: pesquisarDimensoesServico): pesquisarDimensoesServicoResponse; stdcall;
    function  pesquisarEmbalagensPorServico(const parameters: pesquisarEmbalagensPorServico): pesquisarEmbalagensPorServicoResponse; stdcall;
    function  atualizaRemessaAgrupada(const parameters: atualizaRemessaAgrupada): atualizaRemessaAgrupadaResponse; stdcall;
    function  solicitaPLP(const parameters: solicitaPLP): solicitaPLPResponse; stdcall;
    function  getStatusCartaoPostagem(const parameters: getStatusCartaoPostagem): getStatusCartaoPostagemResponse; stdcall;
    function  verificaModalTransporte(const parameters: verificaModalTransporte): verificaModalTransporteResponse; stdcall;
    function  buscaDataAtual(const parameters: buscaDataAtual): buscaDataAtualResponse; stdcall;
    function  buscaTarifaVale(const parameters: buscaTarifaVale): buscaTarifaValeResponse; stdcall;
    function  validarPostagemSimultanea(const parameters: validarPostagemSimultanea): validarPostagemSimultaneaResponse; stdcall;
    function  getStatusPLP(const parameters: getStatusPLP): getStatusPLPResponse; stdcall;
    function  pesquisarServicosAdicionais(const parameters: pesquisarServicosAdicionais): pesquisarServicosAdicionaisResponse; stdcall;
    function  buscaServicosXServicosAdicionais(const parameters: buscaServicosXServicosAdicionais): buscaServicosXServicosAdicionaisResponse; stdcall;
    function  cancelarPedidoScol(const parameters: cancelarPedidoScol): cancelarPedidoScolResponse; stdcall;
    function  bloquearObjeto(const parameters: bloquearObjeto): bloquearObjetoResponse; stdcall;
    function  buscaContrato(const parameters: buscaContrato): buscaContratoResponse; stdcall;
    function  solicitaEtiquetas(const parameters: solicitaEtiquetas): solicitaEtiquetasResponse; stdcall;
    function  solicitaXmlPlp(const parameters: solicitaXmlPlp): solicitaXmlPlpResponse; stdcall;
    function  validarPostagemReversa(const parameters: validarPostagemReversa): validarPostagemReversaResponse; stdcall;
    function  buscaCliente(const parameters: buscaCliente): buscaClienteResponse; stdcall;
    function  buscaPagamentoEntrega(const parameters: buscaPagamentoEntrega): buscaPagamentoEntregaResponse; stdcall;
    function  solicitarPostagemScol(const parameters: solicitarPostagemScol): solicitarPostagemScolResponse; stdcall;
    function  buscaServicos(const parameters: buscaServicos): buscaServicosResponse; stdcall;
    function  obterMensagemParametrizada(const parameters: obterMensagemParametrizada): obterMensagemParametrizadaResponse; stdcall;
    function  buscaOpcoes(const parameters: buscaOpcoes): buscaOpcoesResponse; stdcall;
  end;

function GetAtendeCliente(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): AtendeCliente;


implementation

function GetAtendeCliente(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): AtendeCliente;
const
  defWSDL = 'https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl';
  defURL  = 'https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente';
  defSvc  = 'AtendeClienteService';
  defPrt  = 'AtendeClientePort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as AtendeCliente);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


constructor buscaDataAtual.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor getStatusCartaoPostagemResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor getStatusPLPResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor obterEmbalagemLRS.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor verificaModalTransporteResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor verificaModalTransporte.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor verificaDisponibilidadeServicoResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor solicitarPostagemScolResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor solicitaXmlPlpResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor solicitaPLPResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor solicitaEtiquetasResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor pesquisarServicosAdicionais.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor pesquisarParametrosPorDescricao.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor pesquisarEmbalagensPorServico.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor pesquisarDimensoesServico.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor obterClienteAtualizacao.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor getStatusCartaoPostagem.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor geraDigitoVerificadorEtiquetas.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor consultaCEP.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor cancelarPedidoScol.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor calculaTarifaServicoResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor buscaServicosXServicosAdicionais.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor buscaServicosValorDeclarado.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor buscaServicosAdicionaisAtivos.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor buscaServicos.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor buscaPagamentoEntregaResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor buscaPagamentoEntrega.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor buscaOpcoesResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor buscaOpcoes.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor buscaCliente.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor bloquearObjetoResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor atualizaRemessaAgrupadaResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor atualizaRemessaAgrupada.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor atualizaPagamentoNaEntregaResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor atualizaPagamentoNaEntrega.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor obterClienteAtualizacaoResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor obterClienteAtualizacaoResponse.Destroy;
begin
  if Assigned(Freturn) then
    Freturn.Free;
  inherited Destroy;
end;

constructor buscaDataAtualResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor buscaDataAtualResponse.Destroy;
begin
  if Assigned(Freturn) then
    Freturn.Free;
  inherited Destroy;
end;

constructor validaPlp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor validaEtiquetaPLP.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor solicitaXmlPlp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor solicitaPLP.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor fechaPlpVariosServicosResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor fechaPlpVariosServicos.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor fechaPlpResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor fechaPlp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor cancelarObjeto.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor buscaContrato.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor bloquearObjeto.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor verificaDisponibilidadeServico.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor solicitarPostagemScol.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor solicitaEtiquetas.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor integrarUsuarioScol.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor unidadePostagemERP.Destroy;
begin
  if Assigned(Fendereco) then
    Fendereco.Free;
  inherited Destroy;
end;

destructor enderecoERP.Destroy;
begin
  if Assigned(FunidadesPostagem) then
    FunidadesPostagem.Free;
  inherited Destroy;
end;

constructor consultaCEPResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor consultaCEPResponse.Destroy;
begin
  if Assigned(Freturn) then
    Freturn.Free;
  inherited Destroy;
end;

destructor vigenciaERP.Destroy;
begin
  if Assigned(FdataFinal) then
    FdataFinal.Free;
  if Assigned(FdataInicial) then
    FdataInicial.Free;
  inherited Destroy;
end;

constructor validarPostagemSimultaneaResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor validarPostagemReversaResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor validaPlpResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor validaEtiquetaPLPResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor integrarUsuarioScolResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor cancelarObjetoResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor VerificaSeTodosObjetosCanceladosResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor servicoAdicionalERP.Destroy;
begin
  if Assigned(FdataAtualizacao) then
    FdataAtualizacao.Free;
  if Assigned(FvalorDeclarado) then
    FvalorDeclarado.Free;
  inherited Destroy;
end;

destructor servicoSigep.Destroy;
begin
  if Assigned(Fchancela) then
    Fchancela.Free;
  if Assigned(FservicoERP) then
    FservicoERP.Free;
  inherited Destroy;
end;

destructor chancelaMaster.Destroy;
begin
  if Assigned(FdataAtualizacao) then
    FdataAtualizacao.Free;
  if Assigned(FservicosSigep) then
    FservicosSigep.Free;
  inherited Destroy;
end;

destructor servicoERP.Destroy;
begin
  if Assigned(FdataAtualizacao) then
    FdataAtualizacao.Free;
  if Assigned(FservicoSigep) then
    FservicoSigep.Free;
  if Assigned(FservicosAdicionais) then
    FservicosAdicionais.Free;
  if Assigned(Fvigencia) then
    Fvigencia.Free;
  inherited Destroy;
end;

destructor contratoERP.Destroy;
begin
  if Assigned(FcartoesPostagem) then
    FcartoesPostagem.Free;
  if Assigned(Fcliente) then
    Fcliente.Free;
  if Assigned(FcontratoPK) then
    FcontratoPK.Free;
  if Assigned(FdataAtualizacao) then
    FdataAtualizacao.Free;
  if Assigned(FdataVigenciaFim) then
    FdataVigenciaFim.Free;
  if Assigned(FdataVigenciaInicio) then
    FdataVigenciaInicio.Free;
  if Assigned(FdiretoriaRegional) then
    FdiretoriaRegional.Free;
  inherited Destroy;
end;

destructor cartaoPostagemERP.Destroy;
begin
  if Assigned(Fcontratos) then
    Fcontratos.Free;
  if Assigned(FdataAtualizacao) then
    FdataAtualizacao.Free;
  if Assigned(FdataVigenciaFim) then
    FdataVigenciaFim.Free;
  if Assigned(FdataVigenciaInicio) then
    FdataVigenciaInicio.Free;
  if Assigned(Fservicos) then
    Fservicos.Free;
  if Assigned(FunidadesPostagem) then
    FunidadesPostagem.Free;
  inherited Destroy;
end;

destructor gerenteConta2.Destroy;
begin
  if Assigned(FclientesVisiveis) then
    FclientesVisiveis.Free;
  if Assigned(FdataAtualizacao) then
    FdataAtualizacao.Free;
  if Assigned(FdataInclusao) then
    FdataInclusao.Free;
  if Assigned(FdataSenha) then
    FdataSenha.Free;
  if Assigned(FusuariosInstalacao) then
    FusuariosInstalacao.Free;
  inherited Destroy;
end;

destructor clienteERP.Destroy;
begin
  if Assigned(Fcontratos) then
    Fcontratos.Free;
  if Assigned(FdataAtualizacao) then
    FdataAtualizacao.Free;
  if Assigned(FgerenteConta) then
    FgerenteConta.Free;
  inherited Destroy;
end;

destructor usuarioInstalacao.Destroy;
begin
  if Assigned(FdataAtualizacao) then
    FdataAtualizacao.Free;
  if Assigned(FdataInclusao) then
    FdataInclusao.Free;
  if Assigned(FdataSenha) then
    FdataSenha.Free;
  if Assigned(FgerenteMaster) then
    FgerenteMaster.Free;
  if Assigned(Fparametros) then
    Fparametros.Free;
  inherited Destroy;
end;

constructor buscaClienteResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor buscaClienteResponse.Destroy;
begin
  if Assigned(Freturn) then
    Freturn.Free;
  inherited Destroy;
end;

constructor buscaContratoResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor buscaContratoResponse.Destroy;
begin
  if Assigned(Freturn) then
    Freturn.Free;
  inherited Destroy;
end;

destructor preListaPostagem.Destroy;
begin
  if Assigned(FcartaoPostagem) then
    FcartaoPostagem.Free;
  if Assigned(FdataAtualizacaoCliente) then
    FdataAtualizacaoCliente.Free;
  if Assigned(FdataAtualizacaoSara) then
    FdataAtualizacaoSara.Free;
  if Assigned(FdataFechamento) then
    FdataFechamento.Free;
  if Assigned(FdataPostagem) then
    FdataPostagem.Free;
  if Assigned(FdataPostagemSara) then
    FdataPostagemSara.Free;
  if Assigned(FobjetosPostais) then
    FobjetosPostais.Free;
  inherited Destroy;
end;

destructor objetoPostal.Destroy;
begin
  if Assigned(FdataAtualizacaoCliente) then
    FdataAtualizacaoCliente.Free;
  if Assigned(FdataBloqueioObjeto) then
    FdataBloqueioObjeto.Free;
  if Assigned(FdataCancelamentoEtiqueta) then
    FdataCancelamentoEtiqueta.Free;
  if Assigned(FdataInclusao) then
    FdataInclusao.Free;
  if Assigned(FobjetoPostalPK) then
    FobjetoPostalPK.Free;
  if Assigned(FpreListaPostagem) then
    FpreListaPostagem.Free;
  inherited Destroy;
end;

constructor getStatusPLP.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor getStatusPLP.Destroy;
begin
  if Assigned(Farg0) then
    Farg0.Free;
  inherited Destroy;
end;

constructor VerificaSeTodosObjetosCancelados.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays,xoLiteralParam];
end;

destructor VerificaSeTodosObjetosCancelados.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Farg0)-1 do
    if Assigned(Farg0[I]) then
      Farg0[I].Free;
  SetLength(Farg0, 0);
  inherited Destroy;
end;

function VerificaSeTodosObjetosCancelados.GetobjetoPostalArray(Index: Integer): objetoPostal;
begin
  Result := Farg0[Index];
end;

function VerificaSeTodosObjetosCancelados.GetobjetoPostalArrayLength: Integer;
begin
  if Assigned(Farg0) then
    Result := Length(Farg0)
  else
  Result := 0;
end;

constructor calculaTarifaServico.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor buscaTarifaVale.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor valePostal.Destroy;
begin
  if Assigned(FvapDhTransacao) then
    FvapDhTransacao.Free;
  inherited Destroy;
end;

constructor buscaTarifaValeResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor buscaTarifaValeResponse.Destroy;
begin
  if Assigned(Freturn) then
    Freturn.Free;
  inherited Destroy;
end;

destructor retornoCancelamento.Destroy;
begin
  if Assigned(Fobjeto_postal) then
    Fobjeto_postal.Free;
  inherited Destroy;
end;

constructor cancelarPedidoScolResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor cancelarPedidoScolResponse.Destroy;
begin
  if Assigned(Freturn) then
    Freturn.Free;
  inherited Destroy;
end;

constructor obterMensagemParametrizada.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor obterMensagemParametrizadaResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor obterMensagemParametrizadaResponse.Destroy;
begin
  if Assigned(Freturn) then
    Freturn.Free;
  inherited Destroy;
end;

destructor medidaTO.Destroy;
begin
  if Assigned(Fmaximo) then
    Fmaximo.Free;
  if Assigned(Fminimo) then
    Fminimo.Free;
  inherited Destroy;
end;

destructor dimensaoTO.Destroy;
begin
  if Assigned(Faltura) then
    Faltura.Free;
  if Assigned(Fcomprimento) then
    Fcomprimento.Free;
  if Assigned(Fdiametro) then
    Fdiametro.Free;
  if Assigned(Flargura) then
    Flargura.Free;
  if Assigned(Fpeso) then
    Fpeso.Free;
  if Assigned(Fsoma) then
    Fsoma.Free;
  inherited Destroy;
end;

constructor pesquisarParametrosPorDescricaoResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor pesquisarParametrosPorDescricaoResponse.Destroy;
begin
  if Assigned(Freturn) then
    Freturn.Free;
  inherited Destroy;
end;

constructor pesquisarDimensoesServicoResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor pesquisarDimensoesServicoResponse.Destroy;
begin
  if Assigned(Freturn) then
    Freturn.Free;
  inherited Destroy;
end;

constructor buscaServicosAdicionaisAtivosResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays,xoLiteralParam];
end;

destructor buscaServicosAdicionaisAtivosResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Freturn)-1 do
    if Assigned(Freturn[I]) then
      Freturn[I].Free;
  SetLength(Freturn, 0);
  inherited Destroy;
end;

function buscaServicosAdicionaisAtivosResponse.GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
begin
  Result := Freturn[Index];
end;

function buscaServicosAdicionaisAtivosResponse.GetservicoAdicionalTOArrayLength: Integer;
begin
  if Assigned(Freturn) then
    Result := Length(Freturn)
  else
  Result := 0;
end;

constructor buscaServicosResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays,xoLiteralParam];
end;

destructor buscaServicosResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Freturn)-1 do
    if Assigned(Freturn[I]) then
      Freturn[I].Free;
  SetLength(Freturn, 0);
  inherited Destroy;
end;

function buscaServicosResponse.GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
begin
  Result := Freturn[Index];
end;

function buscaServicosResponse.GetservicoAdicionalTOArrayLength: Integer;
begin
  if Assigned(Freturn) then
    Result := Length(Freturn)
  else
  Result := 0;
end;

constructor buscaServicosValorDeclaradoResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays,xoLiteralParam];
end;

destructor buscaServicosValorDeclaradoResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Freturn)-1 do
    if Assigned(Freturn[I]) then
      Freturn[I].Free;
  SetLength(Freturn, 0);
  inherited Destroy;
end;

function buscaServicosValorDeclaradoResponse.GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
begin
  Result := Freturn[Index];
end;

function buscaServicosValorDeclaradoResponse.GetservicoAdicionalTOArrayLength: Integer;
begin
  if Assigned(Freturn) then
    Result := Length(Freturn)
  else
  Result := 0;
end;

constructor buscaServicosXServicosAdicionaisResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays,xoLiteralParam];
end;

destructor buscaServicosXServicosAdicionaisResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Freturn)-1 do
    if Assigned(Freturn[I]) then
      Freturn[I].Free;
  SetLength(Freturn, 0);
  inherited Destroy;
end;

function buscaServicosXServicosAdicionaisResponse.GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
begin
  Result := Freturn[Index];
end;

function buscaServicosXServicosAdicionaisResponse.GetservicoAdicionalTOArrayLength: Integer;
begin
  if Assigned(Freturn) then
    Result := Length(Freturn)
  else
  Result := 0;
end;

constructor geraDigitoVerificadorEtiquetasResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays,xoLiteralParam];
end;

destructor geraDigitoVerificadorEtiquetasResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Freturn)-1 do
    if Assigned(Freturn[I]) then
      Freturn[I].Free;
  SetLength(Freturn, 0);
  inherited Destroy;
end;

function geraDigitoVerificadorEtiquetasResponse.GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
begin
  Result := Freturn[Index];
end;

function geraDigitoVerificadorEtiquetasResponse.GetservicoAdicionalTOArrayLength: Integer;
begin
  if Assigned(Freturn) then
    Result := Length(Freturn)
  else
  Result := 0;
end;

constructor obterEmbalagemLRSResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays,xoLiteralParam];
end;

destructor obterEmbalagemLRSResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Freturn)-1 do
    if Assigned(Freturn[I]) then
      Freturn[I].Free;
  SetLength(Freturn, 0);
  inherited Destroy;
end;

function obterEmbalagemLRSResponse.GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
begin
  Result := Freturn[Index];
end;

function obterEmbalagemLRSResponse.GetservicoAdicionalTOArrayLength: Integer;
begin
  if Assigned(Freturn) then
    Result := Length(Freturn)
  else
  Result := 0;
end;

constructor pesquisarEmbalagensPorServicoResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays,xoLiteralParam];
end;

destructor pesquisarEmbalagensPorServicoResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Freturn)-1 do
    if Assigned(Freturn[I]) then
      Freturn[I].Free;
  SetLength(Freturn, 0);
  inherited Destroy;
end;

function pesquisarEmbalagensPorServicoResponse.GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
begin
  Result := Freturn[Index];
end;

function pesquisarEmbalagensPorServicoResponse.GetservicoAdicionalTOArrayLength: Integer;
begin
  if Assigned(Freturn) then
    Result := Length(Freturn)
  else
  Result := 0;
end;

constructor pesquisarServicosAdicionaisResponse.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays,xoLiteralParam];
end;

destructor pesquisarServicosAdicionaisResponse.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Freturn)-1 do
    if Assigned(Freturn[I]) then
      Freturn[I].Free;
  SetLength(Freturn, 0);
  inherited Destroy;
end;

function pesquisarServicosAdicionaisResponse.GetservicoAdicionalTOArray(Index: Integer): servicoAdicionalTO;
begin
  Result := Freturn[Index];
end;

function pesquisarServicosAdicionaisResponse.GetservicoAdicionalTOArrayLength: Integer;
begin
  if Assigned(Freturn) then
    Result := Length(Freturn)
  else
  Result := 0;
end;

destructor coleta.Destroy;
begin
  if Assigned(Fproduto) then
    Fproduto.Free;
  if Assigned(Fremetente) then
    Fremetente.Free;
  inherited Destroy;
end;

destructor coletaReversa.Destroy;
begin
  if Assigned(Fobj_col) then
    Fobj_col.Free;
  inherited Destroy;
end;

constructor validarPostagemReversa.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor validarPostagemReversa.Destroy;
begin
  if Assigned(Fcoleta) then
    Fcoleta.Free;
  inherited Destroy;
end;

constructor validarPostagemSimultanea.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor validarPostagemSimultanea.Destroy;
begin
  if Assigned(Fcoleta) then
    Fcoleta.Free;
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(AtendeCliente), 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(AtendeCliente), '');
//  InvRegistry.RegisterInvokeOptions(TypeInfo(AtendeCliente), ioDocument);
  InvRegistry.RegisterInvokeOptions(TypeInfo(AtendeCliente), ioHasAllSOAPActions);
  InvRegistry.RegisterInvokeOptions(TypeInfo(AtendeCliente), ioLiteral);
  RemClassRegistry.RegisterXSInfo(TypeInfo(statusGerente), 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'statusGerente');
  RemClassRegistry.RegisterXSInfo(TypeInfo(tipoGerente), 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'tipoGerente');
  RemClassRegistry.RegisterXSInfo(TypeInfo(statusUsuario), 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'statusUsuario');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(statusUsuario), 'Ativo2', 'Ativo');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(statusUsuario), 'Inativo2', 'Inativo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(categoriaServico), 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'categoriaServico');
  RemClassRegistry.RegisterXSInfo(TypeInfo(simNao), 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'simNao');
  RemClassRegistry.RegisterXSInfo(TypeInfo(statusPlp), 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'statusPlp');
  RemClassRegistry.RegisterXSInfo(TypeInfo(statusObjetoPostal), 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'statusObjetoPostal');
  RemClassRegistry.RegisterXSInfo(TypeInfo(statusCartao), 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'statusCartao');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(statusCartao), 'Cancelado2', 'Cancelado');
  RemClassRegistry.RegisterXSInfo(TypeInfo(tipoBloqueio), 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'tipoBloqueio');
  RemClassRegistry.RegisterXSInfo(TypeInfo(acao), 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'acao');
  RemClassRegistry.RegisterXSInfo(TypeInfo(tipoMensagem), 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'tipoMensagem');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(tipoMensagem), 'S2', 'S');
  RemClassRegistry.RegisterXSClass(buscaDataAtual, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaDataAtual');
  RemClassRegistry.RegisterSerializeOptions(buscaDataAtual, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(getStatusCartaoPostagemResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'getStatusCartaoPostagemResponse');
  RemClassRegistry.RegisterSerializeOptions(getStatusCartaoPostagemResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(getStatusPLPResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'getStatusPLPResponse');
  RemClassRegistry.RegisterSerializeOptions(getStatusPLPResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(obterEmbalagemLRS, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'obterEmbalagemLRS');
  RemClassRegistry.RegisterSerializeOptions(obterEmbalagemLRS, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(verificaModalTransporteResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'verificaModalTransporteResponse');
  RemClassRegistry.RegisterSerializeOptions(verificaModalTransporteResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(verificaModalTransporte, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'verificaModalTransporte');
  RemClassRegistry.RegisterSerializeOptions(verificaModalTransporte, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(verificaDisponibilidadeServicoResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'verificaDisponibilidadeServicoResponse');
  RemClassRegistry.RegisterSerializeOptions(verificaDisponibilidadeServicoResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(solicitarPostagemScolResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'solicitarPostagemScolResponse');
  RemClassRegistry.RegisterSerializeOptions(solicitarPostagemScolResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(solicitaXmlPlpResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'solicitaXmlPlpResponse');
  RemClassRegistry.RegisterSerializeOptions(solicitaXmlPlpResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(solicitaPLPResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'solicitaPLPResponse');
  RemClassRegistry.RegisterSerializeOptions(solicitaPLPResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(solicitaEtiquetasResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'solicitaEtiquetasResponse');
  RemClassRegistry.RegisterSerializeOptions(solicitaEtiquetasResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(pesquisarServicosAdicionais, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'pesquisarServicosAdicionais');
  RemClassRegistry.RegisterSerializeOptions(pesquisarServicosAdicionais, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(pesquisarParametrosPorDescricao, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'pesquisarParametrosPorDescricao');
  RemClassRegistry.RegisterSerializeOptions(pesquisarParametrosPorDescricao, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(pesquisarEmbalagensPorServico, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'pesquisarEmbalagensPorServico');
  RemClassRegistry.RegisterSerializeOptions(pesquisarEmbalagensPorServico, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(pesquisarDimensoesServico, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'pesquisarDimensoesServico');
  RemClassRegistry.RegisterSerializeOptions(pesquisarDimensoesServico, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(obterClienteAtualizacao, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'obterClienteAtualizacao');
  RemClassRegistry.RegisterSerializeOptions(obterClienteAtualizacao, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(getStatusCartaoPostagem, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'getStatusCartaoPostagem');
  RemClassRegistry.RegisterSerializeOptions(getStatusCartaoPostagem, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(geraDigitoVerificadorEtiquetas, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'geraDigitoVerificadorEtiquetas');
  RemClassRegistry.RegisterSerializeOptions(geraDigitoVerificadorEtiquetas, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(consultaCEP, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'consultaCEP');
  RemClassRegistry.RegisterSerializeOptions(consultaCEP, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(cancelarPedidoScol, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'cancelarPedidoScol');
  RemClassRegistry.RegisterSerializeOptions(cancelarPedidoScol, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(calculaTarifaServicoResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'calculaTarifaServicoResponse');
  RemClassRegistry.RegisterSerializeOptions(calculaTarifaServicoResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaServicosXServicosAdicionais, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaServicosXServicosAdicionais');
  RemClassRegistry.RegisterSerializeOptions(buscaServicosXServicosAdicionais, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaServicosValorDeclarado, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaServicosValorDeclarado');
  RemClassRegistry.RegisterSerializeOptions(buscaServicosValorDeclarado, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaServicosAdicionaisAtivos, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaServicosAdicionaisAtivos');
  RemClassRegistry.RegisterSerializeOptions(buscaServicosAdicionaisAtivos, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaServicos, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaServicos');
  RemClassRegistry.RegisterSerializeOptions(buscaServicos, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaPagamentoEntregaResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaPagamentoEntregaResponse');
  RemClassRegistry.RegisterSerializeOptions(buscaPagamentoEntregaResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaPagamentoEntrega, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaPagamentoEntrega');
  RemClassRegistry.RegisterSerializeOptions(buscaPagamentoEntrega, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaOpcoesResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaOpcoesResponse');
  RemClassRegistry.RegisterSerializeOptions(buscaOpcoesResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaOpcoes, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaOpcoes');
  RemClassRegistry.RegisterSerializeOptions(buscaOpcoes, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaCliente, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaCliente');
  RemClassRegistry.RegisterSerializeOptions(buscaCliente, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(bloquearObjetoResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'bloquearObjetoResponse');
  RemClassRegistry.RegisterSerializeOptions(bloquearObjetoResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(atualizaRemessaAgrupadaResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'atualizaRemessaAgrupadaResponse');
  RemClassRegistry.RegisterSerializeOptions(atualizaRemessaAgrupadaResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(atualizaRemessaAgrupada, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'atualizaRemessaAgrupada');
  RemClassRegistry.RegisterSerializeOptions(atualizaRemessaAgrupada, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(atualizaPagamentoNaEntregaResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'atualizaPagamentoNaEntregaResponse');
  RemClassRegistry.RegisterSerializeOptions(atualizaPagamentoNaEntregaResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(atualizaPagamentoNaEntrega, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'atualizaPagamentoNaEntrega');
  RemClassRegistry.RegisterSerializeOptions(atualizaPagamentoNaEntrega, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(Exception, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'Exception');
  RemClassRegistry.RegisterXSClass(ErroMontagemRelatorio, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'ErroMontagemRelatorio');
  RemClassRegistry.RegisterXSClass(obterClienteAtualizacaoResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'obterClienteAtualizacaoResponse');
  RemClassRegistry.RegisterSerializeOptions(obterClienteAtualizacaoResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaDataAtualResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaDataAtualResponse');
  RemClassRegistry.RegisterSerializeOptions(buscaDataAtualResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(objetoPostalPK, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'objetoPostalPK');
  RemClassRegistry.RegisterXSClass(validaPlp, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'validaPlp');
  RemClassRegistry.RegisterSerializeOptions(validaPlp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(validaEtiquetaPLP, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'validaEtiquetaPLP');
  RemClassRegistry.RegisterSerializeOptions(validaEtiquetaPLP, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(solicitaXmlPlp, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'solicitaXmlPlp');
  RemClassRegistry.RegisterSerializeOptions(solicitaXmlPlp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(solicitaPLP, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'solicitaPLP');
  RemClassRegistry.RegisterSerializeOptions(solicitaPLP, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(fechaPlpVariosServicosResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'fechaPlpVariosServicosResponse');
  RemClassRegistry.RegisterSerializeOptions(fechaPlpVariosServicosResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(fechaPlpVariosServicos, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'fechaPlpVariosServicos');
  RemClassRegistry.RegisterSerializeOptions(fechaPlpVariosServicos, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(fechaPlpResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'fechaPlpResponse');
  RemClassRegistry.RegisterSerializeOptions(fechaPlpResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(fechaPlp, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'fechaPlp');
  RemClassRegistry.RegisterSerializeOptions(fechaPlp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(cancelarObjeto, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'cancelarObjeto');
  RemClassRegistry.RegisterSerializeOptions(cancelarObjeto, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaContrato, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaContrato');
  RemClassRegistry.RegisterSerializeOptions(buscaContrato, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(bloquearObjeto, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'bloquearObjeto');
  RemClassRegistry.RegisterSerializeOptions(bloquearObjeto, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(SQLException, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'SQLException');
  RemClassRegistry.RegisterXSClass(verificaDisponibilidadeServico, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'verificaDisponibilidadeServico');
  RemClassRegistry.RegisterSerializeOptions(verificaDisponibilidadeServico, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(solicitarPostagemScol, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'solicitarPostagemScol');
  RemClassRegistry.RegisterSerializeOptions(solicitarPostagemScol, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(solicitaEtiquetas, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'solicitaEtiquetas');
  RemClassRegistry.RegisterSerializeOptions(solicitaEtiquetas, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(integrarUsuarioScol, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'integrarUsuarioScol');
  RemClassRegistry.RegisterSerializeOptions(integrarUsuarioScol, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(contratoERPPK, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'contratoERPPK');
  RemClassRegistry.RegisterXSClass(parametroMaster, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'parametroMaster');
  RemClassRegistry.RegisterXSClass(unidadePostagemERP, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'unidadePostagemERP');
  RemClassRegistry.RegisterXSClass(enderecoERP, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'enderecoERP');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(enderecoERP), 'end_', 'end');
  RemClassRegistry.RegisterXSClass(consultaCEPResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'consultaCEPResponse');
  RemClassRegistry.RegisterSerializeOptions(consultaCEPResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(vigenciaERP, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'vigenciaERP');
  RemClassRegistry.RegisterXSClass(validarPostagemSimultaneaResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'validarPostagemSimultaneaResponse');
  RemClassRegistry.RegisterSerializeOptions(validarPostagemSimultaneaResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(validarPostagemReversaResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'validarPostagemReversaResponse');
  RemClassRegistry.RegisterSerializeOptions(validarPostagemReversaResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(validaPlpResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'validaPlpResponse');
  RemClassRegistry.RegisterSerializeOptions(validaPlpResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(validaEtiquetaPLPResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'validaEtiquetaPLPResponse');
  RemClassRegistry.RegisterSerializeOptions(validaEtiquetaPLPResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(integrarUsuarioScolResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'integrarUsuarioScolResponse');
  RemClassRegistry.RegisterSerializeOptions(integrarUsuarioScolResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(cancelarObjetoResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'cancelarObjetoResponse');
  RemClassRegistry.RegisterSerializeOptions(cancelarObjetoResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(VerificaSeTodosObjetosCanceladosResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'VerificaSeTodosObjetosCanceladosResponse');
  RemClassRegistry.RegisterSerializeOptions(VerificaSeTodosObjetosCanceladosResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(valorDeclarado, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'valorDeclarado');
  RemClassRegistry.RegisterXSClass(servicoAdicionalERP, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'servicoAdicionalERP');
  RemClassRegistry.RegisterXSClass(servicoSigep, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'servicoSigep');
  RemClassRegistry.RegisterXSClass(chancelaMaster, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'chancelaMaster');
  RemClassRegistry.RegisterXSClass(servicoERP, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'servicoERP');
  RemClassRegistry.RegisterXSClass(contratoERP, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'contratoERP');
  RemClassRegistry.RegisterXSClass(cartaoPostagemERP, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'cartaoPostagemERP');
  RemClassRegistry.RegisterXSClass(gerenteConta2, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'gerenteConta2', 'gerenteConta');
  RemClassRegistry.RegisterXSClass(clienteERP, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'clienteERP');
  RemClassRegistry.RegisterXSClass(usuarioInstalacao, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'usuarioInstalacao');
  RemClassRegistry.RegisterXSClass(buscaClienteResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaClienteResponse');
  RemClassRegistry.RegisterSerializeOptions(buscaClienteResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaContratoResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaContratoResponse');
  RemClassRegistry.RegisterSerializeOptions(buscaContratoResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(preListaPostagem, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'preListaPostagem');
  RemClassRegistry.RegisterXSClass(objetoPostal, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'objetoPostal');
  RemClassRegistry.RegisterXSClass(getStatusPLP, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'getStatusPLP');
  RemClassRegistry.RegisterSerializeOptions(getStatusPLP, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(arg0), 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'arg0');
  RemClassRegistry.RegisterXSClass(VerificaSeTodosObjetosCancelados, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'VerificaSeTodosObjetosCancelados');
  RemClassRegistry.RegisterSerializeOptions(VerificaSeTodosObjetosCancelados, [xoInlineArrays,xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(calculaTarifaServico, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'calculaTarifaServico');
  RemClassRegistry.RegisterSerializeOptions(calculaTarifaServico, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaTarifaVale, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaTarifaVale');
  RemClassRegistry.RegisterSerializeOptions(buscaTarifaVale, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(valePostal, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'valePostal');
  RemClassRegistry.RegisterXSClass(buscaTarifaValeResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaTarifaValeResponse');
  RemClassRegistry.RegisterSerializeOptions(buscaTarifaValeResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(objetoSimplificado, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'objetoSimplificado');
  RemClassRegistry.RegisterXSClass(retornoCancelamento, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'retornoCancelamento');
  RemClassRegistry.RegisterXSClass(cancelarPedidoScolResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'cancelarPedidoScolResponse');
  RemClassRegistry.RegisterSerializeOptions(cancelarPedidoScolResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(obterMensagemParametrizada, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'obterMensagemParametrizada');
  RemClassRegistry.RegisterSerializeOptions(obterMensagemParametrizada, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(mensagemParametrizadaTO, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'mensagemParametrizadaTO');
  RemClassRegistry.RegisterXSClass(obterMensagemParametrizadaResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'obterMensagemParametrizadaResponse');
  RemClassRegistry.RegisterSerializeOptions(obterMensagemParametrizadaResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(medidaTO, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'medidaTO');
  RemClassRegistry.RegisterXSClass(dimensaoTO, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'dimensaoTO');
  RemClassRegistry.RegisterXSClass(pesquisarParametrosPorDescricaoResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'pesquisarParametrosPorDescricaoResponse');
  RemClassRegistry.RegisterSerializeOptions(pesquisarParametrosPorDescricaoResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(pesquisarDimensoesServicoResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'pesquisarDimensoesServicoResponse');
  RemClassRegistry.RegisterSerializeOptions(pesquisarDimensoesServicoResponse, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(servicoAdicionalTO, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'servicoAdicionalTO');
  RemClassRegistry.RegisterXSInfo(TypeInfo(return), 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'return');
  RemClassRegistry.RegisterXSClass(buscaServicosAdicionaisAtivosResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaServicosAdicionaisAtivosResponse');
  RemClassRegistry.RegisterSerializeOptions(buscaServicosAdicionaisAtivosResponse, [xoInlineArrays,xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaServicosResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaServicosResponse');
  RemClassRegistry.RegisterSerializeOptions(buscaServicosResponse, [xoInlineArrays,xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaServicosValorDeclaradoResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaServicosValorDeclaradoResponse');
  RemClassRegistry.RegisterSerializeOptions(buscaServicosValorDeclaradoResponse, [xoInlineArrays,xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(buscaServicosXServicosAdicionaisResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'buscaServicosXServicosAdicionaisResponse');
  RemClassRegistry.RegisterSerializeOptions(buscaServicosXServicosAdicionaisResponse, [xoInlineArrays,xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(geraDigitoVerificadorEtiquetasResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'geraDigitoVerificadorEtiquetasResponse');
  RemClassRegistry.RegisterSerializeOptions(geraDigitoVerificadorEtiquetasResponse, [xoInlineArrays,xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(obterEmbalagemLRSResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'obterEmbalagemLRSResponse');
  RemClassRegistry.RegisterSerializeOptions(obterEmbalagemLRSResponse, [xoInlineArrays,xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(pesquisarEmbalagensPorServicoResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'pesquisarEmbalagensPorServicoResponse');
  RemClassRegistry.RegisterSerializeOptions(pesquisarEmbalagensPorServicoResponse, [xoInlineArrays,xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(pesquisarServicosAdicionaisResponse, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'pesquisarServicosAdicionaisResponse');
  RemClassRegistry.RegisterSerializeOptions(pesquisarServicosAdicionaisResponse, [xoInlineArrays,xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(objeto, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'objeto');
  RemClassRegistry.RegisterXSClass(produto, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'produto');
  RemClassRegistry.RegisterXSClass(pessoa, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'pessoa');
  RemClassRegistry.RegisterXSClass(remetente, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'remetente');
  RemClassRegistry.RegisterXSClass(coleta, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'coleta');
  RemClassRegistry.RegisterXSClass(coletaReversa, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'coletaReversa');
  RemClassRegistry.RegisterXSClass(validarPostagemReversa, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'validarPostagemReversa');
  RemClassRegistry.RegisterSerializeOptions(validarPostagemReversa, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(coletaSimultanea, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'coletaSimultanea');
  RemClassRegistry.RegisterXSClass(validarPostagemSimultanea, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'validarPostagemSimultanea');
  RemClassRegistry.RegisterSerializeOptions(validarPostagemSimultanea, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(SigepClienteException, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'SigepClienteException');
  RemClassRegistry.RegisterSerializeOptions(SigepClienteException, [xoSimpleTypeWrapper]);
  RemClassRegistry.RegisterXSClass(AutenticacaoException, 'http://cliente.bean.master.sigep.bsb.correios.com.br/', 'AutenticacaoException');
  RemClassRegistry.RegisterSerializeOptions(AutenticacaoException, [xoSimpleTypeWrapper]);

end. 