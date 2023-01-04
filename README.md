# Macro-Express
Uses an AutoHotKey script with pre-created macros which call Python functions to update Google Sheets.
Updates Google sheets from selected (highlighted) text and hitting a button. Macros are pre-set and displayed in the GUI.
AHK script works by copying selected text, activating the python terminal, calling the appropriate function and passing the selected text as an argument.
Rows and worksheet information are saved in a text file so users can pick up where they left off. 

I created this to make collecting data faster for a marketing project in 2022, and to make it easy for others to run and use the scripts.

Note: There is an AutoHotKey library for Python, which this project didn't use because I already had an AHK script written. And because the AHK script and GUI are actually separate processes, I had to thread the GUI so the terminal was available for the AHK script to access (without threading the GUI, the terminal was locked up and the AHK script couldn't call the Python functions through it). I did not get around to creating an executable to share with others like I wanted, so I'm not sure if an executable version would have the terminal available like that anyway. 
