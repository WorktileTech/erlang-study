-module(myapp_sup).

-behaviour(supervisor).

%% API
-export([start_link/0,start_connection/1,start_connection/2]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    io:format("myapp_sup start_link ~n"),
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

start_connection(Connection) ->
    supervisor:start_child(?MODULE, [Connection]).
start_connection(Name, Connection) ->
    io:format("myapp_sup start_connection ~n"),
    supervisor:start_child(?MODULE, [Name, Connection]).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init(_) ->
    io:format("myapp_sup init ~n"),
    {ok,
        {{simple_one_for_one, 5, 10},
            [{connection, {hello, start_link, []},
                transient, 5000, worker, [hello]}]}}.
    %%{ok, { {one_for_one, 5, 10}, []} }.

