# Hosts File Manager for Windows

This batch script allows you to easily manage entries in the Windows `hosts` file. It enables you to:
- Add a new IP address and hostname entry.
- Update the IP address of an existing hostname.
- Remove the old entry for a hostname before updating it with a new IP.
- Display the current content of the `hosts` file before and after the modification.

## Features
- **Dynamic Input:** The script prompts the user for an IP address and hostname to add or update.
- **Validation:** Checks if the hostname already exists in the `hosts` file.
- **Clear Display:** The screen is cleared after input and the updated `hosts` file content is shown.
- **No Duplicates:** If the hostname exists, it will update the IP; otherwise, it will add a new entry.

## Prerequisites
- **Windows 11/10:** This script is designed to work on Windows systems.
- **Administrator Access:** You need to run the script with administrator privileges to modify the `hosts` file.

## How to Use

1. **Download the Script**: Clone this repository or download the `update-hosts.bat` file.
2. **Run as Administrator**: Right-click on `update-hosts.bat` and select `Run as Administrator`.
3. **Follow the Prompts**:
   - Enter the **IP address** when prompted.
   - Enter the **hostname** when prompted.
4. The script will:
   - Display the current content of the `hosts` file.
   - Add or update the entry based on your input.
   - Clear the screen and display the updated `hosts` file.

### Example

```batch
Masukkan IP Address: 127.0.0.1
Masukkan Hostname: mylocalwebsite.com

### Output
Hostname mylocalwebsite.com berhasil ditambahkan dengan IP 127.0.0.1.
