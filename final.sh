#!/bin/bash

# =====================================================================
# 20. Automation Script: Smart Log Analyzer Tool
# 04. Comments & Info
# =====================================================================

# 16. Arrays: Defining system levels to check
LEVELS=("ERROR" "WARNING" "INFO")

# 15. Functions: Clean Screen and Show Header
show_header() {
    clear
    echo "=================================================="
    echo "   📊  Welcome to Smart Log Analyzer Tool 📊    "
    echo "=================================================="
}

# 15. Functions: Create a fake sample log file for testing
create_sample_log() {
    # 18. Redirection (>) to create/overwrite a sample log file
    echo "2026-08-20 10:15:01 INFO - User Ahmed logged in successfully." > server.log
    echo "2026-08-20 10:16:45 WARNING - High memory usage detected." >> server.log
    echo "2026-08-20 10:18:22 ERROR - Database connection failed!" >> server.log
    echo "2026-08-20 10:19:10 INFO - Backup script started." >> server.log
    echo "2026-08-20 10:22:14 ERROR - Permission denied for reporter.sh" >> server.log
    echo "2026-08-20 10:25:30 WARNING - Disk space is reaching 90%." >> server.log
}

# 15. Functions: Analyze log file using Text Processing tools
analyze_logs() {
    show_header
    echo "⏳ Analyzing 'server.log' file now..."
    echo "--------------------------------------------------"

    # 17 & 18. Using grep, wc, Pipes (|) and Redirection (>>) to count lines
    total_lines=$(wc -l < server.log)
    echo "📊 Total log entries found: $total_lines"
    
    # 12. Loops: Looping through the array elements
    for level in "${LEVELS[@]}"
    do
        # 17 & 18. grep to filter and wc to count lines
        count=$(grep -c "$level" server.log)
        echo "🔹 Number of [$level] entries: $count"
    done
    echo "--------------------------------------------------"
    
    # 17 & 18. Advanced Text Processing (grep + cut + sort)
    # Extracts ONLY the error messages (fields after the '-' symbol)
    echo "🚫 List of Unique Error Messages:"
    grep "ERROR" server.log | cut -d'-' -f2 | sort >> error_report.txt
    
    # 18. Printing the saved report from the file
    cat error_report.txt
    echo "--------------------------------------------------"
    # 07. Exit Status check
    echo "📉 Exit Status of analysis: $?"
    echo "📝 Full error list saved into 'error_report.txt'"
}

# =====================================================================
# Main Menu (Combining everything from loops, case, and conditions)
# =====================================================================
create_sample_log

while true
do
    show_header
    # 14. Interactive Menu (case statement)
    echo "1) Run Smart Log Analysis"
    echo "2) View original server.log file"
    echo "3) ❌ Exit Program"
    echo "=================================================="
    
    # 06. Read command
    read -p "📝 Enter your choice (1-3): " menu_choice
    
    case $menu_choice in
        1)
            analyze_logs
            ;;
        2)
            show_header
            echo "📄 Displaying 'server.log' content:"
            echo "--------------------------------------------------"
            cat server.log
            ;;
        3)
            echo "👋 Thank you for using the Automation Tool. Goodbye!"
            # 13. Break to exit the while loop
            break
            ;;
        *)
            echo "❌ Invalid choice! Please select 1, 2, or 3."
            ;;
    esac
    
    echo ""
    read -p "⌨️ Press [Enter] to return to Menu..." temp
done

