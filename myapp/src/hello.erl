-module(hello).

-behaviour(application).

%% Application callbacks
-export([start/2,start_link/1, start_link/2, init/1, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================
start(_StartType, _StartArgs) ->
  io:format("hello start ~n"),
  5.
%%application:start(myapp).

stop(_State) ->
  ok.



start_link(Name, Connection) ->
  io:format("hello start_link 2 ~n"),
  gen_server:start_link({local, Name}, ?MODULE, Connection, []).
start_link(Connection) ->
  io:format("hello start_link 1 ~n"),
  gen_server:start_link(?MODULE, Connection, []).
start_link() ->
  io:format("hello start_link 0 ~n"),
  gen_server:start_link(?MODULE, []).

init(Connection) ->
  io:format("hello init ~n"),
  {ok, Connection}.
