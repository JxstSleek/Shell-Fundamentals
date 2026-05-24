#!/bin/bash

# File to store tasks
todo_file="$HOME/todo.txt"

# Create the file if it doesn't Exist
touch "$todo_file"


while true
do
        echo "========================="
        echo "      TO-DO MANAGER      "
        echo "========================="
        echo "1. View all Task"
        echo "2. Add a new Task"
        echo "3. Delete a new Task"
        echo "4. Exit"
        echo "========================="

        read -p "Choose an option: " choice

        case $choice in
                1)
                        echo ""
                        echo "------ YOUR TASK ------"

                        if [ ! -s "$todo_file" ]; then
                                echo "No task found."

                        else
                                nl -w2 -s'. ' "$todo_file"
                        fi

                        echo""
                        ;;

                2)
                        echo ""
                        read -p "Enter new Task: " task

                        if [ -n "$task" ]; then
                                echo "$task" >> "$todo_file"
                                echo "Task Added Successfully"

                        else
                                echo "Task cannot be Empty"
                        fi

                        echo ""
                        ;;

                3)
                        echo ""
                        echo "------- DELETE TASK ------"

                        if [ ! -s "$todo_file" ]; then
                                echo "No task available to delete."
                        else
                                nl -w2 -s'. ' "$todo_file"

                                read -p "Enter task number to Delete: " task_num
                                sed -i "${task_num}d" "$todo_file"
                                echo "Task Deleted Successfully!"
                        fi

                        echo ""
                        ;;

                4)
                        echo "Exiting To-Do Manager..."
                        break
                        ;;
