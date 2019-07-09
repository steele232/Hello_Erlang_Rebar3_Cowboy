-module(register_handler).
-behavior(cowboy_rest).

%% REST Callbacks
-export([init/2]).
-export([allowed_methods/2]).
-export([content_types_accepted/2]).

%% Callback Callbacks
-export([register_from_json/2]).

%% Helpes
-import(helper, [get_body/2, get_model/3, reply/3]).

%% Cowboy REST callbacks
init(Req, State) ->
  {cowboy_rest, Req, State}.

allowed_methods(Req, State) ->
  {[<<"POST">>], Req, State}. 

content_types_accepted(Req, State) ->
  {[
    {<<"application/json">>, register_from_json}
  ], Req, State}.

register_from_json(Req, State) ->
  {ok, Body, Req1} = cowboy_req:read_urlencoded_body(Req),

  %% Check request body
  case get_body(Body, Req1) of
    {ok, Input, _Req} ->
        %% Validate body json and fields
        Model = [
          {<<"email">>, required, string, email, [non_empty,
            fun(V) ->
                validator:email(V)
            end
          ]},
          {<<"pass">>, required, string, pass, [non_empty, 
            fun(V) -> 
                validator:min_length(6, V)
            end
          ]},
          {<<"fname">>, required, string, fname, [non_empty]},
          {<<"lname">>, required, string, lname, [non_empty]}                
        ],
        Emodel = get_model(Input, Model, Req1),

        %% Check model result
        case Emodel of
          {error, Reason} ->
            Req3 = reply(412, {Reason}, Req1),
            {false, Req3, State};
          {error, empty, Req4} ->
            {false, Req4, State};
          {ok, _} ->
            %% Perform Registration
            case registration(Emodel, Req1) of
              {ok, User, Req5} ->
                {true, reply(200, User, Req5), State};
              {error, Req6} ->
                {false, Req6, State}
            end
        end;

    {error, empty, Req2} -> 
      {false, Req2, State}
  end.

%% Registration functions
registration(Emodel, Req) ->
  {ok, Data} = Emodel,
  Pass = maps:get(pass, Data),
  Register_safe_pass = maps:update(pass, Pass, Data),
  Register = maps:put(token, random(64), Register_safe_pass),
  {ok, Register, Req}.

random(Len) ->
  Chrs = list_to_tuple("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"),
  ChrsSize = size(Chrs),
  F = fun(_, R) -> [element(rand:uniform(ChrsSize), Chrs) | R] end,
  list_to_binary(lists:foldl(F, "", lists:seq(1, Len))).