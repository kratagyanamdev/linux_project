# Linux User Creation Script

This Bash script (`create_user.sh`) automates the process of creating a user on a Linux system with enhanced functionalities. It is designed to simplify user management tasks.

## Features

- **Root User Requirement:** The script must be executed with sudo or root privileges to create users and set passwords.

- **User Creation:** Create a new user with a specified username and optional comments field.

- **Password Generation:** The script generates a strong password for the newly created user.

- **Password Setting:** Set the generated password for the user.

- **Password Expiry:** Enforce password change on the user's first login for enhanced security.

## Usage

Execute the script with sudo or root user:

```bash
sudo ./create_user.sh user_name [comment]....
