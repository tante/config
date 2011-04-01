colorscheme desert
let redhat = filereadable("/etc/redhat-release")
if redhat
    set gfn=Inconsolata\ 10
else
    set gfn=Inconsolata\ 12
endif

