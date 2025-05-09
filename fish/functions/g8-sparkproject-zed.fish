function g8-sparkproject-zed
    set -l template_path "file:///home/sergey/spark-project.g8"
    set -l project_name ""
    set -l processed_args

    # Process each argument
    for arg in $argv
        if string match -q -- "--name=*" $arg
            # Extract and lowercase the name value
            set -l name_value (string replace -- "--name=" "" $arg | string lower)
            set -a processed_args "--name=$name_value"
            set project_name $name_value
        else
            # Pass other args unchanged
            set -a processed_args $arg
        end
    end

    # Run g8 with processed arguments (now with forced lowercase name)
    g8 $template_path $processed_args

    # Rest of the logic remains the same
    if test -n "$project_name"
        cd $project_name
        zed .
    else
        set -l new_dir (ls -td -- */ | head -n 1)
        if test -n "$new_dir"
            cd $new_dir
            zed .
        else
            echo "Failed to determine the project directory."
        end
    end
end
