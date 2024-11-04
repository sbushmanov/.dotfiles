Time	Sum	Command
1219	224408	> builtin source /usr/share/fish/config.fish
51	51	-> set -g IFS \n\ \t
13	13	-> set -qg __fish_added_user_paths
11	11	-> set -g __fish_added_user_paths
10	10	-> function __fish_default_command_not_found_handler...
3	14	-> if not status --is-interactive...
11	11	--> not status --is-interactive
11	11	-> set -l __extra_completionsdir
9	9	-> set -l __extra_functionsdir
8	8	-> set -l __extra_confdir
11	194	-> if test -f $__fish_data_dir/__fish_build_paths.fish...
50	50	--> test -f $__fish_data_dir/__fish_build_paths.fish
95	133	--> source $__fish_data_dir/__fish_build_paths.fish
17	17	---> set __extra_completionsdir /usr/share/fish/vendor_completions.d
11	11	---> set __extra_functionsdir /usr/share/fish/vendor_functions.d
10	10	---> set __extra_confdir /usr/share/fish/vendor_conf.d
11	11	-> set -l xdg_data_dirs
12	431	-> if set -q XDG_DATA_DIRS...
7	7	--> set -q XDG_DATA_DIRS
20	20	--> set --path xdg_data_dirs $XDG_DATA_DIRS
266	392	--> set xdg_data_dirs (string replace -r '([^/])/$' '$1' -- $xdg_data_dirs)/fish
126	126	---> string replace -r '([^/])/$' '$1' -- $xdg_data_dirs
15	15	-> set -g __fish_vendor_completionsdirs
10	10	-> set -g __fish_vendor_functionsdirs
10	10	-> set -g __fish_vendor_confdirs
20	197	-> if not set -q FISH_UNIT_TESTS_RUNNING...
9	9	--> not set -q FISH_UNIT_TESTS_RUNNING
35	35	--> set __fish_vendor_completionsdirs $__fish_user_data_dir/vendor_completions.d $xdg_data_dirs/vendor_completions.d
26	26	--> set __fish_vendor_functionsdirs $__fish_user_data_dir/vendor_functions.d $xdg_data_dirs/vendor_functions.d
24	24	--> set __fish_vendor_confdirs $__fish_user_data_dir/vendor_conf.d $xdg_data_dirs/vendor_conf.d
4	33	--> if not contains -- $__extra_completionsdir $__fish_vendor_completionsdirs...
29	29	---> not contains -- $__extra_completionsdir $__fish_vendor_completionsdirs
2	25	--> if not contains -- $__extra_functionsdir $__fish_vendor_functionsdirs...
23	23	---> not contains -- $__extra_functionsdir $__fish_vendor_functionsdirs
3	25	--> if not contains -- $__extra_confdir $__fish_vendor_confdirs...
22	22	---> not contains -- $__extra_confdir $__fish_vendor_confdirs
9	55	-> if not set -q fish_function_path...
8	8	--> not set -q fish_function_path
38	38	--> set fish_function_path $__fish_config_dir/functions $__fish_sysconf_dir/functions $__fish_vendor_functionsdirs $__fish_data_dir/functions
7	52	-> if not set -q fish_complete_path...
6	6	--> not set -q fish_complete_path
39	39	--> set fish_complete_path $__fish_config_dir/completions $__fish_sysconf_dir/completions $__fish_vendor_completionsdirs $__fish_data_dir/completions $__fish_user_data_dir/generated_completions
17	17	-> function __fish_reconstruct_path -d "Update PATH when fish_user_paths changes" --on-variable fish_user_paths...
23	23	-> function fish_sigtrap_handler --on-signal TRAP --no-scope-shadowing --description "TRAP handler: debug prompt"...
9	9	-> function __fish_on_interactive --on-event fish_prompt --on-event fish_read...
136	724	-> __fish_set_locale
448	454	--> source /usr/share/fish/functions/__fish_set_locale.fish
6	6	---> function __fish_set_locale...
16	16	--> set -l LOCALE_VARS
18	18	--> set -a LOCALE_VARS LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE
15	15	--> set -a LOCALE_VARS LC_MONETARY LC_MESSAGES LC_PAPER LC_NAME LC_ADDRESS
18	18	--> set -a LOCALE_VARS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION
34	67	--> for locale_var in $LOCALE_VARS LC_ALL...
7	33	---> if set -q $locale_var...
13	13	----> set -q $locale_var
13	13	----> return 0
2	11	-> if status --is-login...
9	9	--> status --is-login
46	1470	-> __fish_reconstruct_path
12	12	--> set -l new_user_path
146	286	--> for path in (string split : -- $fish_user_paths)...
37	37	---> string split : -- $fish_user_paths
7	103	---> if not contains -- $path $new_user_path...
78	78	----> not contains -- $path $new_user_path
18	18	----> set -a new_user_path $path
4	293	--> if test (count $new_user_path) -lt (count $fish_user_paths)...
143	289	---> test (count $new_user_path) -lt (count $fish_user_paths)
127	127	----> count $new_user_path
19	19	----> count $fish_user_paths
152	152	--> set -l local_path $PATH
13	13	--> for x in $__fish_added_user_paths...
13	13	--> set -g __fish_added_user_paths
8	471	--> if set -q fish_user_paths...
8	8	---> set -q fish_user_paths
115	455	---> for x in (string split ":" -- $fish_user_paths[-1..1])...
32	32	----> string split ":" -- $fish_user_paths[-1..1]
8	280	----> if set -l idx (contains --index -- $x $local_path)...
98	231	-----> set -l idx (contains --index -- $x $local_path)
133	133	------> contains --index -- $x $local_path
41	41	-----> set -e local_path[$idx]
28	28	----> set -p local_path $x
184	184	--> set -xg PATH $local_path
6	6	-> function __fish_expand_pid_args...
19	53	-> for jobbltn in bg wait disown...
13	13	--> function $jobbltn -V jobbltn...
10	10	--> function $jobbltn -V jobbltn...
11	11	--> function $jobbltn -V jobbltn...
3	3	-> function fg...
3	3	-> function kill...
11	11	-> set -l sourcelist
410	219757	-> for file in $__fish_config_dir/conf.d/*.fish $__fish_sysconf_dir/conf.d/*.fish $__fish_vendor_confdirs/*.fish...
132	189	--> set -l basename (string replace -r '^.*/' '' -- $file)
57	57	---> string replace -r '^.*/' '' -- $file
21	21	--> contains -- $basename $sourcelist
16	16	--> set sourcelist $sourcelist $basename
46	46	--> test -f $file -a -r $file
362	390	--> source $file
14	14	---> function _tide_init_install --on-event _tide_init_install...
6	6	---> function _tide_init_update --on-event _tide_init_update...
8	8	---> function _tide_init_uninstall --on-event _tide_init_uninstall...
86	130	--> set -l basename (string replace -r '^.*/' '' -- $file)
44	44	---> string replace -r '^.*/' '' -- $file
18	18	--> contains -- $basename $sourcelist
16	16	--> set sourcelist $sourcelist $basename
42	42	--> test -f $file -a -r $file
52	279	--> source $file
76	227	---> source "$HOME/.atuin/bin/env.fish"
10	151	----> if not contains "$HOME/.atuin/bin" $PATH...
141	141	-----> not contains "$HOME/.atuin/bin" $PATH
86	122	--> set -l basename (string replace -r '^.*/' '' -- $file)
36	36	---> string replace -r '^.*/' '' -- $file
20	20	--> contains -- $basename $sourcelist
18	18	--> set sourcelist $sourcelist $basename
41	41	--> test -f $file -a -r $file
386	1539	--> source $file
11	11	---> status is-interactive
29	29	---> set --global autopair_left "(" "[" "{" '"' "'"
20	20	---> set --global autopair_right ")" "]" "}" '"' "'"
20	20	---> set --global autopair_pairs "()" "[]" "{}" '""' "''"
10	10	---> function _autopair_fish_key_bindings --on-variable fish_key_bindings...
48	1053	---> _autopair_fish_key_bindings
13	13	----> set --query fish_key_bindings[1]
18	18	----> test $fish_key_bindings = fish_default_key_bindings
15	15	----> set --local mode default insert
83	83	----> bind --mode $mode[-1] --erase \177 \b \t
19	19	----> bind --mode $mode[1] \177 _autopair_backspace
23	23	----> bind --mode $mode[1] \b _autopair_backspace
14	14	----> bind --mode $mode[1] \t _autopair_tab
278	820	----> printf "%s\n" $autopair_pairs | while read --local left right --delimiter ""
        bind --mode $mode[-1] --erase $left $right
        if test $left = $right
            bind --mode $mode[1] $left "_autopair_insert_same \\$left"
        else
            bind --mode $mode[1] $left "_autopair_insert_left \\$left \\$right"
            bind --mode $mode[1] $right "_autopair_insert_right \\$right"
        end
    end
