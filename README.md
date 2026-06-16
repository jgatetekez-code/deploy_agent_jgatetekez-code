## Automated Project Setup

### DESCRIPTION

This project uses a Bash script (setup_project.sh) to automatically set up a Student Attendance Tracker workspace. The script creates the required folder structure, copies project files, allows users to update attendance thresholds, checks if Python 3 is installed, and verifies that all required files are present.

It also includes signal handling with trap, which allows the script to safely create an archive and clean up incomplete files if the user interrupts the process using Ctrl + C.
The goal of this project is to demonstrate Bash scripting skills, automation, configuration management, environment validation, and basic process management.


### Executing instructions

1. *Clone my repository*
```bash
git clone https://github.com/deploy_agent_jgatetekez-code

cd deploy_agent_jgatetekez-code
```

2. *Use CHMOD to add the execute permission*

```bash
chmod u+x setup_project.sh
```

3. *run the script*

```bash
./setup_project.sh
```

4. *Triggering the interupt signal*
```text
When the script is running, you can press `ctrl + c` or even send the kill signal, and the script will archive the current progress for you
```