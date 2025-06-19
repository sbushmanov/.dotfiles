# Defined in /home/sergey/.config/fish/functions/g8-scala3-zed.fish
function g8-scala3-zed
    set -l template_path "file:///home/sergey/scala3.g8"
    set -l project_name ""
    set -l package_name ""
    set -l processed_args

    # Process each argument
    for arg in $argv
        if string match -q -- "--name=*" $arg
            # Extract the original name value
            set -l name_value (string replace -- "--name=" "" $arg)
            set project_name $name_value
            # Pass the original name unchanged
            set -a processed_args "--name=$name_value"
            # Create lowercase, underscore-stripped version for package
            set package_name (string lower $name_value | string replace -a '_' '')
            set -a processed_args "--package=$package_name"
        else
            # Pass other args unchanged
            set -a processed_args $arg
        end
    end

    # Run g8 with processed arguments and capture the created directory
    set -l created_dir (ls -td -- */ | head -n 1 | string trim --right --chars '/')
    g8 $template_path $processed_args

    # Navigate to project directory
    if test -n "$project_name"
        # If the template created a lowercase directory, rename it to the original case
        set -l actual_dir (string lower $project_name)
        if test -d "$actual_dir" -a "$actual_dir" != "$project_name"
            mv "$actual_dir" "$project_name"
        end
        if test -d "$project_name"
            cd $project_name
            # Rename src/main/scala directory to package_name if needed
            if test -d "src/main/scala/$project_name" -o -d "src/main/scala/$actual_dir"
                if test -d "src/main/scala/$project_name"
                    mv "src/main/scala/$project_name" "src/main/scala/$package_name"
                else if test -d "src/main/scala/$actual_dir"
                    mv "src/main/scala/$actual_dir" "src/main/scala/$package_name"
                end
                # Update package names in Scala files
                find src/main/scala -type f -name "*.scala" -exec sed -i "s/package $project_name/package $package_name/g" {} +
                find src/main/scala -type f -name "*.scala" -exec sed -i "s/package $actual_dir/package $package_name/g" {} +
            end
            zed .
        else
            echo "Failed to find or create project directory ($project_name)."
            return 1
        end
    else
        # Fallback if no --name provided
        if test -n "$created_dir"
            cd $created_dir
            set project_name (basename $created_dir)
            set package_name (string lower $project_name | string replace -a '_' '')
            if test -d "src/main/scala/$project_name"
                mv "src/main/scala/$project_name" "src/main/scala/$package_name"
                find src/main/scala -type f -name "*.scala" -exec sed -i "s/package $project_name/package $package_name/g" {} +
            end
            zed .
        else
            echo "Failed to determine the project directory."
            return 1
        end
    end
end
