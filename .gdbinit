set history save
set verbose off
set print pretty on
set print array on
set print array-indexes on
set python print-stack full
set disassembly-flavor intel

define r
    refresh
end

define nr
    n
    refresh
end

define sr
    s
    refresh
end

define nir
    ni
    refresh
end

define sir
    si
    refresh
end