96	96	-----> read --local left right --delimiter ""
27	27	-----> bind --mode $mode[-1] --erase $left $right
12	72	-----> if test $left = $right...
15	15	------> test $left = $right
26	26	------> bind --mode $mode[1] $left "_autopair_insert_left \\$left \\$right"
19	19	------> bind --mode $mode[1] $right "_autopair_insert_right \\$right"
23	23	-----> read --local left right --delimiter ""
18	18	-----> bind --mode $mode[-1] --erase $left $right
9	58	-----> if test $left = $right...
11	11	------> test $left = $right
20	20	------> bind --mode $mode[1] $left "_autopair_insert_left \\$left \\$right"
18	18	------> bind --mode $mode[1] $right "_autopair_insert_right \\$right"
19	19	-----> read --local left right --delimiter ""
17	17	-----> bind --mode $mode[-1] --erase $left $right
8	57	-----> if test $left = $right...
11	11	------> test $left = $right
18	18	------> bind --mode $mode[1] $left "_autopair_insert_left \\$left \\$right"
20	20	------> bind --mode $mode[1] $right "_autopair_insert_right \\$right"
19	19	-----> read --local left right --delimiter ""
17	17	-----> bind --mode $mode[-1] --erase $left $right
5	34	-----> if test $left = $right...
11	11	------> test $left = $right
18	18	------> bind --mode $mode[1] $left "_autopair_insert_same \\$left"
20	20	-----> read --local left right --delimiter ""
17	17	-----> bind --mode $mode[-1] --erase $left $right
5	33	-----> if test $left = $right...
11	11	------> test $left = $right
17	17	------> bind --mode $mode[1] $left "_autopair_insert_same \\$left"
15	15	-----> read --local left right --delimiter ""
10	10	---> function _autopair_uninstall --on-event autopair_uninstall...
141	184	--> set -l basename (string replace -r '^.*/' '' -- $file)
43	43	---> string replace -r '^.*/' '' -- $file
27	27	--> contains -- $basename $sourcelist
20	20	--> set sourcelist $sourcelist $basename
43	43	--> test -f $file -a -r $file
176	1488	--> source $file
4	16	---> if not status is-interactive...
12	12	----> not status is-interactive
21	21	---> set --global _fzf_search_vars_command '_fzf_search_variables (set --show | psub) (set --names | psub)'
72	1268	---> fzf_configure_bindings
388	402	----> source /home/sergey/.config/fish/functions/fzf_configure_bindings.fish
14	14	-----> function fzf_configure_bindings --description "Installs the default key bindings for fzf.fish with user overrides passed as options."...
9	9	----> status is-interactive
30	30	----> set -f options_spec h/help 'directory=?' 'git_log=?' 'git_status=?' 'history=?' 'processes=?' 'variables=?'
76	76	----> argparse --max-args=0 --ignore-unknown $options_spec -- $argv 2>/dev/null
31	679	----> if test $status -ne 0...
21	21	-----> test $status -ne 0
31	31	-----> set --query _flag_help
27	27	-----> set -f key_sequences \e\cf \e\cl \e\cs \cr \e\cp \cv
8	8	-----> set --query _flag_directory
8	8	-----> set --query _flag_git_log
7	7	-----> set --query _flag_git_status
6	6	-----> set --query _flag_history
7	7	-----> set --query _flag_processes
7	7	-----> set --query _flag_variables
4	115	-----> if functions --query _fzf_uninstall_bindings...
111	111	------> functions --query _fzf_uninstall_bindings
72	400	-----> for mode in default insert...
23	23	------> test -n $key_sequences[1]
21	21	------> bind --mode $mode $key_sequences[1] _fzf_search_directory
10	10	------> test -n $key_sequences[2]
16	16	------> bind --mode $mode $key_sequences[2] _fzf_search_git_log
9	9	------> test -n $key_sequences[3]
15	15	------> bind --mode $mode $key_sequences[3] _fzf_search_git_status
9	9	------> test -n $key_sequences[4]
15	15	------> bind --mode $mode $key_sequences[4] _fzf_search_history
9	9	------> test -n $key_sequences[5]
15	15	------> bind --mode $mode $key_sequences[5] _fzf_search_processes
9	9	------> test -n $key_sequences[6]
28	28	------> bind --mode $mode $key_sequences[6] "$_fzf_search_vars_command"
10	10	------> test -n $key_sequences[1]
15	15	------> bind --mode $mode $key_sequences[1] _fzf_search_directory
9	9	------> test -n $key_sequences[2]
15	15	------> bind --mode $mode $key_sequences[2] _fzf_search_git_log
9	9	------> test -n $key_sequences[3]
14	14	------> bind --mode $mode $key_sequences[3] _fzf_search_git_status
9	9	------> test -n $key_sequences[4]
15	15	------> bind --mode $mode $key_sequences[4] _fzf_search_history
9	9	------> test -n $key_sequences[5]
15	15	------> bind --mode $mode $key_sequences[5] _fzf_search_processes
9	9	------> test -n $key_sequences[6]
20	20	------> bind --mode $mode $key_sequences[6] "$_fzf_search_vars_command"
11	11	-----> function _fzf_uninstall_bindings --inherit-variable key_sequences...
7	7	---> function _fzf_uninstall --on-event fzf_uninstall...
208	251	--> set -l basename (string replace -r '^.*/' '' -- $file)
43	43	---> string replace -r '^.*/' '' -- $file
46	46	--> contains -- $basename $sourcelist
46	46	--> set sourcelist $sourcelist $basename
60	60	--> test -f $file -a -r $file
182	186255	--> source $file
11	58	---> if set -q GVM_DIR...
15	15	----> set -q GVM_DIR
32	32	----> set gvm_dir "$HOME/.gvm"
2	351	---> if not functions -q bass...
88	349	----> not functions -q bass
248	261	-----> source /home/sergey/.config/fish/functions/bass.fish
9	9	------> function bass...
4	4	------> function __bass_usage...
11	185664	---> if test -e $gvm_dir/environments/default...
29	29	----> test -e $gvm_dir/environments/default
84	185624	----> bass source $gvm_dir/environments/default
23	23	-----> set -l bash_args $argv
16	16	-----> set -l bass_debug
4	25	-----> if test "$bash_args[1]_" = '-d_'...
21	21	------> test "$bash_args[1]_" = '-d_'
149	2679	-----> set -l script_file (mktemp)
2530	2530	------> mktemp
40	179066	-----> if command -v python3 >/dev/null 2>&1...
106	106	------> command -v python3 >/dev/null 2>&1
177214	178920	------> command python3 -sS (dirname (status -f))/__bass.py $bash_args 3>$script_file
1686	1706	-------> dirname (status -f)
20	20	--------> status -f
71	71	-----> set -l bass_status $status
4	30	-----> if test $bass_status -ne 0...
26	26	------> test $bass_status -ne 0
3	18	-----> if test -n "$bass_debug"...
15	15	------> test -n "$bass_debug"
546	991	-----> source $script_file
52	52	------> set -g -x PKG_CONFIG_PATH "/home/sergey/.gvm/pkgsets/go1.23/global/overlay/lib/pkgconfig:/home/sergey/.gvm/pkgsets/go1.23/global/overlay/lib/pkgconfig:/home/sergey/.gvm/pkgsets/go1.23/global/overlay/lib/pkgconfig:/home/sergey/.gvm/pkgsets/go1.23/global/overlay/lib/pkgconfig:"
19	19	------> set -g -x SDKMAN_OFFLINE_MODE ""
23	23	------> set -g -x DYLD_LIBRARY_PATH "/home/sergey/.gvm/pkgsets/go1.23/global/overlay/lib:/home/sergey/.gvm/pkgsets/go1.23/global/overlay/lib:/home/sergey/.gvm/pkgsets/go1.23/global/overlay/lib:/home/sergey/.gvm/pkgsets/go1.23/global/overlay/lib:"
14	14	------> set -g -x SDKMAN_ENV ""
12	12	------> set -g -x NVM_CD_FLAGS ""
24	24	------> set -g -x LD_LIBRARY_PATH "/home/sergey/.gvm/pkgsets/go1.23/global/overlay/lib:/home/sergey/.gvm/pkgsets/go1.23/global/overlay/lib:/home/sergey/.gvm/pkgsets/go1.23/global/overlay/lib:/home/sergey/.gvm/pkgsets/go1.23/global/overlay/lib:/usr/lib/x86_64-linux-gnu:/home/sergey/anaconda3/lib/:.:.:."
301	301	------> set -g -x PATH "/home/sergey/.gvm/pkgsets/go1.23/global/bin" "/home/sergey/.gvm/gos/go1.23/bin" "/home/sergey/.gvm/pkgsets/go1.23/global/overlay/bin" "/home/sergey/.gvm/bin" "/home/sergey/.fzf/bin" "/home/sergey/anaconda3/bin/" "/home/sergey/spark/bin" "/usr/local/cuda/bin" "/home/sergey/spark/bin" "/home/sergey/.sdkman/candidates/java/17.0.11-graal/bin" "/tmp/luver_current_27548_1729963298_j7G/bin" "/home/sergey/.local/share/luver/self/bin" "/home/sergey/.gvm/pkgsets/go1.23/global/bin" "/home/sergey/.gvm/gos/go1.23/bin" "/home/sergey/.gvm/pkgsets/go1.23/global/overlay/bin" "/home/sergey/.gvm/bin" "/home/sergey/anaconda3/bin/" "/home/sergey/spark/bin" "/usr/local/cuda/bin" "/home/sergey/spark/bin" "/home/sergey/.sdkman/candidates/java/17.0.11-graal/bin" "/tmp/luver_current_26117_1729963038_a93/bin" "/home/sergey/.local/share/luver/self/bin" "/home/sergey/.gvm/pkgsets/go1.23/global/bin" "/home/sergey/.gvm/gos/go1.23/bin" "/home/sergey/.gvm/pkgsets/go1.23/global/overlay/bin" "/home/sergey/.gvm/bin" "/home/sergey/.asdf/installs/tmux/3.5a/bin" "/home/sergey/anaconda3/bin/" "/home/sergey/anaconda3/condabin" "/home/sergey/.asdf/shims" "/home/sergey/.asdf/bin" "/home/sergey/spark/bin" "/usr/local/cuda/bin" "/home/sergey/spark/bin" "/home/sergey/.sdkman/candidates/java/17.0.11-graal/bin" "/home/sergey/.sdkman/candidates/java/current/bin" "/tmp/luver_current_8564_1729961727_Wzw/bin" "/home/sergey/.local/share/luver/self/bin" "/home/sergey/.gvm/pkgsets/go1.23/global/bin" "/home/sergey/.gvm/gos/go1.23/bin" "/home/sergey/.gvm/pkgsets/go1.23/global/overlay/bin" "/home/sergey/.gvm/bin" "/home/sergey/.atuin/bin" "/home/sergey/.juliaup/bin" "/home/sergey/.nvm/versions/node/v20.2.0/bin" "/opt/apache-maven-3.9.1/bin" "/home/sergey/.cargo/bin" "/home/sergey/.local/bin" "/home/sergey/bin" "/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin" "/usr/games" "/usr/local/games" "/snap/bin" "/home/sergey/.local/share/JetBrains/Toolbox/scripts" "/home/sergey/.local/share/coursier/bin" "/home/sergey/.gem/bin" "/home/sergey/.cargo/bin" "/home/sergey/.juliaup/bin" "/home/sergey/hadoop/bin" "/home/sergey/.local/share/coursier/bin" "/home/sergey/.gem/bin" "/home/sergey/.cargo/bin" "/home/sergey/.juliaup/bin" "/home/sergey/hadoop/bin" "/home/sergey/.local/share/coursier/bin" "/home/sergey/.gem/bin" "/home/sergey/.cargo/bin" "/home/sergey/.juliaup/bin" "/home/sergey/hadoop/bin"
2621	2621	-----> command rm $script_file
276	365	--> set -l basename (string replace -r '^.*/' '' -- $file)
89	89	---> string replace -r '^.*/' '' -- $file
36	36	--> contains -- $basename $sourcelist
30	30	--> set sourcelist $sourcelist $basename
46	46	--> test -f $file -a -r $file
368	4484	--> source $file
17	17	---> set -q XDG_DATA_HOME
23	23	---> set -l XDG_DATA_HOME $HOME/.local/share
8	8	---> set -q LUVER_DIR
8	8	---> set -q LUVER_SRC
112	3899	---> set -gx LUVER_CURRENT_DIR (mktemp -u /tmp/luver_current_{$fish_pid}_(date +%s)_XXX)
1903	3787	----> mktemp -u /tmp/luver_current_{$fish_pid}_(date +%s)_XXX
1884	1884	-----> date +%s
110	110	---> set -gxp PATH $LUVER_CURRENT_DIR/bin $LUVER_SRC/bin
3	29	---> if test -d $LUVER_DIR/lua-aliases/default...
26	26	----> test -d $LUVER_DIR/lua-aliases/default
8	8	---> function _luver_on_pull...
8	8	---> function _luver_on_install --on-event luver_install...
6	6	---> function _luver_on_update --on-event luver_update...
106	152	--> set -l basename (string replace -r '^.*/' '' -- $file)
46	46	---> string replace -r '^.*/' '' -- $file
28	28	--> contains -- $basename $sourcelist
23	23	--> set sourcelist $sourcelist $basename
37	37	--> test -f $file -a -r $file
322	463	--> source $file
16	16	---> set --query nvm_mirror
16	16	---> set --global nvm_mirror https://nodejs.org/dist
11	11	---> set --query XDG_DATA_HOME
23	23	---> set --local XDG_DATA_HOME ~/.local/share
19	19	---> set --global nvm_data $XDG_DATA_HOME/nvm
17	17	---> function _nvm_install --on-event nvm_install...
6	6	---> function _nvm_update --on-event nvm_update...
5	5	---> function _nvm_uninstall --on-event nvm_uninstall...
4	28	---> if status is-interactive...
10	10	----> status is-interactive
14	14	----> set --query nvm_default_version
97	136	--> set -l basename (string replace -r '^.*/' '' -- $file)
39	39	---> string replace -r '^.*/' '' -- $file
26	26	--> contains -- $basename $sourcelist
23	23	--> set sourcelist $sourcelist $basename
36	36	--> test -f $file -a -r $file
478	21195	--> source $file
11	49	---> if set -q __sdkman_custom_dir...
14	14	----> set -q __sdkman_custom_dir
24	24	----> set -gx SDKMAN_DIR "$HOME/.sdkman"
22	22	---> set __fish_sdkman_init "$SDKMAN_DIR/bin/sdkman-init.sh"
9	9	---> set --query fisher_path
19	19	---> set --local fisher_path $__fish_config_dir
19	19	---> set __fish_sdkman_noexport_init "$fisher_path/functions/__sdkman-noexport-init.sh"
2	28	---> if not test -f "$__fish_sdkman_init"...
26	26	----> not test -f "$__fish_sdkman_init"
4	3534	---> if  begin       not test -f "$__fish_sdkman_noexport_init";
          or    env test "$__fish_sdkman_init" -nt "$__fish_sdkman_noexport_init"
    end...
