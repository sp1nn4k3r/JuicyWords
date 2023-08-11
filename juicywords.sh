#!/bin/bash

echo -e "\033[32m"
echo "     @@@  @@@  @@@  @@@   @@@@@@@  @@@ @@@  @@@  @@@  @@@   @@@@@@   @@@@@@@   @@@@@@@    @@@@@@   "
echo "     @@@  @@@  @@@  @@@  @@@@@@@@  @@@ @@@  @@@  @@@  @@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@   "
echo "     @@!  @@!  @@@  @@!  !@@       @@! !@@  @@!  @@!  @@!  @@!  @@@  @@!  @@@  @@!  @@@  !@@       "
echo "     !@!  !@!  @!@  !@!  !@!       !@! @!!  !@!  !@!  !@!  !@!  @!@  !@!  @!@  !@!  @!@  !@!       "
echo "     !!@  @!@  !@!  !!@  !@!        !@!@!   @!!  !!@  @!@  @!@  !@!  @!@!!@!   @!@  !@!  !!@@!!    "
echo "     !!!  !@!  !!!  !!!  !!!         @!!!   !@!  !!!  !@!  !@!  !!!  !!@!@!    !@!  !!!   !!@!!!   "
echo "     !!:  !!:  !!!  !!:  :!!         !!:    !!:  !!:  !!:  !!:  !!!  !!: :!!   !!:  !!!       !:!  "
echo "!!:  :!:  :!:  !:!  :!:  :!:         :!:    :!:  :!:  :!:  :!:  !:!  :!:  !:!  :!:  !:!      !:!   "
echo "::: : ::  ::::: ::   ::   ::: :::     ::     :::: :: :::   ::::: ::  ::   :::   :::: ::  :::: ::   "
echo " : :::     :: :  :   :     :: :: :     :       :: :  : :     : :  :    :   : :  :: :  :   :: : :   "
echo -e "\033[0m"

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -p|--path)
            REPO_PATH="$2"
            shift
            shift
            ;;
        -o|--output)
            OUTPUT_FILE="$2"
            shift
            shift
            ;;
        *)
            shift
            ;;
    esac
done


SEARCH_TERM="[a-zA-Z_][a-zA-Z0-9_]*"


if [ -z "$REPO_PATH" ]; then
    echo "Usage: $0 -p <repository_path> [-o <output_file>]"
    exit 1
fi


RESULTS=$(find "$REPO_PATH" -type f -name "*.php" -exec grep -o "$SEARCH_TERM" {} + | sort -u)


if [ -n "$OUTPUT_FILE" ]; then
    echo "$RESULTS" | sort -u > "$OUTPUT_FILE"
else
    echo "$RESULTS" | sed 's/.*://' | sort -u | tee juicyresult
fi
