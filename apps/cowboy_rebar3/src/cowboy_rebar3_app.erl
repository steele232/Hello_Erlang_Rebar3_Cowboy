%%%-------------------------------------------------------------------
%% @doc cowboy_rebar3 public API
%% @end
%%%-------------------------------------------------------------------

-module(cowboy_rebar3_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
  Dispatch = cowboy_router:compile([         
    {'_', [
        {"/", hello_handler, []},
        {"/register", register_handler, []}
    ]}     
  ]),     
  {ok, _} = cowboy:start_clear(my_http_listener,
    [{port, 8080}],
    #{env => #{dispatch => Dispatch}
  }),
  persist:init_db(pgdb),
  cowboy_rebar3_sup:start_link().

stop(_State) ->
  ok.

%% internal functions