21	3530	----> begin...
25	25	-----> not test -f "$__fish_sdkman_noexport_init"
3484	3484	-----> env test "$__fish_sdkman_init" -nt "$__fish_sdkman_noexport_init"
9	9	---> function __fish_sdkman_run_in_bash...
9	12096	---> if not set -q SDKMAN_CANDIDATES_DIR...
16	16	----> not set -q SDKMAN_CANDIDATES_DIR
331	12071	----> test (ls -ld "$SDKMAN_CANDIDATES_DIR" | awk '{print $3}') != (whoami)
1339	9855	-----> ls -ld "$SDKMAN_CANDIDATES_DIR" | awk '{print $3}'
265	279	------> source /usr/share/fish/functions/ls.fish
14	14	-------> function ls --description "List contents of directory"...
23	5119	------> if not set -q __fish_ls_command...
17	17	-------> not set -q __fish_ls_command
17	17	-------> set -g __fish_ls_command ls
10	10	-------> set -g __fish_ls_color_opt
10	10	-------> set -g __fish_ls_indicators_opt
13	5042	-------> if command -sq colorls...
395	395	--------> command -sq colorls
20	2405	--------> for opt in --color=auto -G --color...
20	2385	---------> if command ls $opt / >/dev/null 2>/dev/null...
2330	2330	----------> command ls $opt / >/dev/null 2>/dev/null
28	28	----------> set -g __fish_ls_color_opt $opt
7	7	----------> break
13	2229	--------> if command ls -F / >/dev/null 2>/dev/null...
2196	2196	---------> command ls -F / >/dev/null 2>/dev/null
20	20	---------> set -g __fish_ls_indicators_opt -F
12	12	------> set -l indicators_opt
107	468	------> isatty stdout
204	221	-------> source /usr/share/fish/functions/isatty.fish
17	17	--------> function isatty -d "Tests if a file descriptor is a tty"...
17	17	-------> set -l options h/help
34	34	-------> argparse -n isatty $options -- $argv
3	16	-------> if set -q _flag_help...
13	13	--------> set -q _flag_help
2	14	-------> if set -q argv[2]...
12	12	--------> set -q argv[2]
10	10	-------> set -l fd
21	32	-------> switch "$argv"...
11	11	--------> set fd 1
17	17	-------> test -t "$fd"
16	16	------> test "$TERM_PROGRAM" = Apple_Terminal
2622	2622	------> command $__fish_ls_command $__fish_ls_color_opt $indicators_opt $argv
1885	1885	-----> whoami
7	4932	---> if grep -q "^sdkman_auto_env=true" "$SDKMAN_DIR/etc/config"...
136	4925	----> grep -q "^sdkman_auto_env=true" "$SDKMAN_DIR/etc/config"
110	2425	-----> source /usr/share/fish/functions/grep.fish
29	2315	------> if echo | command grep --color=auto "" >/dev/null 2>&1...
2275	2275	-------> echo | command grep --color=auto "" >/dev/null 2>&1
11	11	-------> function grep...
2364	2364	-----> command grep --color=auto $argv
120	172	--> set -l basename (string replace -r '^.*/' '' -- $file)
52	52	---> string replace -r '^.*/' '' -- $file
32	32	--> contains -- $basename $sourcelist
30	30	--> set sourcelist $sourcelist $basename
39	39	--> test -f $file -a -r $file
61	321	--> source $file
81	260	---> source "$HOME/.cargo/env.fish"
9	179	----> if not contains "$HOME/.cargo/bin" $PATH...
170	170	-----> not contains "$HOME/.cargo/bin" $PATH
114	161	--> set -l basename (string replace -r '^.*/' '' -- $file)
47	47	---> string replace -r '^.*/' '' -- $file
38	38	--> contains -- $basename $sourcelist
30	30	--> set sourcelist $sourcelist $basename
39	39	--> test -f $file -a -r $file
71	98	--> source $file
3	27	---> if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'...
24	24	----> test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
45	45	> builtin source /etc/fish/config.fish
681	74172	> builtin source /home/sergey/.config/fish/config.fish
213	73477	-> if status is-interactive...
13	13	--> status is-interactive
53	53	--> set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH "."
623	3705	--> printf '%.0s\n' (seq 1 100)
2342	3082	---> seq 1 100
369	740	----> source /usr/share/fish/functions/seq.fish
4	371	-----> if not command -sq seq...
367	367	------> not command -sq seq
150	1616	--> alias v 'nvim'
526	541	---> source /usr/share/fish/functions/alias.fish
15	15	----> function alias --description 'Creates a function wrapping a command'...
20	20	---> set -l options h/help s/save
39	39	---> argparse -n alias --max-args=2 $options -- $argv
2	13	---> if set -q _flag_help...
11	11	----> set -q _flag_help
10	10	---> set -l name
8	8	---> set -l body
8	8	---> set -l prefix
12	55	---> if not set -q argv[1]...
9	9	----> not set -q argv[1]
6	6	----> not set -q argv[2]
16	16	----> set name $argv[1]
12	12	----> set body $argv[2]
3	30	---> if test -z "$name"...
15	15	----> test -z "$name"
12	12	----> test -z "$body"
193	193	---> printf '%s\n' $body | read -l --list words
22	22	---> set -l first_word $words[1]
14	14	---> set -l last_word $words[-1]
3	20	---> if test $first_word = $name...
17	17	----> test $first_word = $name
108	131	---> set -l cmd_string (string escape -- "alias $argv")
23	23	----> string escape -- "alias $argv"
10	10	---> set -l wraps
10	130	---> if test $first_word != $name...
15	15	----> test $first_word != $name
14	14	----> test $last_word != $name
74	91	----> set wraps --wraps (string escape -- $body)
17	17	-----> string escape -- $body
191	209	---> echo "function $name $wraps --description $cmd_string; $prefix $body \$argv
        end" | source
