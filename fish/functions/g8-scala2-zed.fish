function g8-scala2-zed
    set -l template_path "file:///home/sergey/scala2.g8/"
    set -l project_name ""

    # Check if --name is provided in the arguments
    for arg in $argv
        if string match -q -- "--name=*" $arg
            set project_name (string replace -- "--name=" "" $arg | string lower)
        end
    end

    # Run the g8 command
    g8 $template_path $argv

    # If --name was provided, cd into the project directory and open the file
    if test -n "$project_name"
        cd $project_name
        zed .
    else
        # If --name was not provided, g8 will prompt for it
        # We need to extract the project name from the output or assume it's the last directory created
        set -l new_dir (ls -td -- */ | head -n 1)
        if test -n "$new_dir"
            cd $new_dir
            set -l inferred_project_name (basename $new_dir)
            zed .
        else
            echo "Failed to determine the project directory."
        end
    end
end
