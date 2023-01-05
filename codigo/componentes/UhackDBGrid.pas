unit UhackDBGrid;

interface

uses
  System.UITypes,
  FireDAC.Stan.Param,
  Winapi.Windows,
  Vcl.Grids,
  Vcl.Graphics,
  Vcl.DBGrids;

type
  THackDBGrid = class(TDBGrid);

procedure SetarLinhaSelecionada(PDBGrid: THackDBGrid; PState: TGridDrawState; const PRect: TRect; PDataCol: Integer; PColumn: TColumn);

implementation

procedure SetarLinhaSelecionada(PDBGrid: THackDBGrid; PState: TGridDrawState; const PRect: TRect; PDataCol: Integer; PColumn: TColumn);
begin
  if (THackDBGrid(PDBGrid).DataLink.ActiveRecord + 1 = THackDBGrid(PDBGrid).Row) or (gdFocused in PState) or (gdSelected in PState) then
  begin
    PDBGrid.canvas.Brush.Color := clMoneyGreen;
    PDBGrid.canvas.Font.Style := PDBGrid.canvas.Font.Style + [fsbold];
  end;

  PDBGrid.DefaultDrawColumnCell(PRect, PDataCol, PColumn, PState);
end;

end.
