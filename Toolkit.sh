#!/bin/bash

while true
do
    echo "=========================================="
    echo "    🛠️  Smart SysAdmin & File Toolkit 🛠️    "
    echo "=========================================="
    echo "1) Check File or Folder status"
    echo "2) Print Even Numbers (Loops with Break/Continue)"
    echo "3) Advanced Security Check (Complex Conditions)"
    echo "4) ❌ Exit Program"
    echo "=========================================="
    
    read -p "📝 Please choose an option (1-4): " choice
    echo "------------------------------------------"
    
    case $choice in
        1)
            read -p "📁 Enter File or Folder path to check: " path
            
            if [ -f "$path" ] ; then
                echo "✅ This is a [FILE] and it exists on your system."
                elif [ -d "$path" ] ; then
                echo "📂 This is a [FOLDER/DIRECTORY] and it exists on your system."
            else
                echo "❌ Path NOT found! (Neither a file nor a folder)."
            fi
        ;;
        
        2)
            read -p "🔢 Enter a number to print even numbers up to: " max_num
            
            if [ -z "$max_num" ]; then
                echo "⚠️ You did not enter any number!"
                continue
            fi
            
            echo "⏳ Printing even numbers..."
            for (( i=1; i<=$max_num; i++ ))
            do
                if [ $i -gt 20 ]; then
                    echo "⚠️ Limit reached (20). Stopping the loop."
                    break
                fi
                
                rem=$(( $i % 2 ))
                if [ $rem -ne 0 ]; then
                    continue
                fi
                
                echo "🔹 Even Number: $i"
            done
        ;;
        
        3)
            read -p "👤 Enter Username: " user
            read -p "🔢 Enter Age: " age
            
            if [ "$user" == "alrawy" ] && [ "$age" -gt 18 ] || [ "$user" == "admin" ]
            then
                echo "🔓 Verification Successful! Access Granted."
            else
                echo "🔒 Verification Failed! Access Denied."
            fi
        ;;
        
        4)
            echo "👋 Thank you for using the script. Goodbye!"
            break
        ;;
        
        *)
            echo "❌ Invalid choice! Please select a number from 1 to 4."
        ;;
    esac
    
    echo ""
    read -p "⌨️ Press [Enter] to continue and show Menu again..." temp
    clear
done
