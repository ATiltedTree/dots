#!/bin/sh

echo "---------- ATiltedTree's Dots ----------"
echo "How do you want to install chezmoi?\n"

echo "1) Arch Packages"
echo "2) Binary download"
printf "%s" "#?"

read n
case $n in
1)
  echo "---------- Installing chezmoi via Arch Packages ----------"
  sudo pacman -Sy chezmoi
  echo "---------- Installing Dots ----------"
  chezmoi init --apply https://github.com/ATiltedTree/dots.git
  ;;
2)
  echo "---------- Installing chezmoi via Binary download ----------"
  curl -sfL https://git.io/chezmoi | sh
  echo "---------- Installing Dots ----------"
  ~/bin/chezmoi init --apply https://github.com/ATiltedTree/dots.git
  ;;
*) echo "invalid option" ;;
esac

echo "---------- Finished install ----------"
