using DTWA
using JLD2


#function main(dim, N, number_repeats, Γ_deph, Γ_decay, Ω, α1,α2, α3, method, axis, dir)
function main(dim)
    #if method === "Ising"
        #a = parse(Int64,α1)
        #b = parse(Int64,α2)
        #c = parse(Int64,α3)
    #else
        #a = parse(Float64,α1)
        #b = parse(Float64,α2)
        #c = parse(Float64,α3)
    #end
    outfile = "results.jld2"
    #rv1, rv2= DTWA.repeated_euler(dim, N,number_repeats,Γ_deph, Γ_decay,Ω, [a,b,c], method, axis, dir)
    #jldsave(outfile;dim=dim, α=[a,b,c], Γ_deph=Γ_deph, Γ_decay=Γ_decay, Ω = Ω, axis = axis, dir = dir, collective_spin = rv1, average = rv2)
    jldsave(outfile; dim=dim)
end

#main([parse(Int64,ARGS[1]),parse(Int64,ARGS[2]),parse(Int64,ARGS[3])],parse(Int64,ARGS[4]),parse(Int64,ARGS[5]), parse(Float64,ARGS[6]), parse(Float64,ARGS[7]), parse(Float64,ARGS[8]), ARGS[9], ARGS[10], ARGS[11], ARGS[12], parse(Int64,ARGS[13]), parse(Int64,ARGS[14]))
#main([parse(Int64,ARGS[1]),parse(Int64,ARGS[2]),parse(Int64,ARGS[3])])
main([ARGS[1],ARGS[2],ARGS[3]])