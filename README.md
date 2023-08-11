# JuicyWords

Extract interesting words from repositories in PHP files. There are two basic versions available: one without output, which solely lists the relevant terms, and the version with output, which precisely lists the locations where the word has been extracted from.

# Usage

git clone *
chmod +x juicywords.sh
./juicywords.sh -p /path/to/repo
./juicywords.sh -p /path/to/repo -o result
