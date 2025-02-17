% This is an -*- erlang -*- file.
%% %CopyrightBegin%
%% 
%% Copyright Ericsson AB 2009-2013. All Rights Reserved.
%% 
%% The contents of this file are subject to the Erlang Public License,
%% Version 1.1, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Public License along with this software. If not, it can be
%% retrieved online at http://www.erlang.org/.
%% 
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%% 
%% %CopyrightEnd%

{application, test_server,
 [{description, "The OTP Test Server application"},
  {vsn, "3.7.2"},
  {modules, [
	     erl2html2,
	     test_server_ctrl,
	     test_server,
	     test_server_io,
	     test_server_node,
	     test_server_sup
	    ]},
  {registered, [test_server_ctrl,
		test_server,
		test_server_break_process]},
  {applications, [kernel,stdlib]},
  {env, []},
  {runtime_dependencies, ["tools-2.6.14","stdlib-2.0","runtime_tools-1.8.14",
			  "observer-2.0","kernel-3.0","inets-5.10",
			  "syntax_tools-1.6.16","erts-6.0"]}]}.
  
