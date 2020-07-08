echo "---------- ATiltedTree's Dots ----------"
echo "How do you want to install chezmoi?"

select type in Arch Bin; do
  case $type in
  "Arch")
    echo "---------- Installing chezmoi via Arch ----------"
    sudo pacman -Sy chezmoi
    echo "---------- Installing Dots ----------"
    chezmoi init --apply https://github.com/ATiltedTree/dots.git
    ;;
  "Bin")
    echo "---------- Installing chezmoi via Bin ----------"
    curl -sfL https://git.io/chezmoi | sh
    echo "---------- Installing Dots ----------"
    ~/bin/chezmoi init --apply https://github.com/ATiltedTree/dots.git
    ;;
  esac
done

echo "---------- Finished install ----------"
