
%transpositions
transpose(<,>).
transpose(>,<).
transpose(e,et).
transpose(s,st).
transpose(et,e).
transpose(st,s).
transpose(d,dt).
transpose(m,mt).
transpose(dt,d).
transpose(mt,m).
transpose(o,ot).
transpose(ot,o).
transpose(=,=).


%symetries
symetrie(<,>).
symetrie(>,<).
symetrie(e,s).
symetrie(s,e).
symetrie(et,st).
symetrie(st,et).
symetrie(d,d).
symetrie(m,mt).
symetrie(dt,dt).
symetrie(mt,m).
symetrie(o,ot).
symetrie(ot,o).
symetrie(=,=).


% Composition de base
compositionBase(<,<,[<]).
compositionBase(<,m,[<]).
compositionBase(<,o,[<]).
compositionBase(<,et,[<]).
compositionBase(<,s,[<]).
compositionBase(<,d,[<,m,o,s,d]).
compositionBase(<,dt,[<]).
compositionBase(<,e,[<,m,o,s,d]).
compositionBase(<,st,[<]).
compositionBase(<,ot,[<,m,o,s,d]).
compositionBase(<,mt,[<,m,o,s,d]).
compositionBase(<,>,[<,>,m,mt,o,ot,e,et,s,st,d,dt,=]).
compositionBase(m,m,[<]).
compositionBase(m,o,[<]).
compositionBase(m,et,[<]).
compositionBase(m,s,[m]).
compositionBase(m,d,[o,s,d]).
compositionBase(m,dt,[<]).
compositionBase(m,e,[o,s,d]).
compositionBase(m,st,[m]).
compositionBase(m,ot,[o,s,d]).
compositionBase(m,mt,[e,et,=]).
compositionBase(o,o,[<,m,o]).
compositionBase(o,et,[<,m,o]).
compositionBase(o,s,[o]).
compositionBase(o,d,[o,s,d]).
compositionBase(o,dt,[<,m,o,et,dt]).
compositionBase(o,e,[o,s,d]).
compositionBase(o,st,[o,et,dt]).
compositionBase(o,ot,[o,ot,e,et,d,dt,st,s,=]).
compositionBase(s,et,[<,m,o]).
compositionBase(s,s,[s]).
compositionBase(s,d,[d]).
compositionBase(s,dt,[<,m,o,et,dt]).
compositionBase(s,e,[d]).
compositionBase(s,st,[s,st,=]).
compositionBase(et,s,[o]).
compositionBase(et,d,[o,s,d]).
compositionBase(et,dt,[dt]).
compositionBase(et,e,[e,et,=]).
compositionBase(d,d,[d]).
compositionBase(d,dt,[<,>,m,mt,o,ot,e,et,s,st,d,dt,=]).
compositionBase(dt,d,[o,ot,e,et,d,dt,st,s,=]).

