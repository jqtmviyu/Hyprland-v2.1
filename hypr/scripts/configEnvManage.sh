#!/bin/bash

# Configuration file path
CONFIG_FILE=~/.config/hypr/config.env

# Initialize or create config file
create_config() {
    config_dir="$(dirname "$CONFIG_FILE")"

    if ! mkdir -p "$config_dir"; then
        echo "Error: Unable to create config directory" >&2
        return 1
    fi

    if [ ! -f "$CONFIG_FILE" ]; then
        chmod 644 "$CONFIG_FILE"
    fi
}

# Get value by key from config file
get_config() {
    key="$1"

    if [ ! -f "$CONFIG_FILE" ]; then
        echo "Error: Config file does not exist" >&2
        return 1
    fi

    value=$(grep "^${key}=" "$CONFIG_FILE" | cut -d '=' -f2-)
    echo "$value"
}

# Set or update key-value pair in config file
set_config() {
    key="$1"
    value="$2"

    if [ ! -f "$CONFIG_FILE" ]; then
        create_config
    fi

    if grep -q "^${key}=" "$CONFIG_FILE"; then
        sed -i "s|^${key}=.*|${key}=${value}|" "$CONFIG_FILE"
    else
        echo "${key}=${value}" >> "$CONFIG_FILE"
    fi
}

# Delete key-value pair from config file
delete_config() {
    key="$1"

    if [ ! -f "$CONFIG_FILE" ]; then
        echo "Error: Config file does not exist" >&2
        return 1
    fi

    sed -i "/^${key}=/d" "$CONFIG_FILE"
}

# Main function: handle command line arguments
main() {
    case "$1" in
        "get")
            if [ -z "$2" ]; then
                echo "Usage: $0 get <key>" >&2
                exit 1
            fi
            get_config "$2"
            ;;
        "set")
            if [ -z "$2" ] || [ -z "$3" ]; then
                echo "Usage: $0 set <key> <value>" >&2
                exit 1
            fi
            set_config "$2" "$3"
            ;;
        "delete")
            if [ -z "$2" ]; then
                echo "Usage: $0 delete <key>" >&2
                exit 1
            fi
            delete_config "$2"
            ;;
        "init")
            create_config
            ;;
        *)
            echo "Usage: $0 <command> [arguments]" >&2
            echo "Available commands:" >&2
            echo "  init              Initialize config file" >&2
            echo "  get <key>         Get config value" >&2
            echo "  set <key> <value> Set config value" >&2
            echo "  delete <key>      Delete config entry" >&2
            exit 1
            ;;
    esac
}

# Only run main function when script is executed directly
if [ "${BASH_SOURCE[0]}" = "$0" ]; then
    main "$@"
fi