18	18	----> function v --wraps nvim --description 'alias v nvim'...
2	13	---> if set -q _flag_save...
11	11	----> set -q _flag_save
67	1014	--> alias vf 'fzf --tmux 85% --preview "bat --color always {}"  --exit-0 | xargs -r nvim || true'
13	13	---> set -l options h/help s/save
33	33	---> argparse -n alias --max-args=2 $options -- $argv
2	9	---> if set -q _flag_help...
7	7	----> set -q _flag_help
8	8	---> set -l name
8	8	---> set -l body
8	8	---> set -l prefix
10	52	---> if not set -q argv[1]...
8	8	----> not set -q argv[1]
6	6	----> not set -q argv[2]
15	15	----> set name $argv[1]
13	13	----> set body $argv[2]
4	29	---> if test -z "$name"...
13	13	----> test -z "$name"
12	12	----> test -z "$body"
99	99	---> printf '%s\n' $body | read -l --list words
19	19	---> set -l first_word $words[1]
13	13	---> set -l last_word $words[-1]
3	18	---> if test $first_word = $name...
15	15	----> test $first_word = $name
103	138	---> set -l cmd_string (string escape -- "alias $argv")
35	35	----> string escape -- "alias $argv"
9	9	---> set -l wraps
9	144	---> if test $first_word != $name...
14	14	----> test $first_word != $name
13	13	----> test $last_word != $name
80	108	----> set wraps --wraps (string escape -- $body)
28	28	-----> string escape -- $body
308	333	---> echo "function $name $wraps --description $cmd_string; $prefix $body \$argv
        end" | source
25	25	----> function vf --wraps 'fzf --tmux 85% --preview "bat --color always {}"  --exit-0 | xargs -r nvim || true' --description 'alias vf fzf --tmux 85% --preview "bat --color always {}"  --exit-0 | xargs -r nvim || true'...
3	14	---> if set -q _flag_save...
11	11	----> set -q _flag_save
69	1170	--> alias fn 'n (fzf --tmux 85% --walker="dir,hidden" --preview "exa -la {}"); printf "%.0s\n" (seq 1 100); commandline -f repaint'
13	13	---> set -l options h/help s/save
34	34	---> argparse -n alias --max-args=2 $options -- $argv
2	9	---> if set -q _flag_help...
7	7	----> set -q _flag_help
8	8	---> set -l name
8	8	---> set -l body
8	8	---> set -l prefix
11	51	---> if not set -q argv[1]...
8	8	----> not set -q argv[1]
6	6	----> not set -q argv[2]
14	14	----> set name $argv[1]
12	12	----> set body $argv[2]
4	33	---> if test -z "$name"...
12	12	----> test -z "$name"
17	17	----> test -z "$body"
177	177	---> printf '%s\n' $body | read -l --list words
19	19	---> set -l first_word $words[1]
15	15	---> set -l last_word $words[-1]
2	16	---> if test $first_word = $name...
14	14	----> test $first_word = $name
107	148	---> set -l cmd_string (string escape -- "alias $argv")
41	41	----> string escape -- "alias $argv"
9	9	---> set -l wraps
12	168	---> if test $first_word != $name...
13	13	----> test $first_word != $name
13	13	----> test $last_word != $name
93	130	----> set wraps --wraps (string escape -- $body)
37	37	-----> string escape -- $body
342	372	---> echo "function $name $wraps --description $cmd_string; $prefix $body \$argv
        end" | source
