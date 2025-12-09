#!/bin/bash

# Automatski Git push za Bibi nakit (ili bilo koji repo)
# Koristi se iz foldera projekta

echo "-------------------------------------------"
echo "   Git auto-push započet..."
echo "-------------------------------------------"

# Provera da li je folder Git repo
if [ ! -d ".git" ]; then
    echo "❌ Ovo nije Git repozitorijum!"
    exit 1
fi

# Dodaj sve fajlove
git add .

# Ako postoji argument, koristi ga kao commit poruku
if [ -z "$1" ]; then
    COMMIT_MSG="Ažuriranje sajta"
else
    COMMIT_MSG="$1"
fi

# Napravi commit
git commit -m "$COMMIT_MSG"

# Push na origin main
git push -u origin main

echo "-------------------------------------------"
echo "   ✔ SVE JE PUSHOVANO NA GITHUB"
echo "-------------------------------------------"
