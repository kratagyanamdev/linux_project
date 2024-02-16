#!/bin/bash 

#script should be executed with sudp/root user 
if [[ "${UID}" -ne 0 ]]
then
        echo 'please run with sudo or root user '
        exit 1 
fi 

#user should provide atleast one argument as username else guide 
if [[ "${#}" -lt 1 ]]
then    
	echo "usage ${0} user_name [comment]...."
	echo "create a user with name user_name and comments field of comment"
	exit 1 

fi 
#store 1st argument as user name 
user_name="${1}"
echo $user_name

# in case of more than one argument, store it as account commnets 
shift 
comment="${@}" 

#create a password 
PASSWORD=$(date +%s%N)


#create the user 
useradd -c "${comment}" -m $user_name 

# check if user is successfully created or not 
if [[ $? -ne 0 ]]
then 
	echo "the account could not be created"
	exit 1
fi 


# set the password for the user 
echo "${user_name}:${PASSWORD}" | chpasswd 

# check if password is successfully set or not
if [[ $? -ne 0 ]]
then 
	echo "password could not be set"
	exit 1
fi 

# force password change on first login 
passwd -e $user_name

# Display the username, password and the host where the user was created 
echo "Username: $user_name"
echo "Password: $PASSWORD"
echo 
echo $(hostname)