30	30	----> function fn --wraps n\ \(fzf\ --tmux\ 85\%\ --walker=\"dir,hidden\"\ --preview\ \"exa\ -la\ \{\}\"\)\;\ printf\ \"\%.0s\\n\"\ \(seq\ 1\ 100\)\;\ commandline\ -f\ repaint --description alias\ fn\ n\ \(fzf\ --tmux\ 85\%\ --walker=\"dir,hidden\"\ --preview\ \"exa\ -la\ \{\}\"\)\;\ printf\ \"\%.0s\\n\"\ \(seq\ 1\ 100\)\;\ commandline\ -f\ repaint...
3	13	---> if set -q _flag_save...
10	10	----> set -q _flag_save
66	957	--> alias ll 'eza -la --icons --git -a'
14	14	---> set -l options h/help s/save
32	32	---> argparse -n alias --max-args=2 $options -- $argv
2	9	---> if set -q _flag_help...
7	7	----> set -q _flag_help
8	8	---> set -l name
7	7	---> set -l body
8	8	---> set -l prefix
12	50	---> if not set -q argv[1]...
7	7	----> not set -q argv[1]
6	6	----> not set -q argv[2]
14	14	----> set name $argv[1]
11	11	----> set body $argv[2]
4	37	---> if test -z "$name"...
22	22	----> test -z "$name"
11	11	----> test -z "$body"
181	181	---> printf '%s\n' $body | read -l --list words
18	18	---> set -l first_word $words[1]
12	12	---> set -l last_word $words[-1]
3	16	---> if test $first_word = $name...
13	13	----> test $first_word = $name
84	106	---> set -l cmd_string (string escape -- "alias $argv")
22	22	----> string escape -- "alias $argv"
9	9	---> set -l wraps
10	136	---> if test $first_word != $name...
14	14	----> test $first_word != $name
11	11	----> test $last_word != $name
76	101	----> set wraps --wraps (string escape -- $body)
25	25	-----> string escape -- $body
215	234	---> echo "function $name $wraps --description $cmd_string; $prefix $body \$argv
        end" | source
19	19	----> function ll --wraps 'eza -la --icons --git -a' --description 'alias ll eza -la --icons --git -a'...
2	14	---> if set -q _flag_save...
12	12	----> set -q _flag_save
60	992	--> alias lt 'eza --tree --level=2 --icons --git -a'
13	13	---> set -l options h/help s/save
35	35	---> argparse -n alias --max-args=2 $options -- $argv
2	9	---> if set -q _flag_help...
7	7	----> set -q _flag_help
11	11	---> set -l name
7	7	---> set -l body
8	8	---> set -l prefix
11	49	---> if not set -q argv[1]...
7	7	----> not set -q argv[1]
6	6	----> not set -q argv[2]
13	13	----> set name $argv[1]
12	12	----> set body $argv[2]
4	27	---> if test -z "$name"...
12	12	----> test -z "$name"
11	11	----> test -z "$body"
219	219	---> printf '%s\n' $body | read -l --list words
18	18	---> set -l first_word $words[1]
12	12	---> set -l last_word $words[-1]
3	16	---> if test $first_word = $name...
13	13	----> test $first_word = $name
92	117	---> set -l cmd_string (string escape -- "alias $argv")
25	25	----> string escape -- "alias $argv"
9	9	---> set -l wraps
9	137	---> if test $first_word != $name...
13	13	----> test $first_word != $name
11	11	----> test $last_word != $name
82	104	----> set wraps --wraps (string escape -- $body)
22	22	-----> string escape -- $body
213	233	---> echo "function $name $wraps --description $cmd_string; $prefix $body \$argv
        end" | source
20	20	----> function lt --wraps 'eza --tree --level=2 --icons --git -a' --description 'alias lt eza --tree --level=2 --icons --git -a'...
2	12	---> if set -q _flag_save...
10	10	----> set -q _flag_save
60	1019	--> alias ls lsd
11	11	---> set -l options h/help s/save
101	101	---> argparse -n alias --max-args=2 $options -- $argv
2	10	---> if set -q _flag_help...
8	8	----> set -q _flag_help
9	9	---> set -l name
8	8	---> set -l body
8	8	---> set -l prefix
31	69	---> if not set -q argv[1]...
7	7	----> not set -q argv[1]
6	6	----> not set -q argv[2]
14	14	----> set name $argv[1]
11	11	----> set body $argv[2]
5	26	---> if test -z "$name"...
12	12	----> test -z "$name"
9	9	----> test -z "$body"
173	173	---> printf '%s\n' $body | read -l --list words
26	26	---> set -l first_word $words[1]
17	17	---> set -l last_word $words[-1]
2	15	---> if test $first_word = $name...
13	13	----> test $first_word = $name
90	110	---> set -l cmd_string (string escape -- "alias $argv")
20	20	----> string escape -- "alias $argv"
9	9	---> set -l wraps
16	127	---> if test $first_word != $name...
12	12	----> test $first_word != $name
11	11	----> test $last_word != $name
72	88	----> set wraps --wraps (string escape -- $body)
16	16	-----> string escape -- $body
187	228	---> echo "function $name $wraps --description $cmd_string; $prefix $body \$argv
        end" | source
41	41	----> function ls --wraps lsd --description 'alias ls lsd'...
2	12	---> if set -q _flag_save...
10	10	----> set -q _flag_save
84	1054	--> alias rmd 'rm -rf -- "$(pwd -P)" && cd ..'
55	55	---> set -l options h/help s/save
31	31	---> argparse -n alias --max-args=2 $options -- $argv
3	9	---> if set -q _flag_help...
6	6	----> set -q _flag_help
8	8	---> set -l name
8	8	---> set -l body
8	8	---> set -l prefix
11	49	---> if not set -q argv[1]...
7	7	----> not set -q argv[1]
6	6	----> not set -q argv[2]
13	13	----> set name $argv[1]
12	12	----> set body $argv[2]
4	30	---> if test -z "$name"...
15	15	----> test -z "$name"
11	11	----> test -z "$body"
167	167	---> printf '%s\n' $body | read -l --list words
17	17	---> set -l first_word $words[1]
13	13	---> set -l last_word $words[-1]
2	15	---> if test $first_word = $name...
13	13	----> test $first_word = $name
91	117	---> set -l cmd_string (string escape -- "alias $argv")
26	26	----> string escape -- "alias $argv"
8	8	---> set -l wraps
43	173	---> if test $first_word != $name...
13	13	----> test $first_word != $name
12	12	----> test $last_word != $name
83	105	----> set wraps --wraps (string escape -- $body)
22	22	-----> string escape -- $body
227	250	---> echo "function $name $wraps --description $cmd_string; $prefix $body \$argv
        end" | source
23	23	----> function rmd --wraps 'rm -rf -- "$(pwd -P)" && cd ..' --description 'alias rmd rm -rf -- "$(pwd -P)" && cd ..'...
3	12	---> if set -q _flag_save...
9	9	----> set -q _flag_save
57	760	--> alias gore2 yaegi
12	12	---> set -l options h/help s/save
30	30	---> argparse -n alias --max-args=2 $options -- $argv
3	10	---> if set -q _flag_help...
7	7	----> set -q _flag_help
8	8	---> set -l name
8	8	---> set -l body
8	8	---> set -l prefix
12	67	---> if not set -q argv[1]...
7	7	----> not set -q argv[1]
6	6	----> not set -q argv[2]
14	14	----> set name $argv[1]
28	28	----> set body $argv[2]
4	27	---> if test -z "$name"...
13	13	----> test -z "$name"
10	10	----> test -z "$body"
85	85	---> printf '%s\n' $body | read -l --list words
18	18	---> set -l first_word $words[1]
13	13	---> set -l last_word $words[-1]
2	18	---> if test $first_word = $name...
16	16	----> test $first_word = $name
82	107	---> set -l cmd_string (string escape -- "alias $argv")
25	25	----> string escape -- "alias $argv"
9	9	---> set -l wraps
9	129	---> if test $first_word != $name...
19	19	----> test $first_word != $name
12	12	----> test $last_word != $name
74	89	----> set wraps --wraps (string escape -- $body)
15	15	-----> string escape -- $body
125	142	---> echo "function $name $wraps --description $cmd_string; $prefix $body \$argv
        end" | source
17	17	----> function gore2 --wraps yaegi --description 'alias gore2 yaegi'...
2	12	---> if set -q _flag_save...
10	10	----> set -q _flag_save
31	31	--> bind \c_ 'cd ~; commandline -f repaint'
15	15	--> bind \cl 'printf "%.0s\n" (seq 1 100); commandline -f repaint'
16	16	--> bind \cc 'cd $(fd --hidden --type d . | fzf --tmux 85%  --preview "exa -la --header {}"); printf "%.0s\n" (seq 1 100); commandline -f repaint'
13	13	--> bind \ch '_fzf_search_history; printf "%.0s\n" (seq 1 100); commandline -f repaint'
12	12	--> bind \cp '_fzf_search_processes; printf "%.0s\n" (seq 1 100); commandline -f repaint'
12	12	--> bind \cf '_fzf_search_directory; printf "%.0s\n" (seq 1 100); commandline -f repaint'
45	887	--> fzf_configure_bindings --variables=\e\cv
8	8	---> status is-interactive
29	29	---> set -f options_spec h/help 'directory=?' 'git_log=?' 'git_status=?' 'history=?' 'processes=?' 'variables=?'
89	89	---> argparse --max-args=0 --ignore-unknown $options_spec -- $argv 2>/dev/null
38	716	---> if test $status -ne 0...
27	27	----> test $status -ne 0
15	15	----> set --query _flag_help
26	26	----> set -f key_sequences \e\cf \e\cl \e\cs \cr \e\cp \cv
7	7	----> set --query _flag_directory
33	33	----> set --query _flag_git_log
8	8	----> set --query _flag_git_status
11	11	----> set --query _flag_history
6	6	----> set --query _flag_processes
7	7	----> set --query _flag_variables
20	20	----> set key_sequences[6] "$_flag_variables"
10	119	----> if functions --query _fzf_uninstall_bindings...
16	16	-----> functions --query _fzf_uninstall_bindings
28	93	-----> _fzf_uninstall_bindings
39	39	------> bind --erase -- $key_sequences
26	26	------> bind --erase --mode insert -- $key_sequences
68	383	----> for mode in default insert...
16	16	-----> test -n $key_sequences[1]
19	19	-----> bind --mode $mode $key_sequences[1] _fzf_search_directory
9	9	-----> test -n $key_sequences[2]
16	16	-----> bind --mode $mode $key_sequences[2] _fzf_search_git_log
9	9	-----> test -n $key_sequences[3]
15	15	-----> bind --mode $mode $key_sequences[3] _fzf_search_git_status
10	10	-----> test -n $key_sequences[4]
15	15	-----> bind --mode $mode $key_sequences[4] _fzf_search_history
9	9	-----> test -n $key_sequences[5]
15	15	-----> bind --mode $mode $key_sequences[5] _fzf_search_processes
9	9	-----> test -n $key_sequences[6]
22	22	-----> bind --mode $mode $key_sequences[6] "$_fzf_search_vars_command"
10	10	-----> test -n $key_sequences[1]
16	16	-----> bind --mode $mode $key_sequences[1] _fzf_search_directory
9	9	-----> test -n $key_sequences[2]
15	15	-----> bind --mode $mode $key_sequences[2] _fzf_search_git_log
9	9	-----> test -n $key_sequences[3]
15	15	-----> bind --mode $mode $key_sequences[3] _fzf_search_git_status
9	9	-----> test -n $key_sequences[4]
15	15	-----> bind --mode $mode $key_sequences[4] _fzf_search_history
9	9	-----> test -n $key_sequences[5]
15	15	-----> bind --mode $mode $key_sequences[5] _fzf_search_processes
9	9	-----> test -n $key_sequences[6]
20	20	-----> bind --mode $mode $key_sequences[6] "$_fzf_search_vars_command"
16	16	----> function _fzf_uninstall_bindings --inherit-variable key_sequences...
14	14	--> bind \en fn
16	16	--> bind \ev 'v (fd --hidden . | fzf --tmux 85% --preview "if test -d {};exa -la --header {};else if test -f {};bat --style=plain --color=always {};else; {};end;")'
14	14	--> bind \ez 'zi; printf "%.0s\n" (seq 1 100); commandline -f repaint'
11	11	--> bind \eg fzf_grep
19	19	--> set -gx Z_DATA "$HOME/.z"
187	187	--> set -gx PATH "$PATH:/home/sergey/.local/share/coursier/bin"
13	13	--> set -gx fzf_fd_opts --hidden
13	13	--> set -gx EDITOR "nvim"
18	18	--> set fzf_directory_opts --bind "ctrl-o:execute(nvim {} &> /dev/tty)"
211	8353	--> set --export JAVA_HOME (dirname (dirname (readlink -f (which java))))
1721	8142	---> dirname (dirname (readlink -f (which java)))
1741	6421	----> dirname (readlink -f (which java))
1857	4680	-----> readlink -f (which java)
2823	2823	------> which java
249	249	--> set PATH $JAVA_HOME/bin $PATH
208	208	--> set -gx PATH ~/spark/bin $PATH
25	25	--> set -Ux LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu:/home/sergey/anaconda3/lib/
231	231	--> set -gx PATH "/usr/local/cuda/bin:$PATH"
16	16	--> set -gx CUDA_HOME "/usr/local/cuda"
121	774	--> export GEM_HOME="$HOME/.gem"
256	271	---> source /usr/share/fish/functions/export.fish
15	15	----> function export --description 'Set env variable. Alias for `set -gx` for bash compatibility.'...
3	17	---> if not set -q argv[1]...
14	14	----> not set -q argv[1]
24	365	---> for arg in $argv...
100	137	----> set -l v (string split -m 1 "=" -- $arg)
37	37	-----> string split -m 1 "=" -- $arg
70	204	----> switch (count $v)...
27	27	-----> count $v
11	107	-----> if contains -- $v[1] PATH CDPATH MANPATH...
22	22	------> contains -- $v[1] PATH CDPATH MANPATH
53	53	------> true
21	21	------> set -gx $v[1] $v[2]
117	117	--> set -gx PATH "$PATH:$HOME/.gem/bin"
104	104	--> set -gx PATH "$PATH:$HOME/.cargo/bin"
14	14	--> set -gx RUSTUP_TOOLCHAIN "stable"
13	13	--> set -gx ICED_BACKEND tiny-skia
89	89	--> set -gx PATH "$PATH:/home/sergey/.juliaup/bin"
89	89	--> set -gx PATH "/home/sergey/spark/bin:$PATH"
88	88	--> set -gx PATH "$PATH:/home/sergey/hadoop/bin"
150	3681	--> source ~/.config/fish/nnn.fish
30	409	---> export NNN_PLUG='b:boom;d:xdgdefault;m:mocq;p:preview-tui;j:autojump;c:fzcd;h:fzhist;o:fzopen;n:nuke;r:renamer;l:launch;f:finder;s:suedit;v:-!&codium -n -- "$PWD"*'
3	15	----> if not set -q argv[1]...
12	12	-----> not set -q argv[1]
24	364	----> for arg in $argv...
102	148	-----> set -l v (string split -m 1 "=" -- $arg)
46	46	------> string split -m 1 "=" -- $arg
79	192	-----> switch (count $v)...
56	56	------> count $v
9	57	------> if contains -- $v[1] PATH CDPATH MANPATH...
20	20	-------> contains -- $v[1] PATH CDPATH MANPATH
7	7	-------> true
21	21	-------> set -gx $v[1] $v[2]
34	346	---> export NNN_BMS="d:$HOME/Documents;D:$HOME/Downloads/;m:$HOME/Music/;c:$HOME/.config"
2	11	----> if not set -q argv[1]...
9	9	-----> not set -q argv[1]
20	301	----> for arg in $argv...
101	132	-----> set -l v (string split -m 1 "=" -- $arg)
31	31	------> string split -m 1 "=" -- $arg
75	149	-----> switch (count $v)...
23	23	------> count $v
9	51	------> if contains -- $v[1] PATH CDPATH MANPATH...
16	16	-------> contains -- $v[1] PATH CDPATH MANPATH
6	6	-------> true
20	20	-------> set -gx $v[1] $v[2]
21	288	---> export NNN_FCOLORS='0000E6310000000000000000'
2	10	----> if not set -q argv[1]...
8	8	-----> not set -q argv[1]
19	257	----> for arg in $argv...
83	107	-----> set -l v (string split -m 1 "=" -- $arg)
24	24	------> string split -m 1 "=" -- $arg
65	131	-----> switch (count $v)...
20	20	------> count $v
7	46	------> if contains -- $v[1] PATH CDPATH MANPATH...
15	15	-------> contains -- $v[1] PATH CDPATH MANPATH
6	6	-------> true
18	18	-------> set -gx $v[1] $v[2]
18	300	---> export NNN_TRASH=2
3	11	----> if not set -q argv[1]...
8	8	-----> not set -q argv[1]
17	271	----> for arg in $argv...
92	116	-----> set -l v (string split -m 1 "=" -- $arg)
24	24	------> string split -m 1 "=" -- $arg
66	138	-----> switch (count $v)...
18	18	------> count $v
7	54	------> if contains -- $v[1] PATH CDPATH MANPATH...
22	22	-------> contains -- $v[1] PATH CDPATH MANPATH
6	6	-------> true
19	19	-------> set -gx $v[1] $v[2]
22	344	---> export NNN_TMPFILE='/tmp/.lastd'
2	10	----> if not set -q argv[1]...
8	8	-----> not set -q argv[1]
18	312	----> for arg in $argv...
118	140	-----> set -l v (string split -m 1 "=" -- $arg)
22	22	------> string split -m 1 "=" -- $arg
78	154	-----> switch (count $v)...
26	26	------> count $v
10	50	------> if contains -- $v[1] PATH CDPATH MANPATH...
18	18	-------> contains -- $v[1] PATH CDPATH MANPATH
5	5	-------> true
17	17	-------> set -gx $v[1] $v[2]
69	974	---> alias l "nn -e"
14	14	----> set -l options h/help s/save
34	34	----> argparse -n alias --max-args=2 $options -- $argv
2	11	----> if set -q _flag_help...
9	9	-----> set -q _flag_help
9	9	----> set -l name
8	8	----> set -l body
8	8	----> set -l prefix
17	56	----> if not set -q argv[1]...
7	7	-----> not set -q argv[1]
5	5	-----> not set -q argv[2]
15	15	-----> set name $argv[1]
12	12	-----> set body $argv[2]
4	31	----> if test -z "$name"...
16	16	-----> test -z "$name"
11	11	-----> test -z "$body"
166	166	----> printf '%s\n' $body | read -l --list words
20	20	----> set -l first_word $words[1]
16	16	----> set -l last_word $words[-1]
3	19	----> if test $first_word = $name...
16	16	-----> test $first_word = $name
84	106	----> set -l cmd_string (string escape -- "alias $argv")
22	22	-----> string escape -- "alias $argv"
9	9	----> set -l wraps
10	129	----> if test $first_word != $name...
15	15	-----> test $first_word != $name
11	11	-----> test $last_word != $name
74	93	-----> set wraps --wraps (string escape -- $body)
19	19	------> string escape -- $body
236	256	----> echo "function $name $wraps --description $cmd_string; $prefix $body \$argv
        end" | source
20	20	-----> function l --wraps 'nn -e' --description 'alias l nn -e'...
3	13	----> if set -q _flag_save...
10	10	-----> set -q _flag_save
62	848	---> alias n "nnn -e"
13	13	----> set -l options h/help s/save
32	32	----> argparse -n alias --max-args=2 $options -- $argv
3	9	----> if set -q _flag_help...
6	6	-----> set -q _flag_help
8	8	----> set -l name
7	7	----> set -l body
8	8	----> set -l prefix
18	55	----> if not set -q argv[1]...
7	7	-----> not set -q argv[1]
5	5	-----> not set -q argv[2]
13	13	-----> set name $argv[1]
12	12	-----> set body $argv[2]
5	28	----> if test -z "$name"...
12	12	-----> test -z "$name"
11	11	-----> test -z "$body"
90	90	----> printf '%s\n' $body | read -l --list words
19	19	----> set -l first_word $words[1]
14	14	----> set -l last_word $words[-1]
2	17	----> if test $first_word = $name...
15	15	-----> test $first_word = $name
83	105	----> set -l cmd_string (string escape -- "alias $argv")
22	22	-----> string escape -- "alias $argv"
9	9	----> set -l wraps
9	124	----> if test $first_word != $name...
14	14	-----> test $first_word != $name
10	10	-----> test $last_word != $name
74	91	-----> set wraps --wraps (string escape -- $body)
17	17	------> string escape -- $body
217	235	----> echo "function $name $wraps --description $cmd_string; $prefix $body \$argv
        end" | source
18	18	-----> function n --wraps 'nnn -e' --description 'alias n nnn -e'...
2	13	----> if set -q _flag_save...
11	11	-----> set -q _flag_save
22	22	---> set --export NNN_FIFO "/tmp/nnn.fifo"
171	189	--> source ~/.config/fish/quitcd.fish
18	18	---> function n --wraps nnn --description 'support nnn quit and change directory'...
3808	3943	--> jump shell fish | source
20	20	---> function __jump_add --on-variable PWD...
3	3	---> function __jump_hint...
3	3	---> function j...
109	109	---> complete --command j --exclusive --arguments '(__jump_hint)'
275	739	--> source ~/.asdf/asdf.fish
4	24	---> if test -z $ASDF_DIR...
20	20	----> test -z $ASDF_DIR
23	23	---> set --export ASDF_DIR $ASDF_DIR
19	19	---> set -l _asdf_bin "$ASDF_DIR/bin"
10	43	---> if test -z $ASDF_DATA_DIR...
12	12	----> test -z $ASDF_DATA_DIR
21	21	----> set _asdf_shims "$ASDF_DATA_DIR/shims"
7	159	---> if not contains $_asdf_bin $PATH...
152	152	----> not contains $_asdf_bin $PATH
8	163	---> if not contains $_asdf_shims $PATH...
155	155	----> not contains $_asdf_shims $PATH
15	15	---> set --erase _asdf_bin
12	12	---> set --erase _asdf_shims
6	6	---> function asdf...
68	819	--> alias y yazi
23	23	---> set -l options h/help s/save
36	36	---> argparse -n alias --max-args=2 $options -- $argv
2	10	---> if set -q _flag_help...
8	8	----> set -q _flag_help
8	8	---> set -l name
8	8	---> set -l body
9	9	---> set -l prefix
12	54	---> if not set -q argv[1]...
8	8	----> not set -q argv[1]
6	6	----> not set -q argv[2]
15	15	----> set name $argv[1]
13	13	----> set body $argv[2]
4	29	---> if test -z "$name"...
13	13	----> test -z "$name"
12	12	----> test -z "$body"
111	111	---> printf '%s\n' $body | read -l --list words
22	22	---> set -l first_word $words[1]
15	15	---> set -l last_word $words[-1]
3	18	---> if test $first_word = $name...
15	15	----> test $first_word = $name
97	123	---> set -l cmd_string (string escape -- "alias $argv")
26	26	----> string escape -- "alias $argv"
8	8	---> set -l wraps
10	126	---> if test $first_word != $name...
15	15	----> test $first_word != $name
12	12	----> test $last_word != $name
73	89	----> set wraps --wraps (string escape -- $body)
16	16	-----> string escape -- $body
121	138	---> echo "function $name $wraps --description $cmd_string; $prefix $body \$argv
        end" | source
17	17	----> function y --wraps yazi --description 'alias y yazi'...
3	13	---> if set -q _flag_save...
10	10	----> set -q _flag_save
23	348	--> export VISUAL=nvim
3	12	---> if not set -q argv[1]...
9	9	----> not set -q argv[1]
23	313	---> for arg in $argv...
85	114	----> set -l v (string split -m 1 "=" -- $arg)
29	29	-----> string split -m 1 "=" -- $arg
81	176	----> switch (count $v)...
34	34	-----> count $v
12	61	-----> if contains -- $v[1] PATH CDPATH MANPATH...
22	22	------> contains -- $v[1] PATH CDPATH MANPATH
7	7	------> true
20	20	------> set -gx $v[1] $v[2]
18	289	--> export EDITOR=nvim
2	10	---> if not set -q argv[1]...
8	8	----> not set -q argv[1]
18	261	---> for arg in $argv...
87	109	----> set -l v (string split -m 1 "=" -- $arg)
22	22	-----> string split -m 1 "=" -- $arg
67	134	----> switch (count $v)...
18	18	-----> count $v
9	49	-----> if contains -- $v[1] PATH CDPATH MANPATH...
16	16	------> contains -- $v[1] PATH CDPATH MANPATH
6	6	------> true
18	18	------> set -gx $v[1] $v[2]
10722	16283	--> atuin init fish --disable-up-arrow | source
149	5233	---> set -gx ATUIN_SESSION (atuin uuid)
5084	5084	----> atuin uuid
18	18	---> set --erase ATUIN_HISTORY_ID
10	10	---> function _atuin_preexec --on-event fish_preexec...
6	6	---> function _atuin_postexec --on-event fish_postexec...
3	3	---> function _atuin_search...
8	8	---> function _atuin_bind_up...
21	21	---> bind \cr _atuin_search
21	262	---> if bind -M insert > /dev/null 2>&1...
213	213	----> bind -M insert > /dev/null 2>&1
28	28	----> bind -M insert \cr _atuin_search
7541	14140	--> starship init fish | source
-1851	6599	---> source (/usr/local/bin/starship init fish --print-full-init | psub)
446	5369	----> /usr/local/bin/starship init fish --print-full-init | psub
446	462	-----> source /usr/share/fish/functions/psub.fish
16	16	------> function psub --description "Read from stdin into a file and output the filename. Remove the file when the command that called psub exits."...
41	41	-----> set -l options -x 'f,F' -x 'F,s' h/help f/file F/fifo 's/suffix=' T-testing
55	55	-----> argparse -n psub --max-args=0 $options -- $argv
3	13	-----> if set -q _flag_help...
10	10	------> set -q _flag_help
10	10	-----> set -l dirname
10	10	-----> set -l filename
9	9	-----> set -l funcname
2	13	-----> if not status --is-command-substitution...
11	11	------> not status --is-command-substitution
11	11	-----> set -l tmpdir /tmp
7	7	-----> set -q TMPDIR
25	3808	-----> if set -q _flag_fifo...
7	7	------> set -q _flag_fifo
17	17	------> test -z "$_flag_suffix"
150	1903	------> set filename (mktemp $tmpdir/.psub.XXXXXXXXXX)
1753	1753	-------> mktemp $tmpdir/.psub.XXXXXXXXXX
1856	1856	------> command cat >$filename
40	40	-----> echo $filename
4	18	-----> if set -q _flag_testing...
14	14	------> set -q _flag_testing
14	396	-----> while true
...
9	9	------> true
113	187	------> set funcname __fish_psub_(random)
74	74	-------> random
8	186	------> if not functions $funcname >/dev/null 2>/dev/null...
166	166	-------> not functions $funcname >/dev/null 2>/dev/null
12	12	-------> break
30	30	-----> function $funcname --on-job-exit caller --inherit-variable filename --inherit-variable dirname --inherit-variable funcname...
7	7	----> function fish_prompt...
4	4	----> function fish_right_prompt...
26	26	----> set -g VIRTUAL_ENV_DISABLE_PROMPT 1
11	11	----> builtin functions -e fish_mode_prompt
19	19	----> set -gx STARSHIP_SHELL "fish"
13	13	----> function reset-transient --on-event fish_postexec...
3	3	----> function transient_execute...
8	8	----> function enable_transience --description 'enable transient prompt keybindings'...
7	7	----> function disable_transience --description 'remove transient prompt keybindings'...
104	475	----> set -gx STARSHIP_SESSION_KEY (string sub -s1 -l16 (random)(random)(random)(random)(random)0000000000000000)
307	371	-----> string sub -s1 -l16 (random)(random)(random)(random)(random)0000000000000000
21	21	------> random
12	12	------> random
11	11	------> random
10	10	------> random
10	10	------> random
44	2508	----> __fish_psub_2784 JOB_EXIT 0 0
2416	2416	-----> command rm $filename
2	30	-----> if test -n "$dirname"...
28	28	------> test -n "$dirname"
18	18	-----> functions -e $funcname
17	1946	--> if test -f ~/anaconda3/bin/conda...
29	29	---> test -f ~/anaconda3/bin/conda
760	1347	---> source ~/anaconda3/etc/fish/conf.d/conda.fish
24	24	----> set -gx CONDA_EXE "/home/sergey/anaconda3/bin/conda"
19	19	----> set _CONDA_ROOT "/home/sergey/anaconda3"
16	16	----> set _CONDA_EXE "/home/sergey/anaconda3/bin/conda"
15	15	----> set -gx CONDA_PYTHON_EXE "/home/sergey/anaconda3/bin/python"
3	13	----> if not set -q CONDA_SHLVL...
10	10	-----> not set -q CONDA_SHLVL
6	6	----> function __conda_add_prompt...
11	121	----> if functions -q fish_prompt...
13	13	-----> functions -q fish_prompt
5	87	-----> if not functions -q __fish_prompt_orig...
63	63	------> not functions -q __fish_prompt_orig
19	19	------> functions -c fish_prompt __fish_prompt_orig
10	10	-----> functions -e fish_prompt
3	3	----> function return_last_status...
2	2	----> function fish_prompt...
7	104	----> if functions -q fish_right_prompt...
9	9	-----> functions -q fish_right_prompt
5	78	-----> if not functions -q __fish_right_prompt_orig...
61	61	------> not functions -q __fish_right_prompt_orig
12	12	------> functions -c fish_right_prompt __fish_right_prompt_orig
10	10	-----> functions -e fish_right_prompt
3	3	----> function fish_right_prompt...
10	10	----> function conda --inherit-variable CONDA_EXE...
3	3	----> function __fish_conda_commands...
3	3	----> function __fish_conda_env_commands...
3	3	----> function __fish_conda_envs...
3	3	----> function __fish_conda_packages...
2	2	----> function __fish_conda_needs_command...
10	10	----> function __fish_conda_using_command...
45	45	----> complete -f -c conda -n __fish_conda_needs_command -a '(__fish_conda_commands)'
35	35	----> complete -f -c conda -n '__fish_conda_using_command env' -a '(__fish_conda_env_commands)'
33	33	----> complete -f -c conda -n '__fish_conda_using_command activate' -a '(__fish_conda_envs)'
29	29	----> complete -f -c conda -n '__fish_conda_using_command remove' -a '(__fish_conda_packages)'
30	30	----> complete -f -c conda -n '__fish_conda_using_command uninstall' -a '(__fish_conda_packages)'
28	28	----> complete -f -c conda -n '__fish_conda_using_command upgrade' -a '(__fish_conda_packages)'
27	27	----> complete -f -c conda -n '__fish_conda_using_command update' -a '(__fish_conda_packages)'
173	173	---> set -gx PATH "/home/sergey/anaconda3/bin/:$PATH"
31	380	---> export PYTHON_NAME="base"
3	17	----> if not set -q argv[1]...
14	14	-----> not set -q argv[1]
27	332	----> for arg in $argv...
106	147	-----> set -l v (string split -m 1 "=" -- $arg)
41	41	------> string split -m 1 "=" -- $arg
75	158	-----> switch (count $v)...
25	25	------> count $v
10	58	------> if contains -- $v[1] PATH CDPATH MANPATH...
21	21	-------> contains -- $v[1] PATH CDPATH MANPATH
7	7	-------> true
20	20	-------> set -gx $v[1] $v[2]
3584	6859	--> zoxide init fish | source
9	9	---> function __zoxide_pwd...
15	801	---> if ! builtin functions --query __zoxide_cd_internal...
80	80	----> ! builtin functions --query __zoxide_cd_internal
694	706	----> string replace --regex -- '^function cd\s' 'function __zoxide_cd_internal ' <$__fish_data_dir/functions/cd.fish | source
12	12	-----> function __zoxide_cd_internal --description "Change directory"...
4	4	---> function __zoxide_cd...
9	9	---> function __zoxide_hook --on-variable PWD...
3	3	---> function __zoxide_z...
3	3	---> function __zoxide_z_complete...
40	40	---> complete --command __zoxide_z --no-files --arguments '(__zoxide_z_complete)'
3	3	---> function __zoxide_zi...
124	166	---> abbr --erase z &>/dev/null
42	42	----> source /usr/share/fish/functions/abbr.fish
72	1114	---> alias z=__zoxide_z
18	18	----> set -l options h/help s/save
37	37	----> argparse -n alias --max-args=2 $options -- $argv
4	15	----> if set -q _flag_help...
11	11	-----> set -q _flag_help
11	11	----> set -l name
8	8	----> set -l body
9	9	----> set -l prefix
19	200	----> if not set -q argv[1]...
10	10	-----> not set -q argv[1]
6	6	-----> not set -q argv[2]
103	133	-----> set -l tmp (string split -m 1 "=" -- $argv) ""
30	30	------> string split -m 1 "=" -- $argv
18	18	-----> set name $tmp[1]
14	14	-----> set body $tmp[2]
6	32	----> if test -z "$name"...
15	15	-----> test -z "$name"
11	11	-----> test -z "$body"
127	127	----> printf '%s\n' $body | read -l --list words
21	21	----> set -l first_word $words[1]
15	15	----> set -l last_word $words[-1]
2	19	----> if test $first_word = $name...
17	17	-----> test $first_word = $name
100	125	----> set -l cmd_string (string escape -- "alias $argv")
25	25	-----> string escape -- "alias $argv"
11	11	----> set -l wraps
12	130	----> if test $first_word != $name...
15	15	-----> test $first_word != $name
12	12	-----> test $last_word != $name
75	91	-----> set wraps --wraps (string escape -- $body)
16	16	------> string escape -- $body
230	247	----> echo "function $name $wraps --description $cmd_string; $prefix $body \$argv
        end" | source
17	17	-----> function z --wraps __zoxide_z --description 'alias z=__zoxide_z'...
3	17	----> if set -q _flag_save...
14	14	-----> set -q _flag_save
48	48	---> abbr --erase zi &>/dev/null
73	1075	---> alias zi=__zoxide_zi
16	16	----> set -l options h/help s/save
30	30	----> argparse -n alias --max-args=2 $options -- $argv
1	9	----> if set -q _flag_help...
8	8	-----> set -q _flag_help
9	9	----> set -l name
8	8	----> set -l body
8	8	----> set -l prefix
17	184	----> if not set -q argv[1]...
8	8	-----> not set -q argv[1]
6	6	-----> not set -q argv[2]
93	123	-----> set -l tmp (string split -m 1 "=" -- $argv) ""
30	30	------> string split -m 1 "=" -- $argv
17	17	-----> set name $tmp[1]
13	13	-----> set body $tmp[2]
3	30	----> if test -z "$name"...
14	14	-----> test -z "$name"
13	13	-----> test -z "$body"
182	182	----> printf '%s\n' $body | read -l --list words
20	20	----> set -l first_word $words[1]
13	13	----> set -l last_word $words[-1]
3	18	----> if test $first_word = $name...
15	15	-----> test $first_word = $name
84	112	----> set -l cmd_string (string escape -- "alias $argv")
28	28	-----> string escape -- "alias $argv"
11	11	----> set -l wraps
9	126	----> if test $first_word != $name...
15	15	-----> test $first_word != $name
11	11	-----> test $last_word != $name
75	91	-----> set wraps --wraps (string escape -- $body)
16	16	------> string escape -- $body
196	213	----> echo "function $name $wraps --description $cmd_string; $prefix $body \$argv
        end" | source
17	17	-----> function zi --wraps __zoxide_zi --description 'alias zi=__zoxide_zi'...
2	13	----> if set -q _flag_save...
11	11	-----> set -q _flag_save
4	14	--> if not set -q TMUX...
10	10	---> not set -q TMUX
14	14	-> set fish_greeting
