#!/usr/bin/env bash
# ─────────────────────────────────────────
#  exvy.sh — terminal portfolio
# ─────────────────────────────────────────
 
# Colors
GRN='\033[38;2;0;255;136m'
DIM='\033[38;2;0;180;90m'
YLW='\033[38;2;255;215;0m'
RED='\033[38;2;255;79;79m'
BLU='\033[38;2;79;163;255m'
WHT='\033[38;2;240;240;240m'
MUT='\033[38;2;100;100;100m'
TXT='\033[38;2;200;200;200m'
RST='\033[0m'
BLD='\033[1m'
 
# ── Helpers ───────────────────────────────
clear_screen() { printf '\033[2J\033[H'; }
move()         { printf '\033[%d;%dH' "$1" "$2"; }
hide_cursor()  { printf '\033[?25l'; }
show_cursor()  { printf '\033[?25h'; }
trap 'show_cursor; echo ""; exit' INT TERM EXIT
 
# ── Boot loader ───────────────────────────
boot() {
  hide_cursor
  clear_screen
 
  echo ""
  printf "  ${WHT}Loading Modules${RST}\n"
  echo ""
 
  local total=40
  local filled=0
  printf "  ${GRN}["
 
  while [ $filled -lt $total ]; do
    printf "${GRN}%%"
    filled=$((filled + 1))
    remaining=$((total - filled))
    # Redraw the bar in place
    printf "${RST}\033[2K\r  ${GRN}["
    for ((i=0; i<filled; i++));  do printf "${GRN}%%"; done
    for ((i=0; i<remaining; i++)); do printf "${MUT}-"; done
    pct=$(( filled * 100 / total ))
    printf "${GRN}] ${WHT}%3d%%${RST}" $pct
    sleep 0.04
  done
 
  echo ""
  echo ""
  printf "  ${GRN}open${RST}\n"
  sleep 0.8
}
 
# ── ASCII name ────────────────────────────
print_name() {
  echo ""
  printf "${GRN}"
  printf '  ███████╗██╗  ██╗██╗   ██╗██╗   ██╗\n'
  printf '  ██╔════╝╚██╗██╔╝██║   ██║╚██╗ ██╔╝\n'
  printf '  █████╗   ╚███╔╝ ██║   ██║ ╚████╔╝ \n'
  printf '  ██╔══╝   ██╔██╗ ╚██╗ ██╔╝  ╚██╔╝  \n'
  printf '  ███████╗██╔╝ ██╗ ╚████╔╝    ██║   \n'
  printf '  ╚══════╝╚═╝  ╚═╝  ╚═══╝     ╚═╝   \n'
  printf "${RST}"
  printf "  ${MUT}developer · learner · builder${RST}\n"
  echo ""
  printf "  ${MUT}────────────────────────────────────${RST}\n"
  echo ""
}
 
# ── Commands ──────────────────────────────
cmd_help() {
  printf "  ${BLU}%-20s${RST} ${MUT}%s${RST}\n" "help"        "show available commands"
  printf "  ${BLU}%-20s${RST} ${MUT}%s${RST}\n" "whoami"      "who is viewing this"
  printf "  ${BLU}%-20s${RST} ${MUT}%s${RST}\n" "ls skills/"  "languages and tools"
  printf "  ${BLU}%-20s${RST} ${MUT}%s${RST}\n" "ls links/"   "social and contact links"
  printf "  ${BLU}%-20s${RST} ${MUT}%s${RST}\n" "cat bio.md"  "read the full bio"
  printf "  ${BLU}%-20s${RST} ${MUT}%s${RST}\n" "clear"       "clear the terminal"
  printf "  ${BLU}%-20s${RST} ${MUT}%s${RST}\n" "exit"        "quit"
}
 
cmd_whoami() {
  printf "  ${MUT}%-12s${RST} ${GRN}${BLD}Exvy${RST}\n"          "name"
  printf "  ${MUT}%-12s${RST} ${TXT}developer / builder${RST}\n"  "role"
  printf "  ${MUT}%-12s${RST} ${TXT}Lua, Bash, Chromebook security${RST}\n" "learning"
  printf "  ${MUT}%-12s${RST} ${GRN}${BLD}actively building${RST}\n"        "status"
  printf "  ${MUT}%-12s${RST} ${TXT}you — reading this right now${RST}\n"   "visitor"
}
 
cmd_skills() {
  printf "  ${TXT}Lua${RST}\n"
  printf "  ${TXT}Bash${RST}\n"
  printf "  ${TXT}Chromebook Exploiting${RST}\n"
}
 
cmd_links() {
  printf "  ${GRN}GitHub${RST}   ${MUT}github.com/sunlitos/myscripts/tree/main${RST}\n"
  printf "  ${GRN}Discord${RST}  ${MUT}envysplague${RST}\n"
  printf "  ${GRN}Website${RST}  ${MUT}enrolledocs.org${RST}\n"
}
 
cmd_bio() {
  printf "  ${TXT}Hey, I'm ${GRN}${BLD}Exvy${RST}${TXT} — a developer constantly pushing\n"
  printf "  limits and learning new things.\n\n"
  printf "  Coding in ${GRN}Lua${RST}${TXT} and picking up ${GRN}Bash scripting${RST}${TXT} for\n"
  printf "  automation and system work. Also exploring\n"
  printf "  ${GRN}Chromebook security and exploiting${RST}${TXT} — understanding\n"
  printf "  how systems work under the hood.\n\n"
  printf "  Always building. Always learning. ${GRN}${BLD}No ceiling.${RST}\n"
}
 
# ── Prompt loop ───────────────────────────
run_shell() {
  show_cursor
  print_name
 
  # Auto-run intro commands
  for cmd in "help" "whoami" "ls skills/" "ls links/"; do
    printf "  ${DIM}exvy@terminal ${MUT}~${RST} ${GRN}\$${RST}  ${BLU}${cmd}${RST}\n"
    echo ""
    case "$cmd" in
      "help")        cmd_help    ;;
      "whoami")      cmd_whoami  ;;
      "ls skills/")  cmd_skills  ;;
      "ls links/")   cmd_links   ;;
    esac
    echo ""
    sleep 0.15
  done
 
  # Interactive loop
  while true; do
    printf "  ${DIM}exvy@terminal ${MUT}~${RST} ${GRN}\$${RST}  "
    read -r input
    echo ""
 
    case "$input" in
      "help")
        cmd_help
        ;;
      "whoami")
        cmd_whoami
        ;;
      "ls skills/")
        cmd_skills
        ;;
      "ls links/")
        cmd_links
        ;;
      "cat bio.md")
        cmd_bio
        ;;
      "clear")
        clear_screen
        print_name
        ;;
      "exit"|"quit"|"q")
        printf "  ${MUT}goodbye.${RST}\n\n"
        show_cursor
        exit 0
        ;;
      "")
        ;;
      *)
        printf "  ${RED}bash: %s: command not found${RST}  ${MUT}— type ${BLU}help${MUT} for commands${RST}\n" "$input"
        ;;
    esac
    echo ""
  done
}
 
# ── Entry point ───────────────────────────
boot
clear_screen
run_shell
