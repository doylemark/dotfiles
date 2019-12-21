# make aliases sudo-able
alias sudo="sudo "

# directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias c="cd ~/Desktop/Code"

# creation/deletion
del() {
   rm -rf $1
}


# mkdir and enter it

mcd () {
    mkdir -p $1
    cd $1
}

