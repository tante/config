colorscheme desert
let redhat = filereadable("/etc/redhat-release")
if redhat
    set gfn=Source\ Code\ Pro\ 10
else
    set gfn=Source\ Code\ Pro\ 12
endif

